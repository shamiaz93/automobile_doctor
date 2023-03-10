
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:automobile_doctor/main.dart';


void main() {  
 
  testWidgets('To see MyApp has MaterialApp widget is in its tree  ',  (WidgetTester tester)  async {  
   await tester.pumpWidget( MaterialApp(
      title: 'AutoDoctor',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
     // home: SplashPage(),
      debugShowCheckedModeBanner: false,
    ),
    ); 

    expect(find.byType(MaterialApp),findsOneWidget);    
       
  });

}