import 'package:carbonsense/theme/constants/colors.dart';
import 'package:flutter/material.dart';

class Forum extends StatelessWidget {
  const Forum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Com’è il tuo stato d’animo dopo aver scoperto la tua impronta di carbonio?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: kDarkGreen,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _sentimentCard("😎 FIERO DI ME STESSO"),
                  _sentimentCard("😔 VOGLIO MIGLIORARE"),
                  _sentimentCard("😐 INDIFFERENTE"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _sentimentCard(String text, {Function()? onTap}) {
    return Card(
      elevation: 0,
      color: kLightGreen4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: kDarkGreen,
            ),
          ),
        ),
      ),
    );
  }
}
