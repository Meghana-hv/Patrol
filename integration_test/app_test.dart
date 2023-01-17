// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:patrol/patrol.dart';
import 'config.dart';
import 'package:patrol_practice/main.dart';

// This is an example integration test using Patrol. Use it as a base to
// create your own Patrol-powered test.
//
// To run it, you have to use `patrol drive` instead of `flutter test`.

  void main() {
// Patrol test configuration, and intializing patrol driver
    patrolTest(
        'test description',
        config: patrolConfig,
        nativeAutomation: true,
        (PatrolTester $) async {

          await $.pumpWidget(const MyApp());

          await $.native.openNotifications();
          await $.native.pressBack();
          //opening demo application
       await $.pumpWidget(const MyApp());
       expect (find.text('0'), findsOneWidget);
       await $.tap(find.byIcon(Icons.add));
       expect(find.text('1'), findsOneWidget);
       await $.tap(find.byIcon(Icons.add));
       await $.pump();
       //performing action on native features
      await $.native.pressRecentApps();//it makes flutter app run in bg
      await $.native.openNotifications();//pulls down notification
      //perform action on wifi
      await $.native.disableWifi();
      await $.native.enableWifi();
      await $.native.pressBack();//pushes back notification bar
      await $.native.pressRecentApps();//brings back the flutter application
        await $.pumpWidget(const MyApp());
        expect(find.text('2'), findsOneWidget);
        await $.tap(find.byIcon(Icons.add));
        expect(find.text('3'), findsOneWidget);
        await $.pump();
        await $.tap(find.byIcon(Icons.add));
        await $.pump();
        expect(find.text('4'), findsOneWidget);
        await $.pump();
        await $.native.pressRecentApps();
       await $.native.openNotifications();
       await $.native.openQuickSettings();
        await $.native.pressBack();
        await $.native.pressBack();
        await $.native.pressRecentApps();
       await $.pumpWidget(const MyApp());

    });
    }
