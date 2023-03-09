import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

bool? isDialogOpened = false;
showAlertDialog(BuildContext context, AlertDialog alert, bool dismissible) {
  if (isDialogOpened!) {
    Navigator.pop(context);
    isDialogOpened = false;
  }
  showDialog(
    barrierDismissible: dismissible,
    context: context,
    builder: (BuildContext context) {
      isDialogOpened = true;
      return alert;
    },
  ).then((_) => isDialogOpened = false);
}

void main() {
  testWidgets('test showAlertDialog function', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: const Text('Test App')),
      ),
    ));

    expect(isDialogOpened, false);

    showAlertDialog(
      scaffoldKey.currentContext!,
      AlertDialog(
        title: const Text('Custom Dialog'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
      true,
    );
    
    await tester.pump();
    expect(isDialogOpened, true);

    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();
    expect(isDialogOpened, false);
  });
}