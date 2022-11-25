import 'dart:math';

import 'package:color_scale/color_scale.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SumColor extends StatefulWidget {
  final widthOFScreen;
  final int maxDie;
  final int minDie;
  // final List<int> sumStatistics;
  // final numofthrow;
  final dice;
  const SumColor({Key? key,required this.widthOFScreen,required this.minDie,required this.maxDie,required this.dice}) : super(key: key);

  @override
  State<SumColor> createState() => _SumColorState();
}

class _SumColorState extends State<SumColor> {
  final List <int> listNew= [];
  @override
  void initState(){
    for(int i = 0; i<widget.dice.sumStatistics.length;i++){
      listNew.add(widget.dice.sumStatistics[i]);
    }
  }
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(widget.widthOFScreen*0.3, 0,widget.widthOFScreen*0.3, 0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2*(widget.maxDie)-2*(widget.minDie)+1,
      ),
      itemCount: 2*(widget.maxDie)-2*(widget.minDie)+1,
      itemBuilder: (BuildContext ctx, index){
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context,"/detailedSum",arguments: {"Sum": index+2*(widget.minDie),"Frequency": (listNew[index])/widget.dice.numberOfThrows,
            "MaxValue":listNew.reduce(max),"totalThrows":widget.dice.numberOfThrows});
          },
          child: ColorScaleWidget(value: listNew[index].toDouble(),minValue: 0,maxValue: listNew.reduce(max).toDouble()+0.000001,minColor: Colors.white,maxColor: Colors.black,),) ;
      },
    );
  }
}
