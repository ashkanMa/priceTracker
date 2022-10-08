import 'package:price_tracker/core/helper/exporties.dart';

abstract class Failure extends Equatable {
  String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure() : super('server error');

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}