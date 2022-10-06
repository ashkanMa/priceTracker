import 'package:equatable/equatable.dart';

class ActiveSymbols extends Equatable {

  int? allowForwardStarting;
  String? displayName;
  int? exchangeIsOpen;
  int? isTradingSuspended;
  String? market;
  String? marketDisplayName;
  double? pip;
  String? subMarket;
  String? subMarketDisplayName;
  String? symbol;
  String? symbolType;

  ActiveSymbols({
      this.allowForwardStarting, 
      this.displayName, 
      this.exchangeIsOpen, 
      this.isTradingSuspended, 
      this.market, 
      this.marketDisplayName, 
      this.pip, 
      this.subMarket,
      this.subMarketDisplayName,
      this.symbol, 
      this.symbolType,});

  @override

  List<Object?> get props => [
    allowForwardStarting,
    displayName,
    exchangeIsOpen,
    isTradingSuspended,
    market,
    marketDisplayName,
    pip,
    subMarket,
    subMarketDisplayName,
    symbol,
    symbolType
  ];




}