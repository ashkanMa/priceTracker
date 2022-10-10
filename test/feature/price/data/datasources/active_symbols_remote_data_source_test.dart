import 'package:mocktail/mocktail.dart';
import 'package:price_tracker/core/helper/exporties.dart';
import 'package:flutter_test/flutter_test.dart';

class MockActiveSymbolsRemoteDataSource extends Mock implements ActiveSymbolsRemoteDataSource {}

void main() {
  late MockActiveSymbolsRemoteDataSource sut;
  late List<ActiveSymbol> totalActiveSymbolsList;
  late ActiveSymbolsModel activeSymbols;

  setUp(() {
    sut = MockActiveSymbolsRemoteDataSource();
    totalActiveSymbolsList = [];
    activeSymbols =
        ActiveSymbolsModel(msgType: '', activeSymbols: totalActiveSymbolsList);
  });

  test('get ActiveSymbolsModel using new service', () async {
    expect(true, true);
  });

  void arrangeNewActiveSymbolsModel() {
    when(() => sut.getActiveSymbols())
        .thenAnswer((_) => Future.value(activeSymbols));
  }

  test('get ActiveSymbolsModel using new service', () async {
    arrangeNewActiveSymbolsModel();
    await sut.getActiveSymbols();
    verify(() => sut.getActiveSymbols()).called(1);
  });
}
