import 'package:price_tracker/core/helper/exporties.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Future<ConnectivityResult> get networkType;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    var connectivityResult = await (connectivity.checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  @override
  Future<ConnectivityResult> get networkType =>
      Connectivity().checkConnectivity();
}

