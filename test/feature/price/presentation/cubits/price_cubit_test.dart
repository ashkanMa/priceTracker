import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/helper/exporties.dart';

class MockActiveSymbolsUseCase extends Mock implements ActiveSymbolsUseCase {}

void main() {
  late PriceTrackerCubit priceTrackerCubit;
  late MockActiveSymbolsUseCase mockActiveSymbolsUseCase;
  ActiveSymbolsParams params = const ActiveSymbolsParams();
  List<ActiveSymbol> totalActiveSymbolsList = [];
  ActiveSymbolsEntity activeSymbols =
      ActiveSymbolsEntity(msgType: '', activeSymbols: totalActiveSymbolsList);
  setUp(() {
    mockActiveSymbolsUseCase = MockActiveSymbolsUseCase();
    priceTrackerCubit =
        PriceTrackerCubit(activeSymbolsUseCase: mockActiveSymbolsUseCase);
  });

  tearDown(() {
    priceTrackerCubit.close();
  });

  group("initial lists value should be Empty", () {
    test('priceTrackerCubit should have initial state', () {
      expect(priceTrackerCubit.state.runtimeType, PriceTrackerInitial);
      // expect(priceTrackerCubit.totalActiveSymbolsList, equals([]));
    });

    test('initial marketsNameSet value should be Empty', () {
      expect(priceTrackerCubit.marketsNameSet, equals([]));
      // expect(priceTrackerCubit.totalActiveSymbolsList, equals([]));
    });

    test('initial totalActiveSymbolsList value should be Empty', () {
      expect(priceTrackerCubit.totalActiveSymbolsList, equals([]));
    });
  });

  group('PriceTrackerCubit', () {
    blocTest<PriceTrackerCubit, PriceTrackerState>(
        'when attempt to get activeSymbols',
        build: () =>
            PriceTrackerCubit(activeSymbolsUseCase: mockActiveSymbolsUseCase),
        // <-- Creating an instance of Cubit
        act: (cubit) {
          when(() => mockActiveSymbolsUseCase(params))
              .thenAnswer((_) async => Right(activeSymbols));
          cubit.fetchActiveSymbols(marketName: '', assetName: '');
        },
        expect: () => [
              isA<PriceTrackerMarketsLoadedState>(),
            ],
        verify: (cubit) {
          ActiveSymbolsParams params = const ActiveSymbolsParams();
          verify(() => mockActiveSymbolsUseCase.call(params)).called(1);
        });

    blocTest<PriceTrackerCubit, PriceTrackerState>(
      'when attempt to change market',
      build: () =>
          PriceTrackerCubit(activeSymbolsUseCase: mockActiveSymbolsUseCase),
      // <-- Creating an instance of Cubit
      act: (cubit) {
        when(() => mockActiveSymbolsUseCase(params))
            .thenAnswer((_) async => Right(activeSymbols));
        cubit.changeMarket(marketName: '', assetName: '');
      },
      expect: () => [
        isA<PriceTrackerMarketsLoadedState>(),
      ],
    );
  });
}
