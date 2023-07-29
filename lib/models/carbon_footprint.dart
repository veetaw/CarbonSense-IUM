const double _kEuAvg = 10.0; // TODO:

class CarbonFootprintResult {
  final double score;

  CarbonFootprintResult({
    required this.score,
  });

  bool isAvg() => (score - _kEuAvg).abs() <= 2;
}
