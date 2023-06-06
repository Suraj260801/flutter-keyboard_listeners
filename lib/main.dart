import 'package:flutter/material.dart';
import 'package:keyboard_listeners/pages/home_page.dart';
import 'package:keyboard_listeners/utils/custom_route.dart';



void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myTheme = ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blueGrey,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
      pageTransitionsTheme:  const PageTransitionsTheme(
          builders: {
            TargetPlatform.android:ZoomPageTransitionsBuilder()
          }
      ),
      // Other theme properties...
    );
    return const MaterialApp(
      title: 'Localizations Sample App',
      home: HomePage(),
      onGenerateRoute: CustomRoute.gnerateRoute,
    );
  }
}



