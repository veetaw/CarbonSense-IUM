import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;

  const ChatBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(1),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(text),
        ),
      ),
    );
  }
}
