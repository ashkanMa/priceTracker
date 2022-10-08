import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/helper/exporties.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}
