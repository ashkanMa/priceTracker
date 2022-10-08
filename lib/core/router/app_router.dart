import 'package:price_tracker/core/helper/exporties.dart';

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
