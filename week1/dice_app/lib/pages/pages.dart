import 'package:flutter/material.dart';
import 'package:dice_app/widgets/widgets.dart';
import '../models/dice.dart';
import 'package:dice_app/models/adapt.dart';
final Dice dice1 = Dice();

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void reset(){
    setState(() {
      dice1.resetStatistics();
    });
  }
  void test(){
    setState(() {
        dice1.throwDice1000();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double widthOFScreen = MediaQuery.of(context).size.width;//get the width of screen
    double heightOFScreen = MediaQuery.of(context).size.height;//get the height of screen
    Adapt.initialize(context);
    return  ListView(
        children: [
        //this widget is used to give user some information about this app

    Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    //     icon: const Icon(Icons.backspace_sharp), label: const Text("RESET",style: TextStyle(fontSize: 25),)),
    // test button, when pressed once, two dices will be thrown together 1000 times
    Test(test: test),
    //switch widget together with its mode description
    //when user wants to change the mode, a snackbar will pop up first to inform user that if the mode is changed, all records of the previous mode will be cleared
    //if user click yes, then the mode will be changed and the corresponding mode description text will be shown along with the switch widget.
    Text("Current mode is ${dice1.mode}",style: TextStyle(fontSize: Adapt.pt(9)),),
    ],
    ),
    SizedBox(height: heightOFScreen*0.02,),
    //this row widget stores how many times these two dices have been thrown after the last reset
    NumOfThrows(dice: dice1),
    SizedBox(height: heightOFScreen*0.02,),
    //this center widget contains two containers which show the actual dice values after the last throw.
    //images are used to show the result
    //images are cited from https://dice.virtuworld.net
    // if a certain area is tapped, throw two dices once
    InkWell(
    //if a certain area is tapped, throw the two dices once
    onTap: (){
    setState(() {
    dice1.throwDice();
    });
    },
    child: TwoDice(widthOFScreen: widthOFScreen, dice: dice1,),
    ),
      ]);
  }
}

class Visualization extends StatefulWidget {
  const Visualization({Key? key}) : super(key: key);

  @override
  State<Visualization> createState() => _VisualizationState();
}

class _VisualizationState extends State<Visualization> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Adapt.initialize(context);
    double widthOFScreen = MediaQuery.of(context).size.width;//get the width of screen
    double heightOFScreen = MediaQuery.of(context).size.height;//get the height of screen
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumOfThrows(dice: dice1),
            SizedBox(height: heightOFScreen*0.02,),
            Text("Current mode is ${dice1.mode}",style: TextStyle(fontSize: Adapt.pt(9)),),
          ],
        ),
        Wrap(
          children: [
            Container(alignment: Alignment.center,child: Text("Sum statistics distribution",style: TextStyle(fontSize: Adapt.pt(20))),),
            SumColor(widthOFScreen: widthOFScreen, minDie:Dice.minDie,maxDie:Dice.maxDie,dice: dice1,),
            Container(alignment: Alignment.center,child: Text("Die statistics distribution",style: TextStyle(fontSize: Adapt.pt(20))),),
            DieColor(widthOFScreen: widthOFScreen,minDie:Dice.minDie,maxDie:Dice.maxDie, dice: dice1,),
          ],
        )
      ],
    );
  }
}

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  void reset(){
    setState(() {
      dice1.resetStatistics();
    });
  }
  void test(){
    setState(() {
      for(int i = 0; i< 1000;i++){
        dice1.throwDice();
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double widthOFScreen = MediaQuery.of(context).size.width;//get the width of screen
    double heightOFScreen = MediaQuery.of(context).size.height;//get the height of screen
    return ListView(
      children: [
        SizedBox(height: heightOFScreen*0.3,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Reset(reset:reset),
            NumOfThrows(dice: dice1),
            ModeSwitch(dice: dice1, changeMode: dice1.changeMode),
          ],
        ),
      ],
    );
  }
}



