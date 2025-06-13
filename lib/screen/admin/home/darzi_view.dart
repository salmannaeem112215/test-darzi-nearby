import 'package:darzi_nearby/darzi_nearby.dart';

class AdminDarziView extends StatelessWidget {
  const AdminDarziView({super.key, required this.controller});
  final AdminHomeController controller;
  _child(Widget child) {
    return SliverFillRemaining(
      child: Center(
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = controller.state.value;

      switch (state) {
        case AdminScreenState.loading:
          return _child(const CircularProgressIndicator(
            color: ColorConfig.brown,
          ));
        case AdminScreenState.error:
          return _child(Btn(
            titleText: 'Load',
            height: 50,
            width: 100,
            onTap: () async =>
                controller.updateSearch(controller.searchText.text),
          ));

        case AdminScreenState.completed:
          final data = controller.darizs.value;
          if (data.isEmpty) {
            return _child(const Text('No Darzi Found'));
          } else {
            return SliverList.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => AdminDarziTile(
                data[index],
                onEditTap: onEditTap,
                onRemoveTap: onRemoveTap,
              ),
            );
          }
      }
    });
  }

  onEditTap(DarziInfo data) {
    MyApp.routes.adminEditDarziProfile.toNamed(data);
  }

  onRemoveTap(DarziInfo data) async {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: 'Confirmation',
      middleText: 'Are you sure you want to delete?',
      actions: [
        Btn(
          titleText: 'Yes',
          onTap: () async {
            try {
              await controller.removeDarzi(data);
              Get.back(); // Close the dialog
            } catch (e) {
              Get.back(); // Close the dialog
              rethrow;
            }
          },
        ),
        TextButton(
          onPressed: () {
            Get.back(); // Close the dialog
          },
          child: Text('No'),
        ),
      ],
    );
  }
}
