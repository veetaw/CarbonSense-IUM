/* import 'package:flutter/material.dart';

enum QuestionType { normal, choice, multiNormal, multiChoice }

class Choice {
  final String choice;
  final IconData icon;

  Choice({
    required this.choice,
    required this.icon,
  });
}

class ChoiceQuestion<T> {
  List<T> choices;
  final String question;

  ChoiceQuestion({
    required this.question,
    required this.choices,
  });
}

class Question {
  final QuestionType type;

  final String? testo;
  final String? scala;
  final int? min;
  final int? max;
  final IconData icon;

  final List<Question>? additionalQuestions;
  final List<ChoiceQuestion>? choiceQuestions;

  Question({
    required this.type,
    this.testo,
    this.scala,
    this.min,
    this.max,
    required this.icon,
    this.additionalQuestions,
    this.choiceQuestions,
  });
}

List<Question> kQuestions = [
  Question(
    type: QuestionType.multiChoice,
    icon: Icons.drive_eta,
    choiceQuestions: [
      ChoiceQuestion<Choice>(
        question: "Che mezzo usi?",
        choices: [
          Choice(
            choice: "Auto",
            icon: Icons.drive_eta,
          ),
          Choice(
            choice: "Moto",
            icon: Icons.bike_scooter,
          ),
          Choice(
            choice: "Nessuno",
            icon: Icons.directions_walk_sharp,
          ),
        ],
      ),
    ],
    additionalQuestions: [
      Question(
        type: QuestionType.normal,
        icon: Icons.directions_walk,
        testo: "Quanti km fai al giorno?",
        scala: "km",
        min: 0,
        max: 250,
      ),
    ],
  )
];
 */
