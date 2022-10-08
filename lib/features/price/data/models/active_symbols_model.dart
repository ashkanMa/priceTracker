
import 'package:price_tracker/core/helper/exporties.dart';

ActiveSymbolsModel activeSymbolsFromJson(String str) =>
    ActiveSymbolsModel.fromJson(json.decode(str));

class ActiveSymbolsModel extends ActiveSymbols {
  ActiveSymbolsModel({
    required List<ActiveSymbol> activeSymbols,
    required String msgType,
  }) : super(activeSymbols: activeSymbols, msgType: msgType);

  factory ActiveSymbolsModel.fromJson(Map<String, dynamic> json) =>
      ActiveSymbolsModel(
        activeSymbols: List<ActiveSymbol>.from(
            json["active_symbols"].map((x) => ActiveSymbol.fromJson(x))),
        msgType: json["msg_type"],
      );
}
