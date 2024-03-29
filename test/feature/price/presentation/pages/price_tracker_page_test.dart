import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/helper/exporties.dart';

class MockActiveSymbolsUseCase extends Mock implements ActiveSymbolsUseCase {}

void main() {
  late MockActiveSymbolsUseCase mockActiveSymbolsUseCase;
  ActiveSymbolsParams params = const ActiveSymbolsParams();
  List<ActiveSymbol> totalActiveSymbolsList = [];
  ActiveSymbolsEntity activeSymbols =
      ActiveSymbolsEntity(msgType: '', activeSymbols: totalActiveSymbolsList);
  setUp(() {
    mockActiveSymbolsUseCase = MockActiveSymbolsUseCase();
  });
  List<BlocProvider> providers = [
    BlocProvider<PriceTrackerCubit>(
        create: (context) =>
            PriceTrackerCubit(activeSymbolsUseCase: mockActiveSymbolsUseCase)),
    BlocProvider<SocketCubit>(create: (context) => SocketCubit()),
  ];

  Widget widgetUnderTest() {
    return MultiBlocProvider(
        providers: providers,
        child: const MaterialApp(
          title: StringConstants.appTitle,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ));
  }

  testWidgets('loading is displayed', (WidgetTester tester) async {
    when(() => mockActiveSymbolsUseCase(params))
        .thenAnswer((_) async => Right(activeSymbols));
    await tester.pumpWidget(widgetUnderTest());
    expect(find.byKey(const Key(StringConstants.loading)), findsOneWidget);
  });

  testWidgets('show main page', (tester) async {
    when(() => mockActiveSymbolsUseCase(params))
        .thenAnswer((_) async => Right(activeSymbols));
    await tester.pumpWidget(widgetUnderTest());
    await tester
        .pump(const Duration(seconds: 2)); // until this duration find indicator
    expect(find.byKey(const Key(StringConstants.appBarKey)), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(MarketDropDown), findsOneWidget);
    expect(find.byType(AssetDropDownWidget), findsOneWidget);
    expect(find.byType(TickWidget), findsOneWidget);
  });
}
