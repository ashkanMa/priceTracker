import 'package:flutter/material.dart';
import 'package:price_tracker/core/helper/string_const.dart';
import 'package:price_tracker/features/price/presentation/pages/price_tracker_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringConstants.mainPageRouteName:
        return MaterialPageRoute(builder: (_) => const PriceTrackerPage());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
