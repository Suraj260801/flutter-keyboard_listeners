import 'package:flutter/material.dart';
import 'package:keyboard_listeners/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BuildContext dialogContext;
  FocusNode node0 = FocusNode();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, Constants.firstTab),
                  child: const Text('RawKeyboardListener')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, Constants.secondTab),
                  child: const Text('KeyboardListener')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, Constants.thirdTab),
                  child: const Text('EditableText')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, Constants.forthTab),
                  child: const Text('FocusableActionDetector')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, Constants.fifthTab),
                  child: const Text('Stack Concepts')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, Constants.sixthTab),
                  child: const Text('Column Concepts')),
            ),
          ],
        ),
      ),
    );
  }
}
