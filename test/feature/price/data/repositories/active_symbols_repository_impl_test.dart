import 'package:price_tracker/core/helper/exporties.dart';

class MockRemoteDataSource extends Mock
    implements ActiveSymbolsRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ActiveSymbolsRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late List<ActiveSymbol> totalActiveSymbolsList;
  late ActiveSymbolsModel activeSymbols;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ActiveSymbolsRepositoryImpl(
      activeSymbolsRemoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
    totalActiveSymbolsList = [];
    activeSymbols =
        ActiveSymbolsModel(msgType: '', activeSymbols: totalActiveSymbolsList);
  });

  void arrangeNewActiveSymbolsModelAndNetwork() {
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockRemoteDataSource.getActiveSymbols())
        .thenAnswer((_) => Future.value(activeSymbols));
  }

  group('getRandomNumberTrivia', () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        arrangeNewActiveSymbolsModelAndNetwork();
        // act
        repository.activeSymbols();
        // assert
        verify(() => mockNetworkInfo.isConnected);
      },
    );
  });
}
