part of 'price_tracker_cubit.dart';

@immutable
abstract class PriceTrackerState extends Equatable {
  @override
  List<Object> get props => [];
}

class PriceTrackerInitial extends PriceTrackerState {}

class PriceTrackerMarketsLoadedState extends PriceTrackerState {
  final List<ActiveSymbol> activeSymbolsList;
  final List<String> marketsList;
  final String marketName;
  final String assetName;

  PriceTrackerMarketsLoadedState(
      {required this.activeSymbolsList,
      required this.marketsList,
      required this.marketName,
      required this.assetName});

  @override
  List<Object> get props => [activeSymbolsList, marketsList];
}

// class MarketChangeState extends PriceTrackerState {
//   final List<ActiveSymbol> activeSymbolsList;
//   final List<String> marketsList;
//   final String marketName;
//   final String assetName;
//
//   MarketChangeState(
//       {required this.activeSymbolsList,
//         required this.marketsList,
//         required this.marketName,
//         required this.assetName});
//
//   @override
//   List<Object> get props => [activeSymbolsList, marketsList];
// }
