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
  dynamic opr = '';
  dynamic preOpr = '';

  void calculate(btnText) {
    if (btnText == 'AC') {
      text = '0';
      firstNumber = 0;
      secondNumber = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = SimpleMath.add(firstNumber, secondNumber);
      } else if (preOpr == '-') {
        finalResult = SimpleMath.sub(firstNumber, secondNumber);
      } else if (preOpr == 'x') {
        finalResult = SimpleMath.mul(firstNumber, secondNumber);
      } else if (preOpr == '/') {
        finalResult = SimpleMath.div(firstNumber, secondNumber);
      }
    } else
    if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' ||
        btnText == '=') {
      if (firstNumber == 0) {
        firstNumber = double.parse(result);
      } else {
        secondNumber = double.parse(result);
      }

      if (opr == '+') {
        finalResult = SimpleMath.add(firstNumber, secondNumber);
      } else if (opr == '-') {
        finalResult = SimpleMath.sub(firstNumber, secondNumber);
      } else if (opr == 'x') {
        finalResult = SimpleMath.mul(firstNumber, secondNumber);
      } else if (opr == '/') {
        finalResult = SimpleMath.div(firstNumber, secondNumber);
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if (btnText == '%') {
      result = firstNumber / 100;
      finalResult = SimpleMath.checkDecimalResult(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    }

    else if (btnText == '+/-') {
      result.toString().startsWith('-') ?
      result = result.toString().substring(1) : result =
          '-' + result.toString();
      finalResult = result;
    }

    else {
      result = result + btnText;
      finalResult = result;
    }
    /*dynamic text = '0';
  dynamic firstNumber = 0;
  dynamic secondNumber = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic operator = '';
  dynamic preOperator = '';

  dynamic calculate(btnText) {

    if(btnText == 'AC'){ // <<-----  Case AC (Reset) ----->>
      text = '0';
      firstNumber = 0;
      secondNumber = 0;

      result = '';
      finalResult = '';
      operator = '';
    } else if( // <<-----  Case Pressed '=' ----->>
      operator == '=' &&
      btnText == '=') {

      switch(preOperator){
        case '+':
          finalResult = SimpleMath.add(firstNumber,secondNumber);
          break;
        case '-':
          finalResult = SimpleMath.sub(firstNumber,secondNumber);
          break;
        case 'x':
          finalResult = SimpleMath.mul(firstNumber, secondNumber);
          break;
        case '/':
          finalResult = SimpleMath.div(firstNumber, secondNumber);
          break;
      }

      return finalResult;
    } else if( // <<-----  Case Pressed Operator ----->>
        btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '='){

      if(firstNumber == 0) {
        firstNumber = double.parse(Converter.eraseBigResult(result));
        developer.log('firstNumber: ' + firstNumber);
      } else {
        secondNumber = double.parse(Converter.eraseBigResult(result));
        developer.log('secondNumber: ' + firstNumber);
      }

      switch(operator){
        case '+':
          finalResult = SimpleMath.add(firstNumber,secondNumber);
          break;
        case '-':
          finalResult = SimpleMath.sub(firstNumber,secondNumber);
          break;
        case 'x':
          finalResult = SimpleMath.mul(firstNumber, secondNumber);
          break;
        case '/':
          finalResult = SimpleMath.div(firstNumber, secondNumber);
          break;
      }
      preOperator = operator;
      operator = btnText;
      result = '';
    } else if (btnText == '%'){ // <<-----  Case % ----->>
      //
      // We divide the firstNumber to get the percent
      //
      result = firstNumber / 100;
      finalResult = SimpleMath.checkDecimalResult(result);

      return finalResult;
    } else if (btnText == ',') { // <<-----  Case Decimal ----->>
      //
      // We check if the result is already a decimal Number
      //
      if(!result.toString().contains(',')) {
        result = result.toString() + ',';
      }

      finalResult = result;
      return finalResult;
    } else if (btnText == '+/-'){ // <<-----  Case +/- ----->>
      //
      // We check if the result is negative or not
      //
      if(result.toString().startsWith('-')){
        result = result.toString().substring(1);
      }else {
        result = '-' + result.toString();
      }

      finalResult = result;
      return finalResult;

    } else if(result.toString().length <= 10){ // <<-----  Case #Number ----->>

      //result = result + btnText;

      if(
        result.toString().length > 3 &&
        !result.toString().contains('.')){
        //
        // We check if the result length is > 3 and doesn't contain a '.'
        //
        Converter.createBigResult(result);

        result = result + btnText;
        finalResult = result;
        return finalResult;
      }else if(
          result.toString().length > 3 &&
          result.toString().contains('.')) {
        //
        // We check if the result length is > 3 and already contain a '.'
        //
        List<String> splicedResult = result.toString().split('.');

        if(splicedResult[1].length > 3){
          //
          // We check if the 2nd part String is > 3
          //
          dynamic croppedResult = StringUtils.addCharAtPosition(splicedResult[1], ".", 3, repeat: true);
          result = splicedResult[0] + '.' + croppedResult.toString();
        }

        result = result + btnText;
        finalResult = result;
        return finalResult;
      }
    }
  }*/
  }
}