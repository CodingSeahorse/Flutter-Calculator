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

  static String checkBigResult(result) {
    if(!result.toString().contains('.')){
      return StringUtils.addCharAtPosition(result, ".", 3, repeat: true);
    }else{
      List<String> splicedResult = result.toString().split('.');

      if (splicedResult[1].length > 3) {
        //
        // We check if the 2nd part String is > 3
        //
        dynamic croppedResult = StringUtils.addCharAtPosition(
            splicedResult[1], ".", 3, repeat: true);
        result = splicedResult[0] + '.' + croppedResult.toString();
      }
      return result;
    }

  }
}