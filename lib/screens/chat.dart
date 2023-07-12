import 'package:carbonsense/components/chat_bubble.dart';
import 'package:flutter/material.dart';

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
        title: const Text("Test"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  child: ChatBubble(text: "prova"),
                ),
              ],
            ),
          ),
          Container(
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
