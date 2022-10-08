import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  SocketCubit() : super(SocketInitial());

  WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089'),
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
      Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089'),
    );
  }
  closeConnection() async {
    channel.sink.close();
  }
}
