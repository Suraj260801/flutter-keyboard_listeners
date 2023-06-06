import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  List<String> keys = [];
  ValueNotifier<String> keyPressed = ValueNotifier<String>('None');
  final Set<LogicalKeyboardKey> _pressedKeys = <LogicalKeyboardKey>{};

  bool isKeyHeld(LogicalKeyboardKey key) {
    return _pressedKeys.contains(key);
  }

  @override
  Widget build(BuildContext context) {
    print('building firstTab');
    return RawKeyboardListener(
        autofocus: true,

        onKey: (event) {
          if(isKeyHeld(event.logicalKey)){
            _showDialog("Key is held", "Release the key");
          }
          if (event is RawKeyDownEvent) {
            keyPressed.value = event.logicalKey.keyLabel;
            _pressedKeys.add(event.logicalKey);

            // if (keys.contains(keyPressed.value)) {
            //   _showDialog('Key Repeted', 'Try another key');
            //   return;
            // }
            keys.add(keyPressed.value);
            print('key pressed');
          }
          if (event is RawKeyUpEvent) {
            _pressedKeys.remove(event.logicalKey);

            print('key relesed');
          }

        },
        focusNode: FocusNode(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('RawKeyboardListener'),
          ),
          body: Center(
            child: ValueListenableBuilder(
              valueListenable: keyPressed,
              builder: (BuildContext context, value, Widget? child) {
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.deepOrange)
                      ),
                        onPressed: () {
                          print('pressed');
                        },
                        child: Text(keys[index]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemCount: keys.length,
                );
              },
            ),
          ),
        ));
  }

  void _showDialog(String popUpTitle, String popUpDescription) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(popUpTitle),
            content: Text(popUpDescription),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}