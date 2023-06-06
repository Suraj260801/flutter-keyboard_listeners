import 'package:flutter/material.dart';

class SixthTab extends StatelessWidget {
  const SixthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Concepts'),
      ),
      body: const Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text('Column inside column'),)
            ],
          ),
          Text('Sample Text')
        ],
      ),
    );
  }
}
