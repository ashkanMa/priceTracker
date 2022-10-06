part of 'price_tracker_cubit.dart';

@immutable
abstract class PriceTrackerState extends Equatable {
  @override
  List<Object> get props => [];
}

class PriceTrackerInitial extends PriceTrackerState {}

class PriceTrackerMarketsLoadedState extends PriceTrackerState {
  final List<ActiveSymbol> activeSymbolsList;

  PriceTrackerMarketsLoadedState(this.activeSymbolsList);

  @override
  List<Object> get props => [activeSymbolsList];
}
