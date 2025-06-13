import 'package:darzi_nearby/darzi_nearby.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = Get.find<MySearchController>();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      controller.search('');
    });
    super.initState();
  }

  void _onChanged(String val) {
    controller.search(val);
  }

  void onTap(PakistanAreaWithDistance data) {
    Get.find<HomeController>().updateSearch(data: data);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Location",
          style: MyTextStyles.r24LightBrown,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _searchBar(_onChanged),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: controller.useCurrentLocation,
              child: const Row(
                children: [
                  Icon(
                    Icons.my_location_rounded,
                    color: ColorConfig.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Use Current Location',
                    style: MyTextStyles.r13SemiBoldBlue,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const HeaderTile(title: 'Results'),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.pakistanAreas.length,
                itemBuilder: (context, index) =>
                    areaTile(controller.pakistanAreas[index]),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget areaTile(PakistanAreaWithDistance area) {
    return ListTile(
      tileColor: Colors.white,
      onTap: () => onTap(area),
      title: Text(
        area.pakistanArea.name,
        style: MyTextStyles.r13SemiBoldText,
      ),
      trailing: area.isValidDistance
          ? Text(
              area.toKm,
              style: MyTextStyles.r13Text,
            )
          : null,
    );
  }

  Padding _searchBar(void Function(String value) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: ColorConfig.grayLight,
          filled: true,
          iconColor: ColorConfig.grayDark,
          prefixIcon: const Icon(Icons.search),
          border: _border,
          errorBorder: _border,
          focusedBorder: _border,
          enabledBorder: _border,
          disabledBorder: _border,
          focusedErrorBorder: _border,
        ),
      ),
    );
  }
}

get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: ColorConfig.grayLight,
      width: 0,
    ));
