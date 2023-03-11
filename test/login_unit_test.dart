
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';


class FirebaseAuthMock extends Mock implements FirebaseAuth {}
class FirebaseUserMock extends Mock implements UserCredential {}




void main()
{

group('Auth', () {
  final FirebaseAuthMock firebaseAuthMock = FirebaseAuthMock(); 
  final FirebaseUserMock baseUser= FirebaseUserMock(); 
  final auth= FirebaseAuth.instance;
   test('signInfirebaseAuth returns a user', () async {
    when(firebaseAuthMock.signInWithEmailAndPassword(
     email: "xyz@gmail.com", password: "XXXXXXX",
    )).thenAnswer((_) => Future<FirebaseUserMock>.value(baseUser));

    expect(await auth.signInWithEmailAndPassword(email:"xyz@gmail.com",password: "XXXXXXX"), baseUser);
    
    verify(firebaseAuthMock.signInWithEmailAndPassword(
      email: "xyz@gmail.com", password: "XXXXXXX",
    )).called(1);
  });
});
}