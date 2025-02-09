import 'package:desafiomobile/Widgets/MinimumWidgets/CheckBoxStyle.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxDone extends StatelessWidget {
  final String Id;
  final bool controlVariable;
  final Function(bool) onChanged;
  final Function(String id) updatecheckedId;

  CustomCheckBoxDone({
    required this.Id,
    required this.controlVariable,
    required this.onChanged,
    required this.updatecheckedId
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: BorderSide(
        color: CheckBoxStyle.getBorderSideColor(),
        width: 2.0,
      ),
      checkColor: Colors.white,
      value: controlVariable,
      fillColor: MaterialStateProperty.resolveWith(CheckBoxStyle.getFillColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      onChanged: (bool? value) {
        if (value != null) {
          onChanged(value);
        }
        updatecheckedId(this.Id);
      },
    );
  }
}