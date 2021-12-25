import 'package:basic_utils/basic_utils.dart';
import 'dart:developer' as developer;

class Converter {

  static String eraseBigResult (result) {

      dynamic freshResult = '';

      List<String> subResult = result.toString().split('.');

      for(var i= 0; i < subResult.length;i++){
        freshResult += subResult[i];
      }
      return freshResult;
  }

  static String bigResultCreator(dynamic result, int count){
    List<String> splicedResult = result.toString().split(',');
    String tempRes = splicedResult[0] + splicedResult[1];
    result = StringUtils.addCharAtPosition(tempRes, ",", count, repeat: false);
    return result;
  }

  static String checkBigResult(result) {
    // TODO: Create better Readable Resolution
    /*if(!result.toString().contains(',')){
      return StringUtils.addCharAtPosition(result, ",", 1, repeat: false);
    } else{
      if(result.toString().length > 3 && result.toString().length <= 6){
        return bigResultCreator(result, 2);
      } else if (result.toString().length > 6){
        return bigResultCreator(result, 3);
      } else if (result.toString().length > 7){
        return bigResultCreator(result, 4);
      } else if (result.toString().length > 8){
        return bigResultCreator(result, 5);
      }
    }*/
    return result;

  }

}