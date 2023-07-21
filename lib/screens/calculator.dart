import 'package:carbonsense/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
  DMOANDE
  
  Quanti chilometri guidi o utilizzi i mezzi pubblici in media ogni giorno?
  Qual è il consumo medio giornaliero di elettricità nella tua abitazione (in kilowatt-ora)?
  Quanto tempo trascorri utilizzando dispositivi elettronici (computer, smartphone, tablet) ogni giorno?
  Quali tipi di cibo consumi abitualmente? (In particolare, carne, latticini, cibo confezionato, ecc.)
  Hai un sistema di riscaldamento o raffreddamento nella tua abitazione? Se sì, a quale frequenza lo utilizzi?
  Quante ore trascorri in aereo ogni anno (calcola una media giornaliera)?
   */

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  Widget _buildNextButton() {
    return MaterialButton(
      color: kLightGreen4.withOpacity(.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Avanti",
            style: GoogleFonts.montserrat(
              color: kDarkGreen,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.car_crash,
          color: kDarkGreen,
        ),
        Text(
          "Quale mezzo usi di solito?",
          style: GoogleFonts.montserrat(
            color: kDarkGreen,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: _buildNextButton(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test", style: GoogleFonts.montserrat()),
      ),
      body: PageView(
        children: [
          _buildFirstPage(),
        ],
      ),
    );
  }
}
