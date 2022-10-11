import 'package:dartz/dartz.dart';
import 'package:price_tracker/core/helper/exporties.dart';

typedef _GetActiveSymbols = Future<ActiveSymbolsEntity> Function();

class ActiveSymbolsRepositoryImpl extends ActiveSymbolsRepository {
  final ActiveSymbolsRemoteDataSource activeSymbolsRemoteDataSource;
  final NetworkInfo networkInfo;

  ActiveSymbolsRepositoryImpl(
      {required this.activeSymbolsRemoteDataSource, required this.networkInfo});

  Future<Either<Failure, ActiveSymbolsEntity>> _getSymbols(
      _GetActiveSymbols getActiveSymbols) async {
    if (await networkInfo.isConnected) {
      try {
        final activeSymbols = await getActiveSymbols();
        return Right(activeSymbols);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ActiveSymbolsEntity>> activeSymbols() async {
    return await _getSymbols(
        () => activeSymbolsRemoteDataSource.getActiveSymbols());
  }
}
