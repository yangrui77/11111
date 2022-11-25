import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_app/models/adapt.dart';



class Reset extends ConsumerStatefulWidget {
  final VoidCallback reset;
  const Reset({Key? key, required this.reset}) : super(key: key);

  @override
  ConsumerState<Reset> createState() => _ResetState();
}

class _ResetState extends ConsumerState<Reset> {
  @override
  Widget build(BuildContext context) {
    Adapt.initialize(context);
    return ElevatedButton.icon(
        style: ButtonStyle(elevation: MaterialStateProperty.all(3)),
        onPressed: (){
          setState(() {
            final snackBar = SnackBar(content: Text("Do you really want to clear all the throwing dice records? If Yes, just click YES, if not, do nothing",
              style: TextStyle(fontSize: Adapt.pt(10),color: Colors.white),),
                duration: const Duration(seconds: 5),
                action: SnackBarAction(label: "YES", onPressed: (){
                  widget.reset();

                }));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        },
        icon: const Icon(Icons.backspace_sharp), label: Text("RESET",style: TextStyle(fontSize: Adapt.pt(8)),));
  }
}
