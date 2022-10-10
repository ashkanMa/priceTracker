import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/helper/exporties.dart';

class MockActiveSymbolsRepository extends Mock
    implements ActiveSymbolsRepository {}

void main() {
  late ActiveSymbolsUseCase useCase;
  late MockActiveSymbolsRepository mockActiveSymbolsRepository;
  ActiveSymbolsParams params = const ActiveSymbolsParams();
  List<ActiveSymbol> totalActiveSymbolsList = [];
  ActiveSymbolsEntity activeSymbols =
      ActiveSymbolsEntity(msgType: '', activeSymbols: totalActiveSymbolsList);
  setUp(() {
    mockActiveSymbolsRepository = MockActiveSymbolsRepository();
    useCase = ActiveSymbolsUseCase(repository: mockActiveSymbolsRepository);
  });

  test(
    'should get active symbols from the repository',
    () async {
      // arrange
      when(() => mockActiveSymbolsRepository.activeSymbols())
          .thenAnswer((_) async => Right(activeSymbols));
      // act
      final result = await useCase(params);
      // assert
      expect(result, Right(activeSymbols));
      verify(() => mockActiveSymbolsRepository.activeSymbols());
      verifyNoMoreInteractions(mockActiveSymbolsRepository);
    },
  );
}
