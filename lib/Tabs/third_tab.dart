import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  State<ThirdTab> createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  ValueNotifier<double> appBarHeight = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    print('building ThirdTab');
    appBarHeight.value = MediaQuery.of(context).size.height * 0.1;
    return ValueListenableBuilder(
      valueListenable: appBarHeight,
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: const Text('EditableText'),
              toolbarHeight: appBarHeight.value,
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if(appBarHeight.value==0){
                        appBarHeight.value=MediaQuery.of(context).size.height * 0.1;
                      }else{
                        appBarHeight.value = 0;
                      }
                      print('hi');
                    },
                    child: const Text('click me')),
              ],
            )));
      },
    );
  }
}
