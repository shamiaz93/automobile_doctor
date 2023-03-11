
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:automobile_doctor/loginPage.dart';


class FirebaseAuthMock extends Mock implements FirebaseAuth {}
class FirebaseUserMock extends Mock implements UserCredential {}

// refernce : https://www.youtube.com/watch?v=75i5VmTI6A0
//https://flutterprojects.blog/2021/05/17/widget-testing-with-mockito/


void main(){
  
  
testWidgets('Renders sign in', (WidgetTester tester) async {
   final FirebaseAuthMock firebaseAuthMock = FirebaseAuthMock(); 
   final FirebaseUserMock baseUser= FirebaseUserMock(); 
   final auth= FirebaseAuth.instance;

  // Build our app and trigger a frame.
  await tester.pumpWidget(LoginPage());   


   when(firebaseAuthMock.signInWithEmailAndPassword(
     email: "xyz@gmail.com", password: "XXXXXXX",
    )).thenAnswer((_) => Future<FirebaseUserMock>.value(baseUser));

  
  expect(find.text('Sign in'), findsOneWidget);

  verify(auth.signInWithEmailAndPassword(email: "xyz@gmail.com", password: "XXXXXXX",)).called(1);
});


}