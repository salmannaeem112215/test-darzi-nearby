import 'package:darzi_nearby/app/icon_config.dart';
import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:darzi_nearby/screen/user/home/darzi_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomeController>();
  void toFacebook() {
    String url = 'https://facebook.com';
    launchUrl(Uri.parse(url));
  }

  void toInstagram() {
    String url = 'https://instagram.com';
    launchUrl(Uri.parse(url));
  }

  void onLoginTap() {
    MyApp.routes.adminLogin.toNamed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: toInstagram,
            child: Image.asset(
              IconConfigX.instagram,
              height: 50,
            ),
          ),
          GestureDetector(
            onTap: toFacebook,
            child: Image.asset(
              IconConfigX.facebook,
              height: 50,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          ..._homeAppBar(_searchFiled),
          DarziView(controller: controller),
        ],
      ),
    );
  }

  Widget get _searchFiled {
    return Obx(() {
      final searchLoc = controller.location.value;
      final currLoc = controller.currentLocation;
      bool showCancel = searchLoc != null;
      return Stack(children: [
        GestureDetector(
          onTap: MyApp.routes.search.toNamed,
          child: TextField(
            controller: controller.searchText,
            enabled: false,
            style: const TextStyle(color: ColorConfig.brown),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: ColorConfig.brown,
              ),
              suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showCancel) const SizedBox(width: 35),
                    const Icon(
                      Icons.my_location_rounded,
                      color: ColorConfig.brown,
                    ),
                    const SizedBox(width: 8),
                  ]),
              fillColor: ColorConfig.grayLight,
              filled: true,
              border: _border,
              errorBorder: _border,
              focusedBorder: _border,
              enabledBorder: _border,
              disabledBorder: _border,
              focusedErrorBorder: _border,
            ),
          ),
        ),
        if (showCancel)
          Positioned(
              top: 0,
              bottom: 0,
              right: 40,
              child: GestureDetector(
                onTap: () {
                  controller.updateSearch(clearAll: true);
                },
                child: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              )),
      ]);
    });
  }

  get _border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: ColorConfig.grayLight,
        width: 0,
      ));
  SliverAppBar _homeTitleAppbar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      floating: true,
      pinned: false,
      centerTitle: true,
      toolbarHeight: 65,
      elevation: 0,
      forceElevated: false,
      scrolledUnderElevation: 0,
      actions: [
        GestureDetector(
          onTap: onLoginTap,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Icon(Icons.login)),
        )
      ],
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                IconConfig.logo,
                height: 50,
              ),
              const Text(
                'Darzi Nearby',
                style: TextStyle(
                  color: ColorConfig.brownDark,
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                ),
              )
            ],
          ),
          const FittedBox(
            child: Text(
              "Let's find a Darzi Near to you",
              style: TextStyle(
                color: ColorConfig.brown,
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _homeSearchArea(Widget textField) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      expandedHeight: 0,
      floating: false,
      pinned: true,
      scrolledUnderElevation: 0,
      leadingWidth: double.infinity,
      title: textField,
    );
  }

  List<Widget> _homeAppBar(Widget textField) => [
        _homeTitleAppbar(),
        _homeSearchArea(textField),
      ];
}
