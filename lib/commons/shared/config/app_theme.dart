import 'package:darzi_nearby/commons/commons.dart';
// ignore: depend_on_referenced_packages
import 'package:gradient_borders/gradient_borders.dart'
    show GradientOutlineInputBorder;

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: ColorConfig.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: ColorConfig.textDark,
      centerTitle: true,
      elevation: 1,
      iconTheme: IconThemeData(color: ColorConfig.primary),
      titleTextStyle: MyTextStyles.appbar,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: ColorConfig.primary,
      textStyle: MyTextStyles.r16Medium,
    )),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
    textTheme: MyTextStyles.textTheme,
    // inputDecorationTheme: _inputDecorationTheme,
  );

  static final _bRadius = BorderRadius.circular(8);
  static final selectedOutlined = GradientOutlineInputBorder(
    borderRadius: _bRadius,
    gradient: ColorConfig.gradient,
    width: 1,
  );
  // static final _inputDecorationTheme = InputDecorationTheme(
  //   // fillColor: Colors.white,
  //   // filled: true,
  //   contentPadding: const EdgeInsets.symmetric(
  //     horizontal: 24,
  //     vertical: 15,
  //   ),
  //   border: OutlineInputBorder(
  //     borderRadius: _bRadius,
  //     borderSide: const BorderSide(color: ColorConfig.gray5),
  //   ),
  //   focusedBorder: const GradientOutlineInputBorder(
  //     gradient: ColorConfig.gradient,
  //     width: 2,
  //   ),
  //   errorBorder: OutlineInputBorder(
  //     borderRadius: _bRadius,
  //     borderSide: const BorderSide(color: ColorConfig.error),
  //   ),

  //   focusedErrorBorder: OutlineInputBorder(
  //     borderRadius: _bRadius,
  //     borderSide: const BorderSide(color: ColorConfig.error),
  //   ),
  // );
}
