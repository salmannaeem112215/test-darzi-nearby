import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:darzi_nearby/screen/user/location/screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  @override
  void initState() {
    super.initState();
    SplashController().init();
  }

  void onGetStarted() {
    AppStorage().saveIsFirstTime(false);
    MyApp.routes.home.offAllNamed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Btn.floating(
        titleText: 'Get Started',
        onTap: onGetStarted,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(flex: 1),
          Flexible(
            flex: 4,
            child: Image.asset(
              'assets/logo/logo.png',
            ),
          ),
          const SizedBox(height: 50),
          const Expanded(
            flex: 6,
            child: BottomSheetWelcome(),
          ),
        ],
      ),
    );
  }
}

class BottomSheetWelcome extends StatelessWidget {
  const BottomSheetWelcome({super.key});
  final title = 'Welcome to Darzi Nearby';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          36,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // offset: const Offset(0, -5),
            blurRadius: 15,
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        top: 36,
        bottom: 16,
      ),
      width: double.infinity,
      child: const SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Welcome to Darzi Nearby',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          WelcomeText(),
          SizedBox(height: 70),
        ],
      )),
    );
  }
}

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
  });

  static const text =
      // "Welcome to Darzi-Nearby! Ready to find the perfect tailor next door? Let's get started!";
      "Embark on a journey of sartorial elegance with Darzi Nearby, the ultimate tailor app designed to redefine your wardrobe experience. Whether you're fashion-forward or seeking timeless classics, our app seamlessly connects you with skilled tailors who bring your style aspirations to life. With intuitive features and a user-friendly interface, Darzi Nearby empowers you to customize and create bespoke garments that reflect your individuality. From selecting fabrics to choosing intricate details, our app ensures every stitch aligns with your unique taste. Say goodbye to generic off-the-rack fashion and embrace a personalized approach to dressing. Download Darzi Nearby now and step into a world where your style is crafted, not just worn. Your perfect fit awaits. let's tailor your dreams together!";

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: ColorConfig.grayDark,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class InnerShadowContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final BorderRadius borderRadius;
  final double spreadRadius;
  final double blurRadius;
  final Offset offset;
  final Widget child;
  final Color shadowColor;

  const InnerShadowContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
    required this.spreadRadius,
    required this.blurRadius,
    required this.offset,
    required this.child,
    required this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.4),
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: offset,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: color,
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
