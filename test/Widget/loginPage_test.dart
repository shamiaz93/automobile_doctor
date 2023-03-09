import 'package:flutter_test/flutter_test.dart';
import 'package:automobile_doctor/loginPage.dart';
import 'package:flutter/material.dart';

// refernce : https://www.youtube.com/watch?v=75i5VmTI6A0
//https://flutterprojects.blog/2021/05/17/widget-testing-with-mockito/

  class MockOnPressedFunction {
  int called = 0;

  void handler() {
    called++;
  }
}


void main(){

  late MockOnPressedFunction mockOnPressedFunction;
   setUp(() {
    mockOnPressedFunction = MockOnPressedFunction();
  });



  Widget MakeLoginTestable({Widget child}){
    return Scaffold();   
    }
  
  
     testWidgets('login page test ',  (WidgetTester tester)  async {
      LoginPage page=LoginPage();
      await tester.pumpWidget(page);  
          
    
  });
   


}