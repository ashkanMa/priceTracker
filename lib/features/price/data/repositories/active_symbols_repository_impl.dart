import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/error/exceptions.dart';
import 'package:price_tracker/core/error/failure.dart';
import 'package:price_tracker/core/network/netwrok_info.dart';
import 'package:price_tracker/features/price/data/datasources/active_symbols_remote_data_source.dart';
import 'package:price_tracker/features/price/domain/entities/active_symbols.dart';
import 'package:price_tracker/features/price/domain/repositories/active_symbols_repository.dart';

typedef Future<ActiveSymbols> _GetActiveSymbols();
class ActiveSymbolsRepositoryImpl extends ActiveSymbolsRepository {

  final  ActiveSymbolsRemoteDataSource activeSymbolsRemoteDataSource;
  final NetworkInfo networkInfo;

  ActiveSymbolsRepositoryImpl({required this.activeSymbolsRemoteDataSource,required this.networkInfo});



  Future<Either<Failure,ActiveSymbols>> _getSymbols(_GetActiveSymbols getActiveSymbols)async {
    if (await networkInfo.isConnected) {
      try {
        final activeSymbols = await getActiveSymbols();
        activeSymbolsRemoteDataSource.getActiveSymbols();
        return Right(activeSymbols);
      }on ServerException {
        return Left(ServerFailure());
      }
    }else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ActiveSymbols>> activeSymbols() async {
    return await _getSymbols(() => activeSymbolsRemoteDataSource.getActiveSymbols());
  }



}