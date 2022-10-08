import 'package:price_tracker/core/helper/exporties.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<PriceTrackerCubit>(
        create: (context) => PriceTrackerCubit(
            activeSymbolsUseCase: ActiveSymbolsUseCase(
                repository: ActiveSymbolsRepositoryImpl(
                    activeSymbolsRemoteDataSource: PriceRemoteDataSourceImpl(),
                    networkInfo: NetworkInfoImpl(Connectivity()))))),

    BlocProvider<SocketCubit>(
        create: (context) => SocketCubit()),
    // .
    // .
    // .
    // other blocs or cubits...
  ];
}
