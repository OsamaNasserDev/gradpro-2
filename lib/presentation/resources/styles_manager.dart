import 'package:flutter/cupertino.dart';
import 'package:gradpro/presentation/resources/font_manager.dart';

TextStyle _getTextStyle({required double fontSize, required FontWeight fontWeight, required Color color}){
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}


// regular style

TextStyle getRegularStyle({double fontSize = FontSize.s12 , FontWeight fontWeight = FontWeightManager.Regular, required Color color}){
  return _getTextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}


// Medium style

TextStyle getMediumStyle({double fontSize = FontSize.s12 , FontWeight fontWeight = FontWeightManager.Medium, required Color color}){
  return _getTextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}



// light style

TextStyle getLightStyle({double fontSize = FontSize.s12 , FontWeight fontWeight = FontWeightManager.light, required Color color}){
  return _getTextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}



// Bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12 , FontWeight fontWeight = FontWeightManager.Bold, required Color color}){
  return _getTextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}



// SemiBold style

TextStyle getSemiBoldStyle({double fontSize = FontSize.s12 , FontWeight fontWeight = FontWeightManager.SemiBold, required Color color}){
  return _getTextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}