import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/core/helper/string_const.dart';
import 'package:price_tracker/core/router/app_router.dart';
import 'package:price_tracker/features/price/presentation/cubits/providers.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocProviders.providers,
        child: const MaterialApp(
          title: StringConstants.appTitle,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ));
  }
}
