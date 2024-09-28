import 'package:get/get.dart';
import 'package:gitflare/controller/home_controller.dart';
import 'package:gitflare/controller/login_contoller.dart';
import 'package:gitflare/controller/project_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginContoller>(() => LoginContoller(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<RepoDetailsController>(() => RepoDetailsController(), fenix: true);
  }
}
