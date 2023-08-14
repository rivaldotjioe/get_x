import 'package:get/get.dart';

class CountController extends GetxController {
  static CountController get to => Get.find<CountController>();
  final count = 0.obs;

  void increment() {
    count.value++;
    // update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
