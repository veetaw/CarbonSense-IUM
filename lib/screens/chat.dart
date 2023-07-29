import 'package:carbonsense/components/chat_bubble.dart';
import 'package:carbonsense/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

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
              children: const [
                ChatBubble(text: "prova"),
                ChatBubble(
                  text: "AOAO",
                  type: ChatBubbleType.chatBubbleAvatarOnRight,
                ),
                ChatBubble(
                  text:
                      "prov ajkasjkdn askjdnaskjdnka jsndkjna sdkjansd kjnasdkjn askdj naskjdn kjasnd kjans a",
                  hasQuickQuestions: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 64,
            child: Placeholder(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
