import 'package:darzi_nearby/darzi_nearby.dart';

class AdminSplashScreen extends StatefulWidget {
  const AdminSplashScreen({super.key});

  @override
  State<AdminSplashScreen> createState() => _AdminSplashScreenState();
}

class _AdminSplashScreenState extends State<AdminSplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool _isPressed = false;
  toNextScreen() async {
    if (!_isPressed) {
      _isPressed = true;

      Future.delayed(const Duration(seconds: 1)).then((value) {
        if (server.login.logedInUser != null) {
          MyApp.routes.home.offAllNamed();
        } else {
          MyApp.routes.adminLogin.offAllNamed();
        }
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
