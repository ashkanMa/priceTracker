import 'dart:math';

import 'package:price_tracker/features/price/domain/entities/active_symbols.dart';

class ActiveSymbolsModel extends ActiveSymbols {
  ActiveSymbolsModel({
    required int allowForwardStarting,
    required String displayName,
    required int exchangeIsOpen,
    required int isTradingSuspended,
    required String market,
    required String marketDisplayName,
    required double pip,
    required String subMarket,
    required String subMarketDisplayName,
    required String symbol,
    required String symbolType,
  }) : super(
            allowForwardStarting: allowForwardStarting,
            displayName: displayName,
            exchangeIsOpen: exchangeIsOpen,
            isTradingSuspended: isTradingSuspended,
            market: market,
            marketDisplayName: marketDisplayName,
            pip: pip,
            subMarket: subMarket,
            subMarketDisplayName: subMarketDisplayName,
            symbol: symbol,
            symbolType: symbolType
    );

  factory ActiveSymbolsModel.fromJson(Map<String,dynamic> json) {
    return ActiveSymbolsModel(
        allowForwardStarting: json['allow_forward_starting'],
        displayName: json['display_name'],
        exchangeIsOpen: json['exchange_is_open'],
        isTradingSuspended: json['is_trading_suspended'],
        market: json['market'],
        marketDisplayName: json['market_display_name'],
        pip: json['pip'],
        subMarket: json['submarket'],
        subMarketDisplayName: json['submarket_display_name'],
        symbol: json['symbol'],
        symbolType: json['symbol_type']
    );
  }

  Map<String,dynamic> toJson() {
    return{
      'allow_forward_starting' : allowForwardStarting,
      'display_name' : displayName,
      'exchange_is_open' : exchangeIsOpen,
      'is_trading_suspended' :isTradingSuspended,
      'market' : market,
      'market_display_name' : marketDisplayName,
      'pip' : pip,
      'submarket' : subMarket,
      'submarket_display_name':subMarketDisplayName,
      'symbol' : symbol,
      'symbol_type' : symbolType
    };
  }
}
