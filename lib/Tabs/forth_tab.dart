
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForthTab extends StatefulWidget {
  const ForthTab({Key? key}) : super(key: key);

  @override
  State<ForthTab> createState() => _ForthTabState();
}

class _ForthTabState extends State<ForthTab> {

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final GlobalKey _buttonKey=GlobalKey();
  final FocusNode _counterButtonFocus=FocusNode();
  Color btnColor=Colors.deepOrange;
  @override
  Widget build(BuildContext context) {
    print('building ForthTab');

    return Scaffold(
      appBar: AppBar(title: const Text('FocusableActionDetector'),),
      body: FocusableActionDetector(
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.arrowUp): IncrementIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowDown):
          DecrementIntent(),
          LogicalKeySet(LogicalKeyboardKey.metaLeft,
              LogicalKeyboardKey.altLeft): MetaIntent(),
          LogicalKeySet(LogicalKeyboardKey.escape): EscapeIntent(),
          LogicalKeySet(LogicalKeyboardKey.enter): EnterIntent()
        },
        actions: {
          IncrementIntent:
          CallbackAction<IncrementIntent>(onInvoke: (intent) {
              _counter.value=_counter.value+1;

          }),
          DecrementIntent:
          CallbackAction<DecrementIntent>(onInvoke: (intent) {
              _counter.value=_counter.value-1;


          }),
          MetaIntent: CallbackAction<MetaIntent>(onInvoke: (intent) {
            _showDialog(
                'Windows Key pressed', 'This key is not allowed');
            return null;
          }),
          EscapeIntent:
          CallbackAction<EscapeIntent>(onInvoke: (intent) {
            _showDialog('You really want to quit.',
                "Don't worry you will not lose the progress");
            return null;
          }),
          EnterIntent: CallbackAction<EnterIntent>(onInvoke: (intent) {

            (_buttonKey.currentState as ElevatedButton).onPressed;

          }),
        },
        child: Center(
          child: Container(
            height: 50,
            width: 100,
            decoration: const BoxDecoration(),
            child: ElevatedButton(
              focusNode: _counterButtonFocus,
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.deepOrange),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: () {

              },
              onFocusChange: (val){
                print(val);
              },
              child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (BuildContext context, value, Widget? child) {
                  return Text(
                    _counter.value.toString(),
                    style: const TextStyle(fontSize: 30),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
  // Define a method to show the dialog box
  void _showDialog(String popUpTitle, String popUpDescription) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        (_buttonKey.currentState as ElevatedButton).focusNode?.requestFocus(_counterButtonFocus);
        return AlertDialog(
          title: Text(popUpTitle),
          content: Text(popUpDescription),
          actions: <Widget>[
            TextButton(
              key: _buttonKey,
              focusNode: FocusNode(),
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


class IncrementIntent extends Intent {}

class DecrementIntent extends Intent {}

class MetaIntent extends Intent {}

class EscapeIntent extends Intent {}

class EnterIntent extends Intent {}