class IconConfig {
  // LOGO
  static const logo = 'assets/logo/logo.png';
  // PNG
  static const darzi = 'assets/png/darzi.png';
  static const locationPage = 'assets/png/location_review_pana.png';
  static const upload = 'assets/svg/upload.svg';
  static const whatsapp = 'assets/png/whatsapp.png';
  static const service1 = 'assets/png/service1.png';
  static const service2 = 'assets/png/service2.png';
  static const service3 = 'assets/png/service3.png';
  static const service4 = 'assets/png/service4.png';
}

class AvatarConfig {
  // static const String a1 = 'assets/png/avatar/a1.png';
  // static const String a2 = 'assets/png/avatar/a2.png';
  // static const String a3 = 'assets/png/avatar/a3.png';
  // static const String a4 = 'assets/png/avatar/a4.png';
  // static const String a5 = 'assets/png/avatar/a5.png';
  // static const String a6 = 'assets/png/avatar/a6.png';

  static const String a1 = 'assets/png/a1.png';
  static const String a2 = 'assets/png/a2.png';
  static const String a3 = 'assets/png/a3.png';
  static const String a4 = 'assets/png/a4.png';
  static const String a5 = 'assets/png/a5.png';
  static const String a6 = 'assets/png/a6.png';
  static const items = [a1, a2, a3, a4, a5, a6];
  static bool isAvatar(dynamic val) => (val is String && items.contains(val));
}
