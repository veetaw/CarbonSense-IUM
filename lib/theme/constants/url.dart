import 'package:carbonsense/.secret.dart';

const String kUrl = "https://api.waqi.info/feed";
String buildUrl(loc) => "$kUrl/$loc/?token=$kTokenSecret";
