import 'package:price_tracker/core/helper/exporties.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocProviders.providers,
        child: const MaterialApp(
          title: StringConstants.appTitle,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ));
  }
}
