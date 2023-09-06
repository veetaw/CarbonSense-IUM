import 'package:shared_preferences/shared_preferences.dart';

/// Utility class for SharedPreferences.
/// from https://github.com/C01-GlucoseGuardian/mobileApp/blob/master/lib/services/shared_preferences_service.dart
///
/// It creates a singleton in order to have it in the whole widget tree without
/// calling SharedPreferences.getInstance() multiple times.
/// Easily modifiable to hold maybe a volatile cache of the preferences.
class SharedPreferenceService {
  /// Contains the SharedPreferences instance field,
  /// created by [SharedPreferenceService.init]
  static late final SharedPreferences _instance;

  static const String _kFirstTimeOpeningApp = "firstTimeOpeningApp";
  static const String _kCarbonFootprintIndex = "carbonFootprintIndex";
  static const String _kKmAutoNormalized = "kmAutoNormalized";
  static const String _kOreAereoNormalized = "oreAereoNormalized";
  static const String _kKmMezziNormalized = "kmMezziNormalized";
  static const String _kKwhCasaNormalized = "kwhCasaNormalized";
  static const String _kOreUsoTabletNormalized = "oreUsoTabletNormalized";

  /// Creates [SharedPreferenceService._instance], this should be called in the
  /// main function after `WidgetsFlutterBinding.ensureInitialized()`
  static Future<SharedPreferences> init() async =>
      _instance = await SharedPreferences.getInstance();

  /// returns true if the user is opening the app for
  /// the first time (fresh install)
  static bool get firstTimeOpeningApp =>
      _instance.getBool(_kFirstTimeOpeningApp) ?? true;

  /// This should be set to false after the landing page only once
  static set firstTimeOpeningApp(bool value) =>
      _instance.setBool(_kFirstTimeOpeningApp, value);

  static double get carbonFootprintResult =>
      _instance.getDouble(_kCarbonFootprintIndex) ?? 0;

  static set carbonFootprintResult(double value) =>
      _instance.setDouble(_kCarbonFootprintIndex, value);

  static double get kmAutoNormalized =>
      _instance.getDouble(_kKmAutoNormalized) ?? 0;
  static set kmAutoNormalized(double value) =>
      _instance.setDouble(_kKmAutoNormalized, value);

  static double get kmMezziNormalized =>
      _instance.getDouble(_kKmMezziNormalized) ?? 0;
  static set kmMezziNormalized(double value) =>
      _instance.setDouble(_kKmMezziNormalized, value);

  static double get kwhCasaNormalized =>
      _instance.getDouble(_kKwhCasaNormalized) ?? 0;
  static set kwhCasaNormalized(double value) =>
      _instance.setDouble(_kKwhCasaNormalized, value);

  static double get oreUsoTabletNormalized =>
      _instance.getDouble(_kOreUsoTabletNormalized) ?? 0;
  static set oreUsoTabletNormalized(double value) =>
      _instance.setDouble(_kOreUsoTabletNormalized, value);

  static double get oreAereoNormalized =>
      _instance.getDouble(_kOreAereoNormalized) ?? 0;
  static set oreAereoNormalized(double value) =>
      _instance.setDouble(_kOreAereoNormalized, value);
}
