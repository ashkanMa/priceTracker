import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/core/network/netwrok_info.dart';
import 'package:price_tracker/features/price/data/datasources/active_symbols_remote_data_source.dart';
import 'package:price_tracker/features/price/data/repositories/active_symbols_repository_impl.dart';
import 'package:price_tracker/features/price/domain/usecases/active_symbols_use_case.dart';
import 'package:price_tracker/features/price/presentation/cubits/price_tracker_cubit/price_tracker_cubit.dart';
import 'package:price_tracker/features/price/presentation/cubits/socket_cubit/socket_cubit.dart';

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
