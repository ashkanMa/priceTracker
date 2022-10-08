import 'package:price_tracker/features/price/data/models/tick_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class GetPricesFromRemoteDataSource {
  Stream<TickModel> getActiveSymbols();
}


// class GetPricesFromRemoteDataSourceImp extends GetPricesFromRemoteDataSource{
//   @override
//   Stream<TickModel> getActiveSymbols() {
//     final channel = WebSocketChannel.connect(
//       Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089'),
//     );
//     channel.stream.listen((event) {
//       return TickModel.fromJson(json.decode(event.body));
//     });
//     throw UnimplementedError();
//   }
//
// }