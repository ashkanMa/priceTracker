import 'package:price_tracker/core/helper/exporties.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure() : super('server error');

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}