import 'package:flutter/material.dart';



class CheckBoxStyle {
  static Color getFillColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = {
      MaterialState.pressed,
      MaterialState.focused,
      MaterialState.hovered
    };
    if (states.contains(MaterialState.selected)) {
      return Color.fromRGBO(198, 207, 220, 1);
    }
    return Colors.white;
  }

  static Color getBorderSideColor (){
    return Color.fromRGBO(198, 207, 220, 1);
  }

}
