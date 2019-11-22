import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memo/memo/di/app_component.dart';
import 'package:memo/memo/presen/injetable_route.dart';

class MemoRegistrationRoute extends InjectableStatelessRoute {
  MemoRegistrationRoute(AppComponent component) : super(component);

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Scaffold(
      appBar: AppBar(
        title: Text('登録'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(32),
            child: TextField(
              decoration: InputDecoration(labelText: 'タイトル'),
            ),
          )
        ],
      ),
    );
  }
}
