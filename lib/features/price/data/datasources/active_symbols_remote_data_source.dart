import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:price_tracker/core/error/exceptions.dart';
import 'package:price_tracker/features/price/data/models/active_symbols_model.dart';

abstract class ActiveSymbolsRemoteDataSource {
  Future<ActiveSymbolsModel> getActiveSymbols();
}

class PriceRemoteDataSourceImpl implements ActiveSymbolsRemoteDataSource {
  @override
  Future<ActiveSymbolsModel> getActiveSymbols() {
    return _getActiveSymbolsFormUrl(
        'https://darolvekalehelena.com/trader2.php');
  }

  Future<ActiveSymbolsModel> _getActiveSymbolsFormUrl(String url) async {
    final response = await http.post(Uri.parse(url));
    await Future.delayed(const Duration(seconds: 2));
    return ActiveSymbolsModel.fromJson(json.decode(await getJson()));
    if (response.statusCode == 200 || response.statusCode != 200) {
      return ActiveSymbolsModel.fromJson(json.decode(await getJson()));
    } else {
      throw ServerException();
    }
  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/data/markets.json');
  }
}
