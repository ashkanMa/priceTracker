import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/features/price/presentation/cubits/price_tracker_cubit/price_tracker_cubit.dart';
import 'package:price_tracker/features/price/presentation/widgets/app_bar.dart';
import 'package:price_tracker/features/price/presentation/widgets/loading.dart';

class PriceTrackerPage extends StatelessWidget {
  const PriceTrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PriceTrackerCubit>().fetchActiveSymbols();
    return const Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: LoadingWidget(
          loadingType: LoadingType.mainLoading,
        ),
      ),
    );
  }
}
