import 'package:carbonsense/components/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.youtube_searched_for,
              ),
              label: "S"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.youtube_searched_for,
              ),
              label: "S"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.youtube_searched_for,
              ),
              label: "S"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.youtube_searched_for,
              ),
              label: "S"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.youtube_searched_for,
              ),
              label: "S"),
        ],
      ),
      appBar: AppBar(
        title: Text("Test", style: GoogleFonts.montserrat()),
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
