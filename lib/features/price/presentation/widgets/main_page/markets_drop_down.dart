import 'package:price_tracker/core/helper/exporties.dart';

class MarketDropDown extends StatelessWidget {
   const MarketDropDown(
      {Key? key, required this.dropDownValue, required this.marketsList})
      : super(key: key);
  final String dropDownValue;
  final List<String> marketsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 60,
      child: Center(
        child: DropdownButtonFormField(
          hint: Text(dropDownValue,style: const TextStyle(color: Colors.black),),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (v) {
            context.read<PriceTrackerCubit>().changeMarket(
                marketName: v.toString(),
                assetName: StringConstants.chooseAsset);
          },
          items: marketsList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
