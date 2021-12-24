import 'package:basic_utils/basic_utils.dart';
import 'dart:developer' as developer;

class SimpleMath {

  static String add(firstNumber,secondNumber) {
    String result = (firstNumber + secondNumber).toString();
    firstNumber = double.parse(result);
    developer.log("add result: "  + result);
    return checkDecimalResult(result);
  }

  static String sub(firstNumber,secondNumber) {
    String result = (firstNumber - secondNumber).toString();
    firstNumber = double.parse(result);
    developer.log("sub result: "  + result);
    return checkDecimalResult(result);
  }

  static String mul(firstNumber,secondNumber) {
    String result = (firstNumber * secondNumber).toString();
    firstNumber = double.parse(result);
    developer.log("mul result: "  + result);
    return checkDecimalResult(result);
  }

  static String div(firstNumber,secondNumber) {
    String result = (firstNumber / secondNumber).toString();
    firstNumber = double.parse(result);
    developer.log("div result: "  + result);
    return checkDecimalResult(result);
  }

  static String checkDecimalResult(result) {

    if(result.contains(',')) {
      // Example 80/10=8.0 -> {8,0} -> return result[0] <- 8
      List<String> splitDecimal = result.toString().split(',');

      if(!(int.parse(splitDecimal[1]) > 0)) {
        // check if splitDec[1] is not bigger than 0
        return result = splitDecimal[0].toString();
      } else if(
        (int.parse(splitDecimal[1])) > 0 &&
        splitDecimal[1].length >= 4){
        // check if decimal is to long
        dynamic subResult = splitDecimal[1].substring(0,4);
        String result = splitDecimal[0] +','+ subResult;
        developer.log("checkDec result: "  + result);
      }
    }

    return result; // return result
  }
}