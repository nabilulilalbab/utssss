import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:uas/main.dart';

void main() {
 testWidgets('Login renders and navigates to Dashboard', (WidgetTester tester) async {
   // Build app
   await tester.pumpWidget(const MyApp());

   // Login screen shows core elements
   expect(find.text('Selamat Datang'), findsOneWidget);
   expect(find.byIcon(Icons.person), findsOneWidget);
   expect(find.byIcon(Icons.lock), findsOneWidget);
   expect(find.text('Login'), findsOneWidget);

   // Tap Login and navigate
   await tester.tap(find.text('Login'));
   await tester.pumpAndSettle();

   // Dashboard assertions
   expect(find.text('Dashboard'), findsOneWidget);
   expect(find.text('Menu'), findsOneWidget);
 });
}
