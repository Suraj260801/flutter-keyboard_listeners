import 'package:flutter/material.dart';

class FifthTab extends StatelessWidget {
  const FifthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack'),),
      body: Stack(
        //alignment: Alignment.topCenter,
        children: [

          Container(
            height: 600,
            width: 600,
            color: Colors.yellow,
          ),
          Positioned(
            height: 400,
            width:400,
            left: 100,
            top: 0,
            child: Container(
              height: 300,
              width: 300,
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 300,
            left: 100,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
            ),
          )

        ],
      ),
    );
  }
}
