import 'package:price_tracker/core/helper/exporties.dart';

part 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  SocketCubit() : super(SocketInitial());

  WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse(StringConstants.socketUrl),
  );

  void socketConnectionAndSendSymbol(String symbol) async {
    await closeConnection();
    await openConnection();
    emit(SocketConnectionLoading());
    await Future.delayed(const Duration(seconds: 1));
    channel.sink.add(jsonEncode({"ticks": symbol, "subscribe": 1}));
    emit(SocketConnectedState(channel: channel));
  }

  openConnection() async {
    channel = WebSocketChannel.connect(
      Uri.parse(StringConstants.socketUrl),
    );
  }

  closeConnection() async {
    channel.sink.close();
  }
}
