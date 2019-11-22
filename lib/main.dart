import 'package:flutter/material.dart';
import 'package:memo/memo/di/app_component.dart';
import 'package:memo/memo/di/app_module.dart';
import 'package:memo/memo/di/infra_module.dart';
import 'package:memo/memo/di/presen_module.dart';
import 'package:memo/memo/presen/memo/memo_list_route.dart';

Future<void> main() async {
  var component =
      await AppComponent.create(InfraModule(), AppModule(), PresenModule());
  runApp(MyApp(component));
}

class MyApp extends StatelessWidget {
  final AppComponent _component;

  MyApp(this._component);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MemoListRoute(_component),
    );
  }
}
