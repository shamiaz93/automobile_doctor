
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:automobile_doctor/splashScr.dart';

void main() {  

    //SharedPreferences.setMockInitialValues({});
 
  testWidgets('verify  splashScr  ',  (WidgetTester tester)  async {  
   await tester.pumpWidget( 
    MaterialApp( 
        home: Scaffold(
            body: Container(
             child:   EasySplashScreen(     
             logo: Image.asset('assets/images/autodoc.png'),
             logoWidth: 90,
             title: Text(
             "We serve you at your choice of location",
             style:  TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold,
                ),
            ),
            )
       )
    )
  )
);

expect(find.text('We serve you at your choice of location'), findsOneWidget);
   // expect(find.byType(TextStyle),findsNothing);
  });

}