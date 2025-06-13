import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:darzi_nearby/screen/admin/home/darzi_view.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final controller = Get.find<AdminHomeController>();
  final cordinates = Cordinates.latLng(31.536672242849058, 74.30413468337606);

  onAddDarzi() {
    MyApp.routes.adminAddDarzi.toNamed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          ..._homeAppBar(_searchFiled),
          AdminDarziView(controller: controller),
        ],
      ),
    );
  }

  Widget get floatingActionButton {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Btn(
          onTap: onAddDarzi,
          width: 60,
          height: 60,
          title: (color) => Icon(
            Icons.add,
            color: color,
          ),
        ),
      ],
    );
  }

  String searchVal = '';
  onChanged(String? value) async {
    searchVal = value!;
    await Future.delayed(const Duration(milliseconds: 200));
    if (value == searchVal) {
      controller.updateSearch(value);
    }
  }

  TextField get _searchFiled {
    return TextField(
      controller: controller.searchText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: ColorConfig.gray,
        ),
        fillColor: ColorConfig.grayLight,
        filled: true,
        border: _border,
        errorBorder: _border,
        focusedBorder: _border,
        enabledBorder: _border,
        disabledBorder: _border,
        focusedErrorBorder: _border,
      ),
    );
  }

  get _border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: ColorConfig.grayLight,
        width: 0,
      ));
}

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
    leading: Tooltip(
      message: "Logout",
      child: IconButton(
        onPressed: () {
          server.login.logout();
          MyApp.routes.adminLogin.offAllNamed();
        },
        icon: const Icon(
          Icons.logout,
          color: Colors.brown,
        ),
      ),
    ),
    scrolledUnderElevation: 0,
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
