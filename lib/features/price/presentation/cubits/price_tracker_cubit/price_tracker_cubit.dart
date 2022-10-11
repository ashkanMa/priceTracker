import 'package:price_tracker/core/helper/exporties.dart';
part 'price_tracker_state.dart';
class PriceTrackerCubit extends Cubit<PriceTrackerState> {
  PriceTrackerCubit({required this.activeSymbolsUseCase})
      : super(PriceTrackerInitial());
  final ActiveSymbolsUseCase activeSymbolsUseCase;
  List<ActiveSymbol> totalActiveSymbolsList = [];
  Set<String> marketsNameSet = {};
  void fetchActiveSymbols(
      {required String marketName, required String assetName}) {
    activeSymbolsUseCase
        .call(const ActiveSymbolsParams())
        .then((activeSymbolsList) {
      activeSymbolsList.fold((failure) {}, (activeSymbols) {
        totalActiveSymbolsList = activeSymbols.activeSymbols;
        for (var element in totalActiveSymbolsList) {
          marketsNameSet.add(element.marketDisplayName);
        }
        emit(PriceTrackerMarketsLoadedState(
            activeSymbolsList: const [],
            marketsList: marketsNameSet.toList(),
            marketName: marketName,
            assetName: assetName));
      });
    });
  }
  void changeMarket({required String marketName, required String assetName}) {
    List<ActiveSymbol> subMarketAssets = [];
    for (var element in totalActiveSymbolsList) {
      if(element.marketDisplayName==marketName){
        subMarketAssets.add(element);
      }
    }
    emit(PriceTrackerMarketsLoadedState(
        marketsList: marketsNameSet.toList(),
        activeSymbolsList: subMarketAssets,
        assetName: assetName,
        marketName: marketName));
  }
}
