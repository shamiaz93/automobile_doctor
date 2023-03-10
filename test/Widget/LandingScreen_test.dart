import 'package:flutter/material.dart';
import 'package:automobile_doctor/LandingScreen.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {  


  testWidgets('Landing screen has app bar  ',  (WidgetTester tester)  async {  
   await tester.pumpWidget( LandingScreen());
   var finder=find.byIcon(Icons.login);   
    expect(find.text('login'),findsNothing);    
       
  });

  
}