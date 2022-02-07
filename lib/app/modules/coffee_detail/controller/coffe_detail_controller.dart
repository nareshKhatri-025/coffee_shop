import 'package:get/get.dart';

class CoffeDetailController extends GetxController {
  var quatity = 1.obs;
  var selectedOption = 1.obs;

  changeOption(int option) {
    selectedOption.value = option;
    update();
  }

  onIncreament() {
    if (quatity >= 0) {
      print("----------");
      print(quatity.value);
      quatity.value += 1;
      update();
    }
  }

  onDecreament() {
    if (quatity.value > 0) {
      quatity.value -= 1;
      update();
    }
  }
}
