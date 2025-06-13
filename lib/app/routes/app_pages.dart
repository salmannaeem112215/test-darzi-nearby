import 'package:darzi_nearby/app/middleware/direct_url.dart';
import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:darzi_nearby/models/dummy.dart';

class AppPages extends AppRoutes {
  @override
  String get initialRoute => splash.name;
  @override
  List<AppRouteModal> get appRoutes => [
        splash,
        // welcome,
        home,
        search,
        darziProfile,
        permission,
        adminHome,
        adminLogin,
        adminAddDarzi,
        adminEditDarziProfile,
      ];
  static final directUrl = DirectUrlMiddleware();

  final splash = AppRouteModalSimple(
    name: '/',
    page: () => const SplashScreen(),
  );
  final home = AppRouteModalSimple(
    name: '/home',
    page: () => const HomeScreen(),
    binding: HomeBinding(),
    middlewares: [directUrl],
  );
  final search = AppRouteModalSimple(
    name: '/search',
    page: () => const SearchScreen(),
    binding: SearchBinding(),
    middlewares: [directUrl],
  );
  final darziProfile = AppRouteModalData<DarziInfo>(
    name: '/darzi_profile',
    page: (data) => DarziProfileScreen(data: data),
    onErrorData: () => DarziInfo.fromJson({"random": ''}),
    binding: DarziProfileBinding(),
    middlewares: [directUrl],
  );
  final permission = AppRouteModalSimple(
    name: '/permission',
    page: () => const LocationPermissionScreen(),
    middlewares: [directUrl, MyApp.middlewar.location],
  );

  final adminHome = AppRouteModalSimple(
      name: '/admin/home',
      page: () => const AdminHomeScreen(),
      binding: AdminHomeBinding(),
      middlewares: [Middleware.login]);

  final adminLogin = AppRouteModalSimple(
    name: '/admin/login',
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  );

  final adminEditDarziProfile = AppRouteModalData<DarziInfo>(
      name: '/admin/edit_profile',
      page: (data) => EditDarziScreen(darziInfo: data),
      onErrorData: () => DummyData.darzi.i1,
      binding: EditDarziBinding(),
      middlewares: [Middleware.login]);

  final adminAddDarzi = AppRouteModalSimple(
    name: '/admin/add',
    page: () => const AddDarziScreen(),
    binding: AddDarziBinding(),
    middlewares: [
      Middleware.login,
    ],
  );
}
