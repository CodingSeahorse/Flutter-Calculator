import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_calculator/CalculatorLogic.dart';
import 'utils/MyColors.dart';
import 'utils/SimpleMath.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // We instantiate a SimpleMath object
  CalculatorLogic calculatorLogic = CalculatorLogic();
  // We instantiate a SimpleMath object
  Widget calcButton(
      String btnTxt,
      Color btnColor,
      Color txtColor,
      Color borderColor) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: btnColor,
          minimumSize: const Size(80, 80),
          side: BorderSide(
              width: 5,
              color: borderColor
          ),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20)
      ),
      child: Text(btnTxt,
          style: TextStyle(
              fontSize: 35,
              color: txtColor)
      ),
      onPressed: (){
        calculatorLogic.calculate(btnTxt);
        getCurrentText();
      },
    );
  }

  Widget calculateButtonZero(
      String btnTxt,
      Color btnColor,
      Color txtColor,
      Color borderColor) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: MyColors.myNumberBtnColor,
          minimumSize: Size(80, 80),
          side: BorderSide(
              width: 5,
              color: MyColors.myNumberBtnBorderColor
          ),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.fromLTRB(34, 20, 128, 20)
      ),
      child: Text('0',
          style: TextStyle(
              fontSize: 35,
              color: MyColors.myBtnTextColor)
      ),
      onPressed: (){
        calculatorLogic.calculate(btnTxt);
        getCurrentText();
      },
    );
  }

  void getCurrentText(){
    setState(() {
      calculatorLogic.text = calculatorLogic.finalResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myBaseBackgroundColor,
        appBar: AppBar(
            title: const Text('My Calculator App'),
            backgroundColor: MyColors.myTitleBackgroundColor
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Calculator Display
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 300,
                        height: 120,
                        child: AutoSizeText(
                            calculatorLogic.text,
                            style: TextStyle(
                                color: MyColors.myBtnTextColor,
                                fontSize: 100),
                            textAlign: TextAlign.end,
                            minFontSize: 40,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis )
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //here Btn functions
                    calcButton(
                        'AC',
                        MyColors.mySpezOpsBackgroundColor,
                        MyColors.myBtnTextColor,
                        MyColors.mySpezOpsBorderColor),
                    calcButton(
                        '+/-',
                        MyColors.mySpezOpsBackgroundColor,
                        MyColors.myBtnTextColor,
                        MyColors.mySpezOpsBorderColor),
                    calcButton(
                        '%',
                        MyColors.mySpezOpsBackgroundColor,
                        MyColors.myBtnTextColor,
                        MyColors.mySpezOpsBorderColor),
                    calcButton(
                        '/',
                        MyColors.myOpsBackgroundColor,
                        MyColors.myBtnTextColor,
                        MyColors.myOpsBorderColor)
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //here Btn functions
                    calcButton(
                        '9',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        '8',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        '7',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        'x',
                        MyColors.myOpsBackgroundColor,
                        MyColors.myBtnTextColor,
                        MyColors.myOpsBorderColor)
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //here Btn functions
                    calcButton(
                        '4',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        '5',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        '6',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        '+',
                        MyColors.myOpsBackgroundColor,
                        MyColors.myBtnTextColor,
                        MyColors.myOpsBorderColor)
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //here Btn functions
                    calcButton(
                        '1',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        '2',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        '3',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        '-',
                        MyColors.myOpsBackgroundColor,
                        MyColors.myBtnTextColor,
                        MyColors.myOpsBorderColor)
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calculateButtonZero(
                      '0',
                      MyColors.myNumberBtnColor,
                      MyColors.myBtnTextColor,
                      MyColors.myNumberBtnBorderColor
                    ),
                    calcButton(
                        '.',
                        MyColors.myNumberBtnColor,
                        MyColors.myBtnTextColor,
                        MyColors.myNumberBtnBorderColor),
                    calcButton(
                        '=',
                        MyColors.myOpsBackgroundColor,
                        MyColors.myBtnTextColor,
                        MyColors.myOpsBorderColor)
                  ],
                )
              ]
          ),
        )
    );
  }
}