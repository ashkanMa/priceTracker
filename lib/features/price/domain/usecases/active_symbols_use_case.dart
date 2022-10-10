import 'package:dartz/dartz.dart';

import 'package:price_tracker/core/helper/exporties.dart';

class ActiveSymbolsUseCase extends UseCase<ActiveSymbolsEntity, ActiveSymbolsParams> {
  final ActiveSymbolsRepository repository;

  ActiveSymbolsUseCase({required this.repository});

  @override
  Future<Either<Failure, ActiveSymbolsEntity>> call(
      ActiveSymbolsParams params) async {
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
  List<Object?> get props => [activeSymbols, productType];
}
