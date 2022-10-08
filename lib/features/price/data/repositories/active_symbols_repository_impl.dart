import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/helper/exporties.dart';

typedef Future<ActiveSymbols> _GetActiveSymbols();

class ActiveSymbolsRepositoryImpl extends ActiveSymbolsRepository {
  final ActiveSymbolsRemoteDataSource activeSymbolsRemoteDataSource;
  final NetworkInfo networkInfo;

  ActiveSymbolsRepositoryImpl(
      {required this.activeSymbolsRemoteDataSource, required this.networkInfo});

  Future<Either<Failure, ActiveSymbols>> _getSymbols(
      _GetActiveSymbols getActiveSymbols) async {
    if (await networkInfo.isConnected) {
      try {
        final activeSymbols = await getActiveSymbols();
        return Right(activeSymbols);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ActiveSymbols>> activeSymbols() async {
    return await _getSymbols(
        () => activeSymbolsRemoteDataSource.getActiveSymbols());
  }
}
