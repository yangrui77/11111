import 'dart:math';
import 'package:color_scale/color_scale.dart';
import 'package:flutter/material.dart';
import 'package:dice_app/models/dice.dart';
class DieColor extends StatefulWidget {
  final widthOFScreen;
  final int maxDie;
  final int minDie;
  // final List dieStatistics;
  // final int numofThrows;
  // final List<int> sumStatistics;
  final dice;
  const DieColor({Key? key,required this.widthOFScreen, required this.minDie, required this.maxDie,required this.dice}) : super(key: key);

  @override
  State<DieColor> createState() => _DieColorState();
}

class _DieColorState extends State<DieColor> {
  final List <int> listNew= [];
  final List dieNew = [
    for (var row = 0; row < 6; row += 1)
      [for (var column = 0; column <6; column += 1)
        0],
  ];
  void initState(){
    for(int i = 0; i<widget.dice.sumStatistics.length;i++){
      listNew.add(widget.dice.sumStatistics[i]);
    }
    for(int i = 0; i<6;i++){
      for(int j = 0; j < 6; j += 1){
        dieNew[i][j] = (widget.dice.dieStatistics[i][j] as int);
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(widget.widthOFScreen*0.3, 0,widget.widthOFScreen*0.3, 0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.maxDie-widget.minDie+1,
      ),
      itemCount: (widget.maxDie-widget.minDie+1)*(widget.maxDie-widget.minDie+1),
      itemBuilder: (BuildContext ctx, index){
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context,"/detaileddie",arguments: {"firstDice": (index~/(widget.maxDie-widget.minDie+1))+widget.minDie,"secondDice":index%(widget.maxDie-widget.minDie+1)+1,
              "Frequency": (dieNew[(index~/(widget.maxDie-widget.minDie+1))][index%(widget.maxDie-widget.minDie+1)])/widget.dice.numberOfThrows,
              // "Max":widget.dice.dieStatistics.expand((i) => i).toList().cast<num>().reduce(max),
              "Max" : dieNew.expand((i) => i).toList().cast<int>().reduce(max),
              "totalThrows":widget.dice.numberOfThrows, "sum": ((index~/(widget.maxDie-widget.minDie+1))+widget.minDie+index%(widget.maxDie-widget.minDie+1)+1),
            "sumStatistics":listNew});

          },
          child: ColorScaleWidget(value: dieNew[(index~/(widget.maxDie-widget.minDie+1))][(index%(widget.maxDie-widget.minDie+1))].toDouble(),minValue: 0,maxValue: dieNew.expand((i) => i).toList().cast<int>().reduce(max).toDouble()+0.000001,minColor: Colors.white,maxColor: Colors.black,) ,
        );
      },
    );
  }
}
