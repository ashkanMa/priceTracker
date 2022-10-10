import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:price_tracker/core/error/failure.dart';
import 'package:price_tracker/core/models/base_use_case.dart';
import 'package:price_tracker/features/price/domain/entities/active_symbols_entity.dart';
import 'package:price_tracker/features/price/domain/repositories/tick_repository.dart';

class GetTickUseCase extends UseCase<ActiveSymbolsEntity,SocketParams> {

  final TickRepository repository;

  GetTickUseCase({required this.repository});
  @override
  Future<Either<Failure, ActiveSymbolsEntity>> call(SocketParams params) async {
    final result = await repository.ticks();
    return result;
  }
}


class SocketParams extends Equatable {
  final String ticks;
  final int subscribe;

  const SocketParams(
      {this.ticks = "R_50", this.subscribe = 1});
  @override
  List<Object?> get props => [ticks,subscribe];

}