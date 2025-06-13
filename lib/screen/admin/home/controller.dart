import 'package:darzi_nearby/darzi_nearby.dart';

enum AdminScreenState { loading, error, completed }

class AdminHomeController extends GetxController {
  final searchText = TextEditingController();
  final AdminSearchDarzi sd = AdminSearchDarzi();
  final state = AdminScreenState.loading.obs;
  bool isLoading = false;
  late final RxList<DarziInfo> darizs = <DarziInfo>[].obs;
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 150))
        .then((value) => _onInit());
  }

  void _onInit() {
    updateSearch('');
  }

  Future<void> updateSearch(String data) async {
    try {
      if (!isLoading) {
        isLoading = true;
        state.value = AdminScreenState.loading;
        // final res = sd.searchDarziByName(data);
        // await Future.delayed(const Duration(seconds: 1));
        final res = await server.darzi.getDarziByName(data);
        darizs.clear();
        darizs.assignAll(res);
        state.value = AdminScreenState.completed;
        isLoading = false;
      }
    } catch (e) {
      state.value = AdminScreenState.error;
    }
  }

  Future<void> removeDarzi(DarziInfo data) async {
    final res = await server.darzi.removeDarzi(data.uid);
    if (res != null) {
      Utility.showError(res);
    } else {
      darizs.remove(data);
    }
  }
}
