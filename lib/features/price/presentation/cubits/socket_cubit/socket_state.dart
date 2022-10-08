part of 'socket_cubit.dart';

@immutable
abstract class SocketState extends Equatable{
  @override
  List<Object> get props => [];
}

class SocketInitial extends SocketState {}
class SocketConnectionLoading extends SocketState {}
class SocketConnectedState extends SocketState {
  final WebSocketChannel channel;
  SocketConnectedState({required this.channel});
}

class ChangeDataState extends SocketState {
  final String number;
  final Color color;
  ChangeDataState( {required this.number,required this.color});
}
