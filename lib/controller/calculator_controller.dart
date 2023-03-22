import 'package:get/get.dart';

class CalculatorController extends GetxController{
  RxString outputResult = "0".obs;

  numberPress(String number) {
    outputResult.value += number;
  }

  textPress(String number) {
    if (outputResult.value.isNotEmpty) {
      outputResult.value = outputResult.value.substring(0, outputResult.value.length - 1) ;
    }
  }
  separate() {
    RxString num1 = ''.obs, num2 = ''.obs ;
    String opp = '';
    RxBool isStillNum = true.obs;
    bool isNumeric(String s) {
      if (s == null) {
        return false;
      }
      return double.tryParse(s) != null;
    }
    for (int i = 0; i < outputResult.value.length; i++) {
      if (isNumeric( outputResult.value[i])) {
        if (isStillNum.value) {
          num1.value += outputResult.value[i];
        } else {
          num2.value += outputResult.value[i];
        }
      } else {
        isStillNum = false.obs;
        opp = outputResult.value[i];
      }
    }
    operation(num1, num2, opp);
  }
  operation(RxString num1, RxString num2, String opp) {
    if (opp == '+') {
      outputResult.value = '${int.parse(num1.value) + int.parse(num2.value)}';
    } else if (opp == "-") {
      outputResult.value = (int.parse(num1.value) - int.parse(num2.value)).toString();
    } else if (opp == "*") {
      outputResult.value = (int.parse(num1.value) * int.parse(num2.value)).toString();
    } else if (opp == "/") {
      outputResult.value = (int.parse(num1.value) / int.parse(num2.value)).toString();
    } else if (opp == "%") {
      outputResult.value = (int.parse(num1.value) % int.parse(num2.value)).toString();
    }
  }
}