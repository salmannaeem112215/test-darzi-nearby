import 'package:darzi_nearby/darzi_nearby.dart';

enum ScreenState { loading, error, completed }

class HomeController extends GetxController {
  final searchText = TextEditingController();
  final UserSearchDarzi sd = UserSearchDarzi();
  final SearchArea sa = SearchArea();
  final state = ScreenState.loading.obs;
  bool isLoading = false;
  late final RxList<DarziInfoWithDistance> darizs =
      <DarziInfoWithDistance>[].obs;
  //  late final RxList<DarziInfoWithDistance>  =
  // <DarziInfoWithDistance>[].obs;
  final Rx<PakistanAreaWithDistance?> location =
      Rx<PakistanAreaWithDistance?>(null);
  PakistanAreaWithDistance? get currentLocation => Location.position != null
      ? sa.nearestArea(Location.position!.toCordinates)
      : null;
  @override
  void onInit() {
    super.onInit();
    location.value = Location.position != null
        ? sa.nearestArea(Location.position!.toCordinates)
        : null;

    Future.delayed(const Duration(milliseconds: 150))
        .then((value) => _onInit());
  }

  void _onInit() {
    updateSearch();
  }

  Future<void> updateSearch(
      {PakistanAreaWithDistance? data,
      String? name,
      bool clearAll = false}) async {
    try {
      if (!clearAll) {
        data ??= currentLocation;
      } else {
        data = null;
      }
      if (!isLoading) {
        isLoading = true;
        location.value = data;
        state.value = ScreenState.loading;
        print("HI SET LOADING $data");
        if (data != null) {
          print("THIS SEACh $data");
          // WHEN SOME LOCATION IS HIT
          searchText.text = data.pakistanArea.name;
          final res = await server.darzi
              .getDarziByCordinates(data.pakistanArea.cordinates);
          darizs.clear();
          darizs.assignAll(res);
        } else {
          print("HERE I AM");
          final sValue = name ?? '';
          searchText.text = sValue;
          final res = await server.darzi.getDarziByName(sValue);
          darizs.clear();
          darizs
              .assignAll(res.map((e) => DarziInfoWithDistance(e, -1)).toList());
        }

        state.value = ScreenState.completed;
        isLoading = false;
      }
    } catch (e) {
      state.value = ScreenState.error;
    }
  }

  Future<void> showCurrentLocation() async =>
      await updateSearch(data: currentLocation);
}
