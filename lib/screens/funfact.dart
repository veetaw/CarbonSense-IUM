import 'package:carbonsense/constants/fun_facts.dart';
import 'package:carbonsense/extensions/random_item_list.dart';
import 'package:carbonsense/theme/constants/colors.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class FunFact extends StatefulWidget {
  const FunFact({super.key});

  @override
  State<FunFact> createState() => _FunFactState();
}

class _FunFactState extends State<FunFact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test", style: GoogleFonts.montserrat()),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          decoration: BoxDecoration(
            color: kLightGreen4,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => setState(() {}),
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: const Icon(
                    Icons.push_pin_rounded,
                    color: kDarkGreen,
                    size: 35,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
              ),
              Text(
                "FUN FACT",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  color: kDarkGreen,
                  fontSize: 26,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
              ),
              Text(
                kFunFacts.random(),
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: kDarkGreen,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
