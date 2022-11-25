import 'dart:math';
import 'package:dice_app/models/adapt.dart';
import 'package:flutter/material.dart';
class DetailedDie extends StatefulWidget {
  final Map argumentsDie;
  const DetailedDie({Key? key,required this.argumentsDie}) : super(key: key);

  @override
  State<DetailedDie> createState() => _DetailedDieState();
}

class _DetailedDieState extends State<DetailedDie> {
  @override
  final List <int> listSum = [];
  void initState() {
    // TODO: implement initState
    print(widget.argumentsDie);
    for(int i = 0; i<widget.argumentsDie["sumStatistics"].length;i++){
      listSum.add(widget.argumentsDie["sumStatistics"][i]);
    }

  }
  @override
  Widget build(BuildContext context) {
    Adapt.initialize(context);
    return  MaterialApp(
      title: "Dice app",
      home: Scaffold(
        appBar: AppBar(title: const Text("Dice app"),),
        body: ListView(
          children: [
            Text("Detailed dice combination information",textAlign:TextAlign.center,style: TextStyle(fontSize: Adapt.pt(15),fontWeight: FontWeight.bold,color: Colors.black),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The dice combination is ${widget.argumentsDie["firstDice"]} and ${widget.argumentsDie["secondDice"]}",style: TextStyle(fontSize: Adapt.pt(15))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Frequency of this combination ${widget.argumentsDie["Frequency"]}",style: TextStyle(fontSize: Adapt.pt(15)),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The maximal number of throws of all the dice combination is  ${widget.argumentsDie["Max"]}",style: TextStyle(fontSize: Adapt.pt(12))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The total number of throws is  ${widget.argumentsDie["totalThrows"]} times",style: TextStyle(fontSize: Adapt.pt(15))),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/detailedSum",arguments: {
                  "Sum": widget.argumentsDie["firstDice"]+widget.argumentsDie["secondDice"],"Frequency": listSum[widget.argumentsDie["firstDice"]+widget.argumentsDie["secondDice"]-2]/widget.argumentsDie["totalThrows"],
                  "MaxValue":listSum.reduce(max),"totalThrows":widget.argumentsDie["totalThrows"]
                });
              },
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The sum of current combination is  ${widget.argumentsDie["sum"]}",style: TextStyle(fontSize: Adapt.pt(15))),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items:  [
          BottomNavigationBarItem(icon: ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          }
          , child: const Icon(Icons.arrow_back,size: 30,)),label: "Back"),
          const BottomNavigationBarItem(icon: Text(""),label: "")
        ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,),
      ),
    );
  }
}
