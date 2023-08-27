import 'package:carbonsense/components/custom_app_bar.dart';
import 'package:carbonsense/constants/aqi.dart';
import 'package:carbonsense/service/aqi_api.dart';
import 'package:carbonsense/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AirQuality extends StatefulWidget {
  AirQuality({super.key});

  @override
  State<AirQuality> createState() => _AirQualityState();
}

class _AirQualityState extends State<AirQuality> {
  final TextEditingController controller = TextEditingController();

  int? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Controlla la qualità dell'aria della città in cui vuoi andare",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: kDarkGreen,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      if (controller.text.isNotEmpty &&
                          controller.text.length >= 2) {
                        try {
                          AqiApi().getAirQuality(controller.text).then(
                                (data) => setState(
                                  () {
                                    value = data.aqi;
                                  },
                                ),
                              );
                        } on Exception {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Errore nel caricamento per la città indicata.",
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: kLightGreen4.withOpacity(0.5),
                      child: const Icon(
                        FontAwesomeIcons.search,
                        color: kDarkGreen,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                fillColor: kLightGreen4,
                prefixIcon: const Icon(
                  Icons.location_on,
                  color: kDarkGreen, // kDarkGreen
                ),
                hintText: 'Dove vuoi andare?',
                hintStyle: GoogleFonts.montserrat(color: Colors.grey[800]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
          ),
          if (value != null) IndicatorRow(value: value!),
          if (value != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                kAqiDescription[getActiveIndex(value!)],
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: kDarkGreen,
                ),
              ),
            )
        ],
      ),
    );
  }
}

class IndicatorRow extends StatelessWidget {
  final int value;

  const IndicatorRow({
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int activeIndex = getActiveIndex(value);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildIndicator(
              color: kLightGreen4,
              active: activeIndex == 0,
            ),
            _buildIndicator(
              color: kLightGreen3,
              active: activeIndex == 1,
            ),
            _buildIndicator(
              color: kLightGreen1,
              active: activeIndex == 2,
            ),
            _buildIndicator(
              color: kLightGreen2,
              active: activeIndex == 3,
            ),
            _buildIndicator(
              color: kYellow,
              active: activeIndex == 4,
            ),
            _buildIndicator(
              color: kRed,
              active: activeIndex == 5,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildIndicator({
    required Color color,
    required bool active,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: active
              ? Center(
                  child: Text(
                    value.toString(),
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, color: kDarkGreen),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

int getActiveIndex(int value) {
  if (value <= 50) return 0;
  if (value <= 100) return 1;
  if (value <= 150) return 2;
  if (value <= 200) return 3;
  if (value <= 300) return 4;
  return 5;
}
