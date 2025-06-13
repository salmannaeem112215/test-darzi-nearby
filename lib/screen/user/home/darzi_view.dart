// import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:darzi_nearby/darzi_nearby.dart';

import './_headers.dart';

class DarziView extends StatelessWidget {
  const DarziView({super.key, required this.controller});
  final HomeController controller;
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
        case ScreenState.loading:
          return _child(const CircularProgressIndicator(
            color: ColorConfig.brown,
          ));
        case ScreenState.error:
          return _child(Btn(
            titleText: 'Load',
            height: 50,
            width: 100,
            onTap: () async => controller.updateSearch(),
          ));

        case ScreenState.completed:
          final data = controller.darizs.value;
          if (data.isEmpty) {
            return _child(const Text('No Darzi Found'));
          } else {
            return SliverList.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => DarziTile(
                data[index],
                onTap: () => onTap(data[index].darziInfo),
              ),
            );
          }
      }
    });
  }

  onTap(DarziInfo data) {
    MyApp.routes.darziProfile.toNamed(data);
  }
}
