import 'package:connectivity/connectivity.dart';

class InternetConnectionChecker {
  static Future<bool> hasConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    print('connectivityResult: $connectivityResult');
    if (connectivityResult == ConnectivityResult.none) {
      return false; // No internet connection
    } else {
      return true; // Internet connection available
    }
  }
}