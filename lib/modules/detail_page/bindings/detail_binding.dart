import 'package:get/get.dart';
import 'package:pokemon/modules/detail_page/controllers/detail_controller.dart';


class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}