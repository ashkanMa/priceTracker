import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/core/helper/string_const.dart';
import 'package:price_tracker/features/price/data/models/tick_model.dart';
import 'package:price_tracker/features/price/presentation/cubits/socket_cubit/socket_cubit.dart';
import 'package:price_tracker/features/price/presentation/widgets/loading.dart';
import 'package:price_tracker/features/price/presentation/widgets/ui_exception_widget.dart';

class TickWidget extends StatelessWidget {
  TickWidget({Key? key}) : super(key: key);
  var currentValue = 0.0;
  var preValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocketCubit, SocketState>(builder: (context, state) {
      if (state is SocketConnectionLoading) {
        return const LoadingWidget(loadingType: LoadingType.trackerLoading);
      }
      if (state is SocketConnectedState) {
        return streaming(state);
      }
      return Container();
    });
  }

  Widget streaming(state) {
    return StreamBuilder(
        stream: state.channel.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            try {
              var model =
                  TickModel.fromJson(json.decode(snapshot.data.toString()));
              double value = double.parse(model.tick.quote.toString());
              return changeData(value);
            } catch (e) {
              return const UiExceptionWidget(
                text: StringConstants.socketExceptionMessage,
              );
            }
          }
          return const Text(StringConstants.waiting);
        });
  }

  changeData(var number) {
    currentValue = number;
    if (preValue == null) {
      preValue = currentValue;
      return Text(
        number.toString(),
        style: const TextStyle(fontSize: 30, color: Colors.grey),
      );
    }
    if (currentValue == preValue) {
      preValue = currentValue;
      return Text(
        number.toString(),
        style: const TextStyle(fontSize: 30, color: Colors.grey),
      );
    }
    if (currentValue > preValue) {
      preValue = currentValue;
      return Text(
        number.toString(),
        style: const TextStyle(fontSize: 30, color: Colors.green),
      );
    }
    if (currentValue < preValue) {
      preValue = currentValue;
      return Text(
        number.toString(),
        style: const TextStyle(fontSize: 30, color: Colors.red),
      );
    }
  }
}
