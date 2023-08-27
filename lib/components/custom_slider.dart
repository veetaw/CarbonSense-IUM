import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSlider extends StatefulWidget {
  final double max;
  final double min;
  final double? initialValue;
  final EdgeInsets padding;
  final bool round;
  final int? steps;
  final Function(double) onChange;

  const CustomSlider({
    super.key,
    required this.max,
    this.min = 0,
    this.initialValue = 0,
    this.padding = EdgeInsets.zero,
    this.round = false,
    this.steps,
    required this.onChange,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double? value;

  @override
  void initState() {
    value ??= (widget.initialValue ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "${widget.min.round()}",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Slider(
              min: widget.min,
              max: widget.max,
              value: value!,
              divisions: widget.steps,
              onChanged: (v) {
                widget.onChange(v);
                setState(() => value = v);
              },
              label: widget.round
                  ? value!.round().toString()
                  : value!.toStringAsFixed(1),
            ),
          ),
          Text(
            "${widget.max.round()}",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
