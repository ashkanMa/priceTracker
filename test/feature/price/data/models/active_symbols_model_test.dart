import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:price_tracker/core/helper/exporties.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final List<ActiveSymbol> totalActiveSymbolsList = [];
  final ActiveSymbolsModel activeSymbols =
      ActiveSymbolsModel(msgType: '', activeSymbols: totalActiveSymbolsList);

  test(
    'should be a subclass of A ActiveSymbolsEntity',
    () async {
      // assert
      expect(activeSymbols, isA<ActiveSymbolsEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixture('active_symbol.json'));
        // act
        final result = ActiveSymbolsModel.fromJson(jsonMap);
        // assert
        expect(result, isA<ActiveSymbolsModel>());
      },
    );
  });

}
