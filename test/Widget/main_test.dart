
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:automobile_doctor/main.dart';


void main() {  

  //Widget MakeMainTestable({Widget child}){
    // return MaterialApp(
    //  title: 'AutoDoctor',
     // theme: ThemeData(
      //  primarySwatch: Colors.red,
    //  ),
    //  home: child,
     // debugShowCheckedModeBanner: false,
   // ); 
   //}
  
  
  testWidgets('To see MyApp has MaterialApp widget is in its tree ',  (WidgetTester tester)  async {
   //this works if we comment in main.dart file line 25 home: SplashPage(),
   await tester.pumpWidget( MyApp()); 

    expect(find.byType(MaterialApp),findsOneWidget);    
       
  });

}