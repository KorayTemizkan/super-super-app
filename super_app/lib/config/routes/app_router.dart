import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

// Go Router'de eziyet çekmişiz valla yaa, burada her şey çok kolay
/*
Standart yaptığın gibi yapamazsın çünkü burada alttaki barın kaybolmaması gerekli
*/

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  // Aklında bulunsun, sanırım extends ettiğimiz için override dememiz gerekiyor. Üniden hatırla olayı
  @override
  List<AutoRoute> get routes => [
    // Bu AutoRoute ana kapsayıcı rota
    AutoRoute(
      page: MyBottomBar.page, // Bizim bottom navigation bar sayfamız
      initial: true,
      children: [
        AutoRoute(
          path: 'feed',
          page: FeedRoute.page,
          initial: true,
        ), // ilk açıldığında gözükecek sayfa
        AutoRoute(path: 'explore', page: ExploreRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
      ],
    ),
  ];
}
