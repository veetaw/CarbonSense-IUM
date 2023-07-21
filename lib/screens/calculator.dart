import 'package:carbonsense/components/custom_slider.dart';
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
  final PageController _pageController = PageController();

  Calculator({super.key});

  Widget _buildNextButton() {
    return MaterialButton(
      color: kLightGreen4.withOpacity(.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      onPressed: () {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Avanti",
            style: GoogleFonts.montserrat(
              color: kDarkGreen,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPage(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double _kSystemSpaceAround = 200;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: size.width,
        height: size.height - _kSystemSpaceAround,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.all(60),
              child: Icon(
                Icons.wallet_travel_outlined,
                color: kDarkGreen,
                size: 45,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Quanti kilometri percorri al giorno in media con la tua auto?",
                style: GoogleFonts.montserrat(
                  color: kDarkGreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const CustomSlider(
              padding: EdgeInsets.symmetric(vertical: 16),
              max: 200,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "E con i mezzi pubblici?",
                style: GoogleFonts.montserrat(
                  color: kDarkGreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const CustomSlider(
              padding: EdgeInsets.symmetric(vertical: 16),
              max: 200,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Quante ore trascorri in aereo all'anno? (circa)",
                style: GoogleFonts.montserrat(
                  color: kDarkGreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const CustomSlider(
              padding: EdgeInsets.symmetric(vertical: 16),
              max: 200,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: _buildNextButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.all(60),
          child: Icon(
            Icons.house,
            color: kDarkGreen,
            size: 45,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Qual è il consumo medio giornaliero di elettricità nella tua abitazione (in kilowatt-ora)?",
            style: GoogleFonts.montserrat(
              color: kDarkGreen,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const CustomSlider(
          padding: EdgeInsets.symmetric(vertical: 16),
          max: 200,
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: _buildNextButton(),
        ),
      ],
    );
  }

  Widget _buildThirdPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.all(60),
          child: Icon(
            Icons.smartphone,
            color: kDarkGreen,
            size: 45,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Quanto tempo trascorri utilizzando dispositivi elettronici (computer, smartphone, tablet) ogni giorno?",
            style: GoogleFonts.montserrat(
              color: kDarkGreen,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const CustomSlider(
          padding: EdgeInsets.symmetric(vertical: 16),
          round: false,
          steps: 48,
          max: 24,
        ),
        const Spacer(),
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
        centerTitle: false,
        title: Text(
          "CarbonSense Calc",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PageView(
          controller: _pageController,
          children: [
            _buildFirstPage(context),
            _buildSecondPage(),
            _buildThirdPage(),
          ],
        ),
      ),
    );
  }
}
