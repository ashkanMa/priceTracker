import 'package:dartz/dartz.dart';
import 'package:integration_test/integration_test.dart';
import 'package:price_tracker/core/helper/exporties.dart';

class MockActiveSymbolsUseCase extends Mock implements ActiveSymbolsUseCase {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockActiveSymbolsUseCase mockActiveSymbolsUseCase;
  late ActiveSymbolsParams params;
  late ActiveSymbolsEntity activeSymbols;
  setUp(() {
    params = const ActiveSymbolsParams();
    final Map<String, dynamic> jsonMap = {
      "active_symbols": [
        {
          "allow_forward_starting": 0,
          "display_name": "AUD Basket",
          "exchange_is_open": 1,
          "is_trading_suspended": 0,
          "market": "basket_index",
          "market_display_name": "Basket Indices",
          "pip": 0.001,
          "submarket": "forex_basket",
          "submarket_display_name": "Forex Basket",
          "symbol": "WLDAUD",
          "symbol_type": "forex_basket"
        }
      ],
      "echo_req": {"active_symbols": "brief", "product_type": "basic"},
      "msg_type": "active_symbols"
    };
    activeSymbols = ActiveSymbolsModel.fromJson(jsonMap);
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

  testWidgets('show main page', (tester) async {
    when(() => mockActiveSymbolsUseCase(params))
        .thenAnswer((_) async => Right(activeSymbols));
    await tester.pumpWidget(widgetUnderTest());
    await tester
        .pump(const Duration(seconds: 2)); // until this duration find indicator
    await tester.tap(find.byType(MarketDropDown));
    //------------------------------------
    await tester.ensureVisible(find.text("Basket Indices"));
    await tester.tap(find.text("Basket Indices"));
    await tester.pumpAndSettle();
    //------------------------------------
    // await tester.ensureVisible(find.byType(AssetDropDownWidget));
    // await tester.tap(find.byType(AssetDropDownWidget));
    // await tester.pumpAndSettle();
    // expect(find.text("WLDAUD"), findsOneWidget);
  });
}
