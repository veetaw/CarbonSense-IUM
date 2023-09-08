import 'package:carbonsense/components/chat_bubble.dart';
import 'package:carbonsense/components/custom_app_bar.dart';
import 'package:carbonsense/theme/constants/colors.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<ChatBubble> chat = [];

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  bool responded = true;
  bool typing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "CarbonB8",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [
                if (chat.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Non ci sono ancora messaggi nella chat",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: kDarkGreen,
                      ),
                    ),
                  )
                else
                  ...chat,
                if (typing)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "In attesa di risposta...",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controller,
                onSubmitted: _sendMessage,
                decoration: InputDecoration(
                  fillColor: kLightGreen4,
                  hintText: 'Scrivi qui la tua domanda',
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(value) {
    if (responded) {
      setState(() {
        controller.clear();
        chat.add(ChatBubble(
          text: value,
          type: ChatBubbleType.chatBubbleAvatarOnRight,
        ));
      });
      if (chat.length > 3) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 150,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
        );
      }

      askChatGpt(value);
    }
  }

  void askChatGpt(String value) {
    setState(() {
      typing = true;
      responded = false;
    });
    OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        const OpenAIChatCompletionChoiceMessageModel(
          content:
              "Sei un chatbot che aiuta gli utenti dell'app CarbonSense a diminuire la propria carbon footprint. Inoltre darai informazioni e risponderai ad eventuali dubbi che l'utente potrà avere essendo chiaro, sintetico ed amichevole. Se ti fa una domanda che non è nell'argomento, non rispondere.",
          role: OpenAIChatMessageRole.system,
        ),
        ...chat.map(
          (e) => OpenAIChatCompletionChoiceMessageModel(
            content: e.text,
            role: e.type == ChatBubbleType.chatBubbleAvatarOnLeft
                ? OpenAIChatMessageRole.assistant
                : OpenAIChatMessageRole.user,
          ),
        ),
      ],
    ).then((response) {
      setState(() {
        typing = false;
      });
      chat.add(
        ChatBubble(
          text: response?.choices.first.message?.content ?? "Errore...",
          type: ChatBubbleType.chatBubbleAvatarOnLeft,
          hasQuickQuestions: true,
          onQuickQuestionTap: _sendMessage,
        ),
      );
      setState(() {
        responded = true;
        if (chat.length > 3) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + 350,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
          );
        }
      });
    });
  }
}
