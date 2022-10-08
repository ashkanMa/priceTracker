import 'package:price_tracker/core/helper/exporties.dart';

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
                const SizedBox(
                  height: 50,
                ),
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
