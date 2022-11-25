import 'package:flutter/material.dart';

class TwoDice extends StatefulWidget {
  final widthOFScreen;
  // final dicePicNum1;
  // final dicePicNum2;
  final dice;
  const TwoDice({Key? key, required this.widthOFScreen, required this.dice}) : super(key: key);

  @override
  State<TwoDice> createState() => _TwoDiceState();
}

class _TwoDiceState extends State<TwoDice> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   print(widget.dice.die[0]);
  // }
  @override
  Widget build(BuildContext context) {
    print(widget.dice.die[0]);
    return Center(
        child:Wrap(
          children: [
            Container(
              alignment: Alignment.center,
              width:widget.widthOFScreen*0.2,
              height:widget.widthOFScreen*0.2,
              child: Image.asset("images/${widget.dice.die[0]}.png",fit: BoxFit.fill,width:widget.widthOFScreen*0.2,height: widget.widthOFScreen*0.2 ,),
            ),
            SizedBox(width: widget.widthOFScreen*0.1,),
            Container(
              alignment: Alignment.center,
              width:widget.widthOFScreen*0.2,
              height:widget.widthOFScreen*0.2,
              child: Image.asset("images/${widget.dice.die[1]}.png",fit: BoxFit.fill,width:widget.widthOFScreen*0.2,height: widget.widthOFScreen*0.2 ,),
            ),

          ],
        )
    );
  }
}
