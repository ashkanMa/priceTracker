import 'package:price_tracker/core/helper/exporties.dart';

enum LoadingType {
  mainLoading,
  trackerLoading,
}

class LoadingWidget extends StatelessWidget {
  final LoadingType loadingType;

  const LoadingWidget({Key? key, required this.loadingType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      size: loadingType == LoadingType.mainLoading
          ? NumberConstants.firstLoadingSize
          : NumberConstants.trackerLoadingSize,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.red : Colors.green,
          ),
        );
      },
    );
  }
}
