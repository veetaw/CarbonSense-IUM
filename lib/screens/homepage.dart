import 'package:carbonsense/models/carbon_footprint.dart';
import 'package:carbonsense/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  final CarbonFootprintResult? carbonFootprint;
  const Homepage({super.key, this.carbonFootprint});

  CarbonFootprintResult getCarbonFootprint() {
    // TODO: either gets it from the [carbonFootprint] field or from somewhere
    // in the db
    return carbonFootprint ?? CarbonFootprintResult(score: 5.6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Image.asset("assets/logo.png"),
        title: Text(
          "La tua impronta",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [Expanded(child: Container())],
          ),
          const Expanded(
            child: Icon(
              FontAwesomeIcons.earthEurope,
              color: kDarkGreen,
              size: 200,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Il risultato del calcolo del tuo carbon foorprint è:",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${getCarbonFootprint().score} kg/giorno",
                  style: GoogleFonts.montserrat(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  getCarbonFootprint().isAvg()
                      ? "Sei nella media europea!"
                      : "Non sei nella media europea!",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
