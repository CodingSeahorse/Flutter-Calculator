import 'package:basic_utils/basic_utils.dart';

class Converter {

  static String eraseBigResult (result) {
    if(result.toString().contains('.')){
      dynamic freshResult = '';

      List<String> subResult = result.toString().split('.');

      for(var i= 0; i < subResult.length;i++){
        freshResult += subResult[i];
      }
      return freshResult;
    }
    return result;
  }

  static String createBigResult(result) {
    return StringUtils.addCharAtPosition(result, ".", 3, repeat: true);
  }
}