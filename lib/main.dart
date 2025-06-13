import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Darzi Nearby',
      theme: AppTheme.theme,
      defaultTransition: Transition.native,
      color: ColorConfig.brown,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      getPages: MyApp.routes.getPages,
      initialRoute: MyApp.routes.initialRoute,
    );
  }
}
