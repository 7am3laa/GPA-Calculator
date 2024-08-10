import 'package:get/get.dart';
import 'package:gpa_/controllers/gpa_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
  
    Get.put(GPAController());
  }
}
