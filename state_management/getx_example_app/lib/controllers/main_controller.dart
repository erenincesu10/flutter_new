import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class MainController extends GetxController {
  int counter = 0;

  incrementCounter() {
    counter++;
    update();
  }
}
