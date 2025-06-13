import 'package:darzi_nearby/darzi_nearby.dart';

class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((value) => null);
  }

  String text =
      '''Welcome to Darzi-Nearby! Ready to find the perfect tailor next door? Let's get started!

Darzi-Nearby میں خوش آمدید! کیا آپ قریبی علاقے میں بہترین درزی تلاش کرنے کے لیے تیار ہیں؟ آئیے شروع کریں۔    ''';

  // "Embark on a journey of sartorial elegance with Darzi Nearby, the ultimate tailor app designed to redefine your wardrobe experience. Whether you're fashion-forward or seeking timeless classics, our app seamlessly connects you with skilled tailors who bring your style aspirations to life. With intuitive features and a user-friendly interface, Darzi Nearby empowers you to customize and create bespoke garments that reflect your individuality. From selecting fabrics to choosing intricate details, our app ensures every stitch aligns with your unique taste. Say goodbye to generic off-the-rack fashion and embrace a personalized approach to dressing. Download Darzi Nearby now and step into a world where your style is crafted, not just worn. Your perfect fit awaits. let's tailor your dreams together!";
  Future<void> onTap() async {
    try {
      final isGet = await Location.getPermission;
      if (isGet) {
        if (Get.previousRoute.isEmpty || Get.previousRoute == '/') {
          await Location.getLocation;
          MyApp.routes.home.offAllNamed();
        } else {
          Get.back();
          Get.find<MySearchController>().useCurrentLocation();
        }
      }
    } catch (e) {
      Utility.showError(e);
    }
  }

  static const _bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 600;
    return Scaffold(
      backgroundColor: _bgColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isDesktop ? null : permissionBtn(),
      body: SafeArea(
        child: width > 600 ? desktopView() : mobileView(),
      ),
    );
  }

  Stack mobileView() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: permissionnImg(),
              ),
              const SizedBox(
                height: 20,
              ),
              permissionText(),
              const SizedBox(height: 200),
            ],
          ),
        ),
        backBtn(),
      ],
    );
  }

  Stack desktopView() {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(child: permissionnImg()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 350),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 5,
                      child: Container(
                        color: Colors.grey.shade100,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            permissionText(),
                            SizedBox(
                              width: 250,
                              child: Btn(
                                onTap: onTap,
                                titleText: 'Give Permission',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        backBtn(),
      ],
    );
  }

  IconButton backBtn() {
    return IconButton(
      onPressed: () => Get.previousRoute.isEmpty || Get.previousRoute == '/'
          ? MyApp.routes.home.offAllNamed()
          : Get.back(),
      icon: const Icon(Icons.arrow_back),
    );
  }

  Column permissionText() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Location Permission',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        WelcomeText(),
        SizedBox(height: 70),
      ],
    );
  }

  Image permissionnImg() {
    return Image.asset(
      IconConfig.locationPage,
      fit: BoxFit.fitWidth,
    );
  }

  Btn permissionBtn() {
    return Btn.floating(
      titleText: 'Give Permissions',
      onTap: onTap,
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Text(
                "Welcome to Darzi-Nearby! \nReady to find the perfect tailor next door? Let's get started!\n"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("! "),
                Text('میں خوش آمدید'),
                Text(" Darzi Nearby")
              ],
            ),
            Text(
              "  کیا آپ قریبی علاقے میں بہترین درزی تلاش کرنے کے لیے تیار ہیں؟ آئیے شروع کریں۔",
              textAlign: TextAlign.end,
            )
          ],
        ));
  }
}
