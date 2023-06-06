import 'package:flutter/material.dart';
import 'package:keyboard_listeners/Tabs/fifth_tab.dart';
import 'package:keyboard_listeners/Tabs/first_tab.dart';
import 'package:keyboard_listeners/Tabs/forth_tab.dart';
import 'package:keyboard_listeners/Tabs/second_tab.dart';
import 'package:keyboard_listeners/Tabs/sixth_tab.dart';
import 'package:keyboard_listeners/Tabs/third_tab.dart';
import 'package:keyboard_listeners/pages/home_page.dart';


import 'constants.dart';
class CustomRoute {
  static Route<dynamic> gnerateRoute(RouteSettings settings){
    switch(settings.name){
      case Constants.homePage:
        return MaterialPageRoute(builder: (context)=>const HomePage());
      case Constants.firstTab:
        return MaterialPageRoute(builder: (context)=>const FirstTab());
      case Constants.secondTab:
        return MaterialPageRoute(builder: (context)=>const SecondTab());
      case Constants.thirdTab:
        return MaterialPageRoute(builder: (context)=>const ThirdTab());
      case Constants.forthTab:
        return MaterialPageRoute(builder: (context)=>const ForthTab());
      case Constants.fifthTab:
        return MaterialPageRoute(builder: (context)=>const FifthTab());
      case Constants.sixthTab:
        return MaterialPageRoute(builder: (context)=>const SixthTab());
      default:
        return _errorRoute();
    }
  }
  static _errorRoute(){
    return MaterialPageRoute(builder: (context)=>
        Scaffold(
          appBar: AppBar(title: const Text('Error'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {

              },
              child: const Text("Back to Home Screen"),

            ),
          ),
        )
    );
}
}
