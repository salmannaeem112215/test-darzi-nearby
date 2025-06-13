import 'package:darzi_nearby/commons/commons.dart';

class MyTextStyles {
  static const kFontFamily = 'Roboto';
  static final textTheme = TextTheme(
    titleMedium: _titleTheme,
    titleLarge: _titleTheme,
    titleSmall: _titleTheme,
    bodyMedium: _bodyTheme,
    bodyLarge: _bodyTheme,
    bodySmall: _bodyTheme,
    headlineLarge: _bodyTheme,
    headlineMedium: _bodyTheme,
    headlineSmall: _bodyTheme,
    displayLarge: _bodyTheme,
    displayMedium: _bodyTheme,
    displaySmall: _bodyTheme,
  );

  static TextStyle _themeStyle(Color color) => TextStyle(
        color: color,
        fontFamily: kFontFamily,
      );
  static final _titleTheme = _themeStyle(ColorConfig.textLight);
  static final _bodyTheme = _themeStyle(ColorConfig.textDark);

  static const appbar = TextStyle(
    color: ColorConfig.textDark,
    fontFamily: MyTextStyles.kFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const r12Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const r12MediumBlack = TextStyle(
    fontSize: 12,
    color: ColorConfig.black,
    fontWeight: FontWeight.w500,
  );
  static const r13SemiBold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );
  static const r13SemiBoldBlue = TextStyle(
    fontSize: 13,
    color: ColorConfig.blue,
    fontWeight: FontWeight.w600,
  );
  static const r13Text = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorConfig.textColor,
  );
  static const r13SemiBoldText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: ColorConfig.textColor,
  );
  static const r14Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const r16Light = TextStyle(
    fontSize: 16,
    color: ColorConfig.textLight,
  );

  static const r18Medium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const r12Light = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: ColorConfig.textColor,
  );
  static const r15SemiBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: ColorConfig.textColor,
  );
  static const r15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorConfig.textColor,
  );
  static const r15Bold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: ColorConfig.textColor,
  );
  static const r16Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const r16Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const r16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const r16BoldBlue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorConfig.blue,
  );
  static const r18Bold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const r18BoldHeading = TextStyle(
    fontSize: 18,
    color: ColorConfig.textHeadingDark,
    fontWeight: FontWeight.bold,
  );
  static const r20SemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorConfig.textColor,
  );
  static const r16SemiBoldPrimary = TextStyle(
    fontSize: 16,
    color: ColorConfig.primary,
    fontWeight: FontWeight.w600,
  );
  static const r16BoldPrimary = TextStyle(
    fontSize: 16,
    color: ColorConfig.primary,
    fontWeight: FontWeight.bold,
  );
  static const r32Bold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const r24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const r24Light = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w300,
  );

  static const r24LightBrown = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: ColorConfig.brownDark,
  );
  static const r24BoldPrimary = TextStyle(
    fontSize: 24,
    color: ColorConfig.primary,
    fontWeight: FontWeight.bold,
  );
  static const r32BoldPrimary = TextStyle(
    fontSize: 32,
    color: ColorConfig.primary,
    fontWeight: FontWeight.bold,
  );
  static const r32BoldWhite = TextStyle(
    fontSize: 32,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const r12BoldWhite = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const r16BoldWhite = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const r18BoldWhite = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const rUnderlinedBoldPrimary = TextStyle(
    color: ColorConfig.primary,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
}
