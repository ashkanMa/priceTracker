class ActiveSymbolsEntity {
  ActiveSymbolsEntity({
    required this.activeSymbols,
    required this.msgType,
  });

  List<ActiveSymbol> activeSymbols;
  String msgType;
}

class ActiveSymbol {
  ActiveSymbol({
    required this.allowForwardStarting,
    required this.displayName,
    required this.exchangeIsOpen,
    required this.isTradingSuspended,
    required this.market,
    required this.marketDisplayName,
    required this.pip,
    required this.submarket,
    required this.submarketDisplayName,
    required this.symbol,
    required this.symbolType,
  });

  int allowForwardStarting;
  String displayName;
  int exchangeIsOpen;
  int isTradingSuspended;
  String market;
  String marketDisplayName;
  double pip;
  String submarket;
  String submarketDisplayName;
  String symbol;
  String symbolType;

  factory ActiveSymbol.fromJson(Map<String, dynamic> json) => ActiveSymbol(
        allowForwardStarting: json["allow_forward_starting"],
        displayName: json["display_name"],
        exchangeIsOpen: json["exchange_is_open"],
        isTradingSuspended: json["is_trading_suspended"],
        market: json["market"],
        marketDisplayName: json["market_display_name"],
        pip: json["pip"].toDouble(),
        submarket: json["submarket"],
        submarketDisplayName: json["submarket_display_name"],
        symbol: json["symbol"],
        symbolType: json["symbol_type"],
      );
}
