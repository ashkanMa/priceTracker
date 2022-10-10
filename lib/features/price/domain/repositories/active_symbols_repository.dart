import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/helper/exporties.dart';

abstract class ActiveSymbolsRepository {

  Future<Either<Failure,ActiveSymbolsEntity>> activeSymbols();
}