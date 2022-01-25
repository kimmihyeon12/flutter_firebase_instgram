import 'package:get/get.dart';
import 'package:instagramproject/binding/postBinding.dart';
import 'package:instagramproject/binding/userBinding.dart';
import 'package:instagramproject/page/create_page.dart';
import 'package:instagramproject/page/detail_page.dart';
import 'package:instagramproject/page/root_page.dart';

import 'app_name.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => const RootPage(),
    ),
    GetPage(
        name: RouteName.create,
        page: () => CreatePage(),
        binding: PostBinding()),
    GetPage(
      name: RouteName.detail,
      page: () => DetailPage(),
    ),
  ];
}
