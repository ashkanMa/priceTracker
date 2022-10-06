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

  void fetchActiveSymbols() {
    activeSymbolsUseCase
        .call(const ActiveSymbolsParams())
        .then((activeSymbolsList) {
      activeSymbolsList.fold((failure) => print(""), (activeSymbols) {
        Set<String> marketsName = {};
        for (var element in activeSymbols.activeSymbols) {
          marketsName.add(element.marketDisplayName);
        }
        print(marketsName.toList());
        emit(PriceTrackerMarketsLoadedState(activeSymbols.activeSymbols));
      });
    });
  }
}
