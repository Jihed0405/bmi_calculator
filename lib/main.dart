import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
      ).copyWith(
        appBarTheme: AppBarTheme(color:Color(0xFF0A0D22)),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        // colorScheme: ColorScheme.fromSwatch(
        //     primarySwatch: const MaterialColor(0XFF0a0d22, <int, Color>{
        //   50: Color.fromRGBO(10, 13, 34, .1),
        //   100: Color.fromRGBO(10, 13, 34, .2),
        //   200: Color.fromRGBO(10, 13, 34, .3),
        //   300: Color.fromRGBO(10, 13, 34, .4),
        //   400: Color.fromRGBO(10, 13, 34, .5),
        //   500: Color.fromRGBO(10, 13, 34, .6),
        //   600: Color.fromRGBO(10, 13, 34, .7),
        //   700: Color.fromRGBO(10, 13, 34, .8),
        //   800: Color.fromRGBO(10, 13, 34, .9),
        //   900: Color.fromRGBO(10, 13, 34, 1),
        // }))
      ),
      home: InputPage(),
    );
  }
}


