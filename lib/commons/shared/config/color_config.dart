import 'package:darzi_nearby/commons/commons.dart';

class ColorConfig {
  static const blue = Color(0xFF2243B6);
  static const grayLight = Color(0xFFEAEAEA);
  static const grayDark = Color(0xFF838383);
  static const gray = Color(0xFF878787);
  static const gray1 = Color(0xFF959595);
  static const black = Colors.black;
  static const lightBlack = Color(0xFF263238);
  static const brownDark = Color(0xFF7B5622);
  static const brownLight = Color(0xFFC6965D);
  static const brown = Color(0xFFA8722D);
  static const red = Color(0xFFFF0000);

  static const errorSelected = Color.fromARGB(255, 175, 35, 35);
  static const textLight = Color(0xFF838383);
  static const textDark = Color(0xFF000000);
  static const textColor = Color(0xFF263238);
  static const textHeadingDark = Color(0xFF344054);
  static const textBrownDark = Color(0xFF7B5622);
  static const textBrown = Color(0xFFA8722D);
  static const textBrownLight = Color(0xFFC6965D);

  static const primary = Color(0xFF287CD2);
  static const gradientColor = Color(0xFF00A3E8);
  static const gradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
    colors: [
      ColorConfig.gradientColor,
      ColorConfig.primary,
    ],
  );
  static final gradient5 = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
    colors: [
      ColorConfig.gradientColor.withOpacity(0.05),
      ColorConfig.primary.withOpacity(0.05),
    ],
  );
  static const disableGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 175, 202, 214),
      Color.fromARGB(255, 163, 186, 208),
    ],
  );
  static LinearGradient getGradient(List<Color> colors) {
    final l = colors.length;
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,
      colors: l == 0
          ? [Colors.grey]
          : l == 1
              ? [colors[0], colors[0]]
              : colors,
    );
  }
}
