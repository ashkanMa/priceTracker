import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/helper/exporties.dart';


abstract class TickRepository {
  Future<Either<Failure, ActiveSymbols>> ticks();
}
