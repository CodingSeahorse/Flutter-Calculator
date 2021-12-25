import 'dart:io';

import 'utils/Converter.dart';
import 'utils/SimpleMath.dart';

import 'package:basic_utils/basic_utils.dart';
import 'dart:developer' as developer;

class CalculatorLogic{
  dynamic text ='0';
  double firstNumber = 0;
  double secondNumber = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic operation = '';
  dynamic preOperation = '';

  void calculate(btnText) {
    if (btnText == 'AC') {
      text = '0';
      firstNumber = 0;
      secondNumber = 0;
      result = '';
      finalResult = '0';
      operation = '';
      preOperation = '';
    } else if (operation == '=' && btnText == '=') {
        switch(preOperation){
          case '+':
            finalResult = SimpleMath.add(firstNumber, secondNumber);
            break;
          case '-':
            finalResult = SimpleMath.sub(firstNumber, secondNumber);
            break;
          case 'x':
            finalResult = SimpleMath.mul(firstNumber, secondNumber);
            break;
          case '/':
            finalResult = SimpleMath.div(firstNumber, secondNumber);
            break;
        }
    } else if (
      btnText == '+' ||
      btnText == '-' ||
      btnText == 'x' ||
      btnText == '/' ||
      btnText == '=') {

      //result = Converter.eraseBigResult(result);

      if (firstNumber == 0) {
        firstNumber = double.parse(result);
      } else {
        secondNumber = double.parse(result);
      }

      switch(operation){
        case '+':
          finalResult = SimpleMath.add(firstNumber, secondNumber);
          break;
        case '-':
          finalResult = SimpleMath.sub(firstNumber, secondNumber);
          break;
        case 'x':
          finalResult = SimpleMath.mul(firstNumber, secondNumber);
          break;
        case '/':
          finalResult = SimpleMath.div(firstNumber, secondNumber);
          break;
      }

      preOperation = operation;
      operation = btnText;
      result = '';
    } else if (btnText == '%') {
      result = firstNumber / 100;
      finalResult = SimpleMath.checkDecimalResult(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      //
      // We check if the result is negative or not
      //
      if(result.toString().startsWith('-')){
        result = result.toString().substring(1);
      }else {
        result = '-' + result.toString();
      }

      finalResult = result;
    } else if(result.toString().length <= 10) {
      result = result + btnText;

      if (result.toString().length > 3){
        result = Converter.checkBigResult(result);
      }

      finalResult = result;
    }
  }
}