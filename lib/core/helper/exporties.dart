//libraries
export 'package:web_socket_channel/web_socket_channel.dart';
export 'dart:convert';
export 'package:bloc/bloc.dart';
export 'package:equatable/equatable.dart';
export 'package:meta/meta.dart';
export 'package:flutter/material.dart';
export 'package:equatable/equatable.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';

//core
export 'package:price_tracker/core/helper/string_const.dart';
export 'package:price_tracker/core/network/netwrok_info.dart';
export 'package:price_tracker/core/router/app_router.dart';
export 'package:price_tracker/core/helper/numbers_const.dart';
export 'package:price_tracker/core/error/failure.dart';
export 'package:price_tracker/core/models/base_use_case.dart';
export 'package:price_tracker/core/error/exceptions.dart';

//data
export 'package:price_tracker/features/price/data/datasources/active_symbols_remote_data_source.dart';
export 'package:price_tracker/features/price/data/repositories/active_symbols_repository_impl.dart';
export 'package:price_tracker/features/price/data/models/active_symbols_model.dart';

//domain
export 'package:price_tracker/features/price/domain/entities/active_symbols_entity.dart';
export 'package:price_tracker/features/price/domain/usecases/active_symbols_use_case.dart';
export 'package:price_tracker/features/price/domain/repositories/active_symbols_repository.dart';
export 'package:price_tracker/features/price/domain/entities/tick_entity.dart';

//presentation
export 'package:price_tracker/features/price/presentation/cubits/price_tracker_cubit/price_tracker_cubit.dart';
export 'package:price_tracker/features/price/presentation/cubits/socket_cubit/socket_cubit.dart';
export 'package:price_tracker/features/price/presentation/cubits/providers.dart';
export 'package:price_tracker/features/price/presentation/widgets/app_bar.dart';
export 'package:price_tracker/features/price/presentation/widgets/main_page/asset_drop_down.dart';
export 'package:price_tracker/features/price/presentation/widgets/loading.dart';
export 'package:price_tracker/features/price/presentation/widgets/main_page/markets_drop_down.dart';
export 'package:price_tracker/features/price/presentation/widgets/main_page/tick_widget.dart';
export 'package:price_tracker/features/price/presentation/widgets/ui_exception_widget.dart';
export 'package:price_tracker/features/price/presentation/pages/price_tracker_page.dart';
export 'package:price_tracker/features/price/presentation/pages/main_page.dart';
