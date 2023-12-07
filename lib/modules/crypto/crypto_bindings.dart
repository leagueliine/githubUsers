import 'package:crypto_count/modules/crypto/crypto_controller.dart';
import 'package:get/get.dart';

class CryptoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CryptoController>(() => CryptoController());
  }
}
