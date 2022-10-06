import 'dart:convert';
import 'dart:io';

import 'package:price_tracker/core/error/exceptions.dart';
import 'package:price_tracker/features/price/data/models/active_symbols_model.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

abstract class ActiveSymbolsRemoteDataSource {


  Future<ActiveSymbolsModel> getActiveSymbols();
}


class PriceRemoteDataSourceImpl implements ActiveSymbolsRemoteDataSource {

  @override
  Future<ActiveSymbolsModel> getActiveSymbols() {
    return _getActiveSymbolsFormUrl('https://darolvekalehelena.com/trader2.php');
  }


  Future<ActiveSymbolsModel> _getActiveSymbolsFormUrl(String url) async {
    final response =await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      return ActiveSymbolsModel.fromJson(json.decode(response.body));
    }else {
      throw ServerException();
    }

  }
  
}