import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:darzi_nearby/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool _isPressed = false;
  toNextScreen() async {
    if (!_isPressed) {
      _isPressed = true;
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await AppStorage().init();
      await SearchArea().init();
      final isPermissionGranted = await Location.isPermissionGranted;
      // }
      Future.delayed(const Duration(seconds: 1)).then((value) {
        if (isPermissionGranted) {
          MyApp.routes.home.offAllNamed();
        } else {
          MyApp.routes.permission.offAllNamed();
        }
        // }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    toNextScreen();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 5),
            Image.asset(
              'assets/logo/logo.png',
              height: 300,
            ),
            const Spacer(flex: 6),
          ],
        ),
      ),
    );
  }
}
