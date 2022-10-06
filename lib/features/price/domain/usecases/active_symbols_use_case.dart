import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:price_tracker/core/error/failure.dart';
import 'package:price_tracker/core/models/base_use_case.dart';
import 'package:price_tracker/features/price/domain/entities/active_symbols.dart';
import 'package:price_tracker/features/price/domain/repositories/active_symbols_repository.dart';

class ActiveSymbolsUseCase extends UseCase<ActiveSymbols,ActiveSymbolsParams> {

  final ActiveSymbolsRepository repository;

  ActiveSymbolsUseCase({required this.repository});
  @override
  Future<Either<Failure, ActiveSymbols>> call(ActiveSymbolsParams params) async {
    final result = await repository.activeSymbols();
    return result;
  }

}


class ActiveSymbolsParams extends Equatable {
  final String activeSymbols;
  final String productType;

  const ActiveSymbolsParams(
      {this.activeSymbols = 'brief', this.productType = 'basic'});
  @override
  List<Object?> get props => [activeSymbols,productType];

}