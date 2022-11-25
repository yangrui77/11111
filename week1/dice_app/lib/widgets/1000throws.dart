import 'package:flutter/material.dart';
import 'package:dice_app/models/adapt.dart';
class Test extends StatefulWidget {
  final VoidCallback test;
  const Test({Key? key, required this.test}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    Adapt.initialize(context);
    return ElevatedButton.icon(
        style: ButtonStyle(elevation: MaterialStateProperty.all(3),),
        onPressed: (){
             widget.test();
        }, icon: const Icon(Icons.add_box_outlined), label: Text("Run 1000 times",style: TextStyle(fontSize: Adapt.pt(10)),)
    );
  }
}

