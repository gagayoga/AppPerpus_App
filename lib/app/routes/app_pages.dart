import 'package:get/get.dart';

import '../modules/bookmark/bindings/bookmark_binding.dart';
import '../modules/bookmark/views/bookmark_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detailbook/bindings/detailbook_binding.dart';
import '../modules/detailbook/views/detailbook_view.dart';
import '../modules/historypeminjaman/bindings/historypeminjaman_binding.dart';
import '../modules/historypeminjaman/views/historypeminjaman_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/searchbuku/bindings/searchbuku_binding.dart';
import '../modules/searchbuku/views/searchbuku_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/updateprofile/bindings/updateprofile_binding.dart';
import '../modules/updateprofile/views/updateprofile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.BOOKMARK,
      page: () => const BookmarkView(),
      binding: BookmarkBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHBUKU,
      page: () => const SearchbukuView(),
      binding: SearchbukuBinding(),
    ),
    GetPage(
      name: _Paths.DETAILBOOK,
      page: () => const DetailbookView(),
      binding: DetailbookBinding(),
    ),
    GetPage(
      name: _Paths.HISTORYPEMINJAMAN,
      page: () => const HistorypeminjamanView(),
      binding: HistorypeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.UPDATEPROFILE,
      page: () => const UpdateprofileView(),
      binding: UpdateprofileBinding(),
    ),
  ];
}
