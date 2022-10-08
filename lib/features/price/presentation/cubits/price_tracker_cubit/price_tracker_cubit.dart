import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:price_tracker/features/price/domain/entities/active_symbols.dart';
import 'package:price_tracker/features/price/domain/usecases/active_symbols_use_case.dart';
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
        print(marketsNameSet.toList());
        emit(PriceTrackerMarketsLoadedState(
            activeSymbolsList: [],
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
