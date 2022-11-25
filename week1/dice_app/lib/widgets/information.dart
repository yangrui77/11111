import 'package:flutter/material.dart';

//this widget is used to give user some information about this app
class Information extends StatelessWidget {
  final height;
  const Information({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: height,
          alignment: Alignment.center,
          child:const Text(" You can press the space around these two dices to throw dices. If you want to clear all the records, please press RESET button. "
              "If you want to switch to the other mode, please press the switch component. If you want to throw dices 1000 times at once, please press"
              " Run 1000 times button",style: TextStyle(fontSize: 20,color: Colors.red),));
  }
}
