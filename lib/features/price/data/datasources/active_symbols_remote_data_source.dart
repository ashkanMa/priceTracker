import 'package:flutter/services.dart' show rootBundle;

/// import 'package:http/http.dart' as http;
import 'package:price_tracker/core/helper/exporties.dart';

abstract class ActiveSymbolsRemoteDataSource {
  Future<ActiveSymbolsModel> getActiveSymbols();
}

class PriceRemoteDataSourceImpl implements ActiveSymbolsRemoteDataSource {
  @override
  Future<ActiveSymbolsModel> getActiveSymbols() {
    return getActiveSymbolsFormUrl('https://darolvekalehelena.com/trader2.php');
  }

  Future<ActiveSymbolsModel> getActiveSymbolsFormUrl(String url) async {
    ///   *** here because of server problems the remote fetch data is simulated but the result is the same
    /// final response = await http.post(Uri.parse(url));
    await Future.delayed(const Duration(seconds: 2));
    return ActiveSymbolsModel.fromJson(json.decode(await getJson()));

    /// if (response.statusCode == 200 ) {
    ///   return ActiveSymbolsModel.fromJson(json.decode(await getJson()));
    /// } else {
    ///   throw ServerException();
    /// }
  }

  Future<String> getJson() {
    return rootBundle.loadString(StringConstants.activeSymbolSimulatedUrl);
  }
}
