
import 'package:flutter/material.dart';
import 'package:dice_app/pages/pageall.dart';
import '../models/adapt.dart';
import '../models/dice.dart';
class Navigation extends StatefulWidget {

  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  int currentIndex = 0;
  final List<Widget> pagesList = [
    const Home(),
    const Visualization(),
    const Setting(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice app"),
      ),
      body: pagesList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {

            if(index != 3){
              currentIndex = index;
            }
            else{
              currentIndex = currentIndex;
            }
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: "Home"),
          const BottomNavigationBarItem(icon: Icon(Icons.color_lens,size: 30,),label: "Visualization"),
          const BottomNavigationBarItem(icon: Icon(Icons.settings,size: 30,),label: "Settings"),
          BottomNavigationBarItem(icon: ElevatedButton(onPressed: (){setState(() {
                  if(dice1.undo()==false){
                    final snackBar = SnackBar(content: Text("There is no further undo possible", style: TextStyle(fontSize: Adapt.pt(10),color: Colors.white),),
                    duration: const Duration(seconds: 5),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  // else{
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //     return pagesList[currentIndex];
                  //     }
                  //     )
                  //   );

    //}
    }
            );
    },child: const Icon(Icons.undo,size: 30,),),label: "Undo")
    ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
    ),
    );
  }
}
