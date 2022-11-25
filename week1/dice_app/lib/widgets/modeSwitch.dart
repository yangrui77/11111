import 'package:dice_app/models/adapt.dart';
import 'package:flutter/material.dart';
import 'package:dice_app/models/dice.dart';
class ModeSwitch extends StatefulWidget {
  final dice;
  final VoidCallback changeMode;

  ModeSwitch({Key? key,required this.dice,required this.changeMode}) : super(key: key);

  @override
  State<ModeSwitch> createState() => _ModeSwitchState();
}

class _ModeSwitchState extends State<ModeSwitch> {
  @override
  Widget build(BuildContext context) {
    Adapt.initialize(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch.adaptive(
            activeColor: Colors.blue,
            value: widget.dice.equalDistr, onChanged: (value){
          setState(() {
            print(value);
            widget.dice.equalDistr = value;
            widget.changeMode();

          });
        }),
        Text(widget.dice.mode,style: TextStyle(fontSize: Adapt.pt(8)),),
      ],
    );
  }
}
