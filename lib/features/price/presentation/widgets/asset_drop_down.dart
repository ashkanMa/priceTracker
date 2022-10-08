import 'package:flutter/material.dart';
import 'package:price_tracker/features/price/domain/entities/active_symbols.dart';
import 'package:price_tracker/features/price/presentation/cubits/socket_cubit/socket_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetDropDownWidget extends StatelessWidget {
  const AssetDropDownWidget(
      {Key? key, required this.dropDownValue, required this.assetList})
      : super(key: key);
  final String dropDownValue;
  final List<ActiveSymbol> assetList;

  @override
  Widget build(BuildContext context) {
    return assetList.isNotEmpty
        ? Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            height: 60,
            child: Center(
              child: DropdownButtonFormField<String>(
                hint: Text(
                  dropDownValue,
                  style: const TextStyle(color: Colors.black),
                ),
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
                onChanged: (value) {
                  context
                      .read<SocketCubit>()
                      .socketConnectionAndSendSymbol(value.toString());
                },
                value: assetList.first.symbol,
                items: assetList
                    .map<DropdownMenuItem<String>>((ActiveSymbol value) {
                  return DropdownMenuItem<String>(
                    value: value.symbol,
                    child: Text(value.symbol),
                  );
                }).toList(),
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            height: 60,
            child: Center(
              child: DropdownButtonFormField<String>(
                  hint: Text(
                    dropDownValue,
                    style: const TextStyle(color: Colors.black),
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {},
                  items: []),
            ),
          );
  }
}
