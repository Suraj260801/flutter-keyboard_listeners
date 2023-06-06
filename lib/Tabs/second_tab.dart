import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  FocusNode focusNode1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    print('building SecondTab');

    return KeyboardListener(
        autofocus: true,
        focusNode: focusNode1,
        onKeyEvent: (event) {
          log('hi ${event.logicalKey.keyLabel}');

          // if(event is RawKeyDownEvent&&event.isControlPressed&&event.isAltPressed){
          //       _showDialog(['Enter+Alt','Combination Key Pressed',''], 1);
          // }
          if (event is KeyRepeatEvent) {
            _showDialog(['Key is Held', event.logicalKey.keyId.toString(), ''],5);
            print('Key is holded');
          }
          if (event is KeyDownEvent) {
            _showDialog(['key pressed',event.timeStamp.toString(),''],2);
            print('Key pressed');
          }
          if (event is KeyUpEvent) {
            print('Key relesed');
          }

          log('key pressed ${event.logicalKey.keyLabel}');
          // log('key pressed ${event.logicalKey.keyId}');
          // log('key pressed ${event.logicalKey.debugName}');
          // log('key pressed ${event.logicalKey.synonyms}');
          // log('key pressed ${event.logicalKey.runtimeType}');
          // log('key pressed ${event.timeStamp}');

          //showEnteredKey('${event.logicalKey.keyLabel} key is entered');
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('KeyboardListener'),
          ),
        ));
  }

  void _showDialog(List<String> popUpDescription,int duration) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: duration),(){
          Navigator.of(context).pop();
        });
        return AlertDialog(
          title: Text(popUpDescription[0]),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                Text('Key Id:${popUpDescription[1]}'),
                Text('Key Debug Name:${popUpDescription[2]}')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK')),
          ],
        );
      },
    );
  }
}
