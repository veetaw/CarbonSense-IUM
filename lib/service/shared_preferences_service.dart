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
}
