class AqiResponse {
  final String status;
  final AqiData data;

  AqiResponse({required this.status, required this.data});

  factory AqiResponse.fromJson(Map json) {
    return AqiResponse(
      status: json['status'],
      data: AqiData.fromJson(json['data']),
    );
  }
}

class AqiData {
  final int aqi;
  final String dominantPol;

  AqiData({
    required this.aqi,
    required this.dominantPol,
  });

  factory AqiData.fromJson(Map json) {
    return AqiData(
      aqi: json['aqi'],
      dominantPol: json['dominentpol'],
    );
  }
}
