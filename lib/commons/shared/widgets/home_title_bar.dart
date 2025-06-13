import 'package:darzi_nearby/commons/commons.dart';

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

List<Widget> homeAppBar(Widget textField) => [
      _homeTitleAppbar(),
      _homeSearchArea(textField),
    ];
