import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:patrol_practice/main.dart';
import 'package:flutter/material.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('flutter demo test', ($) async{
    await $.pumpWidget(const MyApp());
    await $.pump(const Duration(seconds: 2));
    expect (find.text('0'), findsOneWidget);
    await $.tap(find.byIcon(Icons.add));
    await $.pump(const Duration(seconds: 2));
    expect(find.text('1'), findsOneWidget);//why finds nothing
    await $.tap(find.byIcon(Icons.add));
    await $.pump(const Duration(seconds: 2));
    expect(find.text('2'), findsOneWidget);//why finds one widget
    await $.tap(find.byIcon(Icons.add));
    await $.pump(const Duration(seconds: 2));
    expect(find.text('3'), findsOneWidget);
  });
}