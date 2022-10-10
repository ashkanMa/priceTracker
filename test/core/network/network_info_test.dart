import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:price_tracker/core/helper/exporties.dart';

class MockDataConnectionChecker extends Mock implements Connectivity {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('check connection', () {
    test(
      'should forward the call to Connectivity.ConnectivityResult as true',
      () async {
        // arrange
        var tHasConnectionFuture = Future.value(ConnectivityResult.wifi);
        when(() => mockDataConnectionChecker.checkConnectivity())
            .thenAnswer((_) => tHasConnectionFuture);
        // act
        var result = await networkInfo.isConnected;
        // assert
        verify(() => mockDataConnectionChecker.checkConnectivity());
        final expected = await Future.value(true);
        expect(result, expected);
      },
    );

    test(
      'should forward the call to Connectivity.ConnectivityResult as false',
      () async {
        // arrange
        var tHasConnectionFuture = Future.value(ConnectivityResult.none);
        when(() => mockDataConnectionChecker.checkConnectivity())
            .thenAnswer((_) => tHasConnectionFuture);
        // act
        var result = await networkInfo.isConnected;
        // assert
        verify(() => mockDataConnectionChecker.checkConnectivity());
        final expected = await Future.value(false);
        expect(result, expected);
      },
    );
  });
}
