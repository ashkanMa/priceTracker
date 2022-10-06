import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/error/failure.dart';
import 'package:price_tracker/features/price/domain/entities/active_symbols.dart';
abstract class ActiveSymbolsRepository {

  Future<Either<Failure,ActiveSymbols>> activeSymbols();
}