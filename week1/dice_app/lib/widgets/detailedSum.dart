import 'package:flutter/material.dart';
import 'package:dice_app/models/adapt.dart';
class DetailedSum extends StatefulWidget {
  final Map arguments;
  const DetailedSum({Key? key,required this.arguments}) : super(key: key);

  @override
  State<DetailedSum> createState() => _DetailedSumState();
}

class _DetailedSumState extends State<DetailedSum> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.arguments);
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
            Text("Detailed sum information",textAlign:TextAlign.center,style: TextStyle(fontSize: Adapt.pt(20),fontWeight: FontWeight.bold,color: Colors.black),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The clicked sum value is ${widget.arguments["Sum"]}",style: TextStyle(fontSize: Adapt.pt(15))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Frequency of this sum number  is ${widget.arguments["Frequency"]}",style: TextStyle(fontSize: Adapt.pt(15)),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The maximal number of throws of all the sum number is  ${widget.arguments["MaxValue"]}",style: TextStyle(fontSize: Adapt.pt(12))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The total number of throws is  ${widget.arguments["totalThrows"]} times",style:  TextStyle(fontSize: Adapt.pt(15))),
              ],
            ),
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
