class EScooter {
  final String companyName;
  final double pricePerKm;
  final double latitude;
  final double longitude;
  final bool available;

  EScooter({
    required this.companyName,
    required this.pricePerKm,
    required this.latitude,
    required this.longitude,
    required this.available,
  });

  factory EScooter.fromJson(Map<String, dynamic> json) {
    return EScooter(
      companyName: json['companyName'],
      pricePerKm: json['pricePerKm'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      available: json['available'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'pricePerKm': pricePerKm,
      'latitude': latitude,
      'longitude': longitude,
      'available': available,
    };
  }
}
