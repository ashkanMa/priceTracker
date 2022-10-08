import 'package:price_tracker/core/helper/exporties.dart';

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
        preValue = null;
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
                  TickEntity.fromJson(json.decode(snapshot.data.toString()));
              double value = double.parse(model.tick.quote.toString());
              return changeData(value);
            } catch (e) {
              return const UiExceptionWidget(
                text: StringConstants.socketExceptionMessage,
              );
            }
          }
          return const LoadingWidget(loadingType: LoadingType.trackerLoading);
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
