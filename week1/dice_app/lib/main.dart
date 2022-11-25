import 'dart:js';

import 'package:dice_app/pages/pageall.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:dice_app/models/dice.dart';
import 'widgets/widgets.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp( ProviderScope(child: MyApp(),));
}


class MyApp extends StatelessWidget {
  Map routes = {
  "/":(context) => const Navigation(),
  "/detailedSum":(context,{arguments}) => DetailedSum(arguments: arguments,),
    "/detaileddie":(context,{arguments}) => DetailedDie(argumentsDie: arguments,),
  };


  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Navigation(),
      initialRoute: "/",
       onGenerateRoute: (RouteSettings settings){
          final String? name = settings.name;
          final Function? pageContentBuilder = routes[name];
          if(pageContentBuilder != null){
            if(settings.arguments != null){
              final Route route = MaterialPageRoute(builder: (context)=>pageContentBuilder(context,arguments:settings.arguments));
              return route;
            }else{
              final Route route = MaterialPageRoute(builder: (context)=>pageContentBuilder(context));
              return route;
      }
            }
          return null;

       },
    );
  }
}


