import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/core/helper/string_const.dart';
import 'package:price_tracker/features/price/presentation/cubits/price_tracker_cubit/price_tracker_cubit.dart';
import 'package:price_tracker/features/price/presentation/widgets/app_bar.dart';
import 'package:price_tracker/features/price/presentation/widgets/asset_drop_down.dart';
import 'package:price_tracker/features/price/presentation/widgets/loading.dart';
import 'package:price_tracker/features/price/presentation/widgets/tick_widget.dart';

import '../widgets/markets_drop_down.dart';

class PriceTrackerPage extends StatelessWidget {
  const PriceTrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PriceTrackerCubit>().fetchActiveSymbols(
        marketName: StringConstants.chooseMarket,
        assetName: StringConstants.chooseAsset);
    return BlocBuilder<PriceTrackerCubit, PriceTrackerState>(
        builder: (context, state) {
      if (state is PriceTrackerMarketsLoadedState) {
        return Scaffold(
            appBar: const AppBarWidget(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MarketDropDown(
                  dropDownValue: state.marketName,
                  marketsList: state.marketsList,
                ),
                AssetDropDownWidget(
                  assetList: state.activeSymbolsList,
                  dropDownValue: state.assetName,
                ),
                const SizedBox(height: 50,),
                 TickWidget()
              ],
            ));
      }
      return const Scaffold(
        body: Center(
          child: LoadingWidget(
            loadingType: LoadingType.mainLoading,
          ),
        ),
      );
    });
  }

}
