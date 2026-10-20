import 'package:get/get.dart';
import 'package:three_boxes/Models/box-model.dart';
import 'package:three_boxes/bindings/home_binding.dart';
import 'package:three_boxes/bindings/review_binding.dart';
import 'package:three_boxes/routes/app_routes.dart';
import 'package:three_boxes/views/screens/home_page.dart';
import 'package:three_boxes/views/screens/review_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.review,
      page: () => ReviewPage(box: Get.arguments as BoxModel),
      binding: ReviewBinding(),
    ),
  ];
}
