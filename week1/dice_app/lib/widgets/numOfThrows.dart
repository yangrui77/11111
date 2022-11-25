import 'package:flutter/material.dart';
import 'package:dice_app/models/adapt.dart';
class NumOfThrows extends StatefulWidget {
  final dice;
  const NumOfThrows({Key? key,required this.dice}) : super(key: key);

  @override
  State<NumOfThrows> createState() => _NumOfThrowsState();
}

class _NumOfThrowsState extends State<NumOfThrows> {
  @override
  Widget build(BuildContext context) {
    Adapt.initialize(context);
    return Center(
      child:
        Container(
          alignment: Alignment.center,
          width: Adapt.pt(400),
          height: Adapt.pt(20),
          // decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 5,),borderRadius: const BorderRadius.all(Radius.circular(10))),
          child:RichText(
            text: TextSpan(
                text: "Dices has been thrown ",
                style: TextStyle(fontSize: Adapt.pt(11),color: Colors.white,backgroundColor: Colors.blue),
                children: <TextSpan>[
                  TextSpan(text: "${widget.dice.numberOfThrows}",style: TextStyle(fontSize: Adapt.pt(12),color: Colors.black,fontWeight: FontWeight.bold,backgroundColor: Colors.blue),),
                  TextSpan(text: " times after the last RESET",style: TextStyle(fontSize: Adapt.pt(11),color: Colors.white,backgroundColor: Colors.blue),)
                ]
            ),
          ),
        ),

    );
  }
}
