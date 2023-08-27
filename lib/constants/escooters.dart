import 'package:carbonsense/models/escooter.dart';

List<Map<String, dynamic>> _json = [
  {
    "companyName": "EcoScoot",
    "pricePerKm": 0.15,
    "latitude": 40.768523,
    "longitude": 14.779777,
    "available": true
  },
  {
    "companyName": "GreenRide",
    "pricePerKm": 0.12,
    "latitude": 40.765432,
    "longitude": 14.781234,
    "available": true
  },
  {
    "companyName": "ScootEase",
    "pricePerKm": 0.18,
    "latitude": 40.769876,
    "longitude": 14.776543,
    "available": false
  },
  {
    "companyName": "EcoMoto",
    "pricePerKm": 0.14,
    "latitude": 40.770987,
    "longitude": 14.780123,
    "available": true
  },
  {
    "companyName": "ZippyScooters",
    "pricePerKm": 0.16,
    "latitude": 40.766789,
    "longitude": 14.778901,
    "available": true
  },
  {
    "companyName": "GoGreen",
    "pricePerKm": 0.13,
    "latitude": 40.764321,
    "longitude": 14.777890,
    "available": true
  },
  {
    "companyName": "EcoWheel",
    "pricePerKm": 0.17,
    "latitude": 40.767890,
    "longitude": 14.782345,
    "available": true
  },
  {
    "companyName": "SwiftScoots",
    "pricePerKm": 0.11,
    "latitude": 40.769012,
    "longitude": 14.779012,
    "available": true
  },
  {
    "companyName": "ElectroGlide",
    "pricePerKm": 0.19,
    "latitude": 40.765678,
    "longitude": 14.780678,
    "available": true
  },
  {
    "companyName": "PowerRide",
    "pricePerKm": 0.15,
    "latitude": 40.768901,
    "longitude": 14.778345,
    "available": true
  }
];

List<EScooter> scooters = _json.map((e) => EScooter.fromJson(e)).toList();
