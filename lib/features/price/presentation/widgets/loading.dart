import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/helper/numbers_const.dart';

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

