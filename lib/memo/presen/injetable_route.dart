import 'package:flutter/cupertino.dart';
import 'package:memo/memo/di/app_component.dart';

abstract class InjectableStatelessRoute extends StatelessWidget {
  final AppComponent component;

  InjectableStatelessRoute(this.component);
}

abstract class InjectableStatefulRoute extends StatefulWidget {
  final AppComponent component;

  InjectableStatefulRoute({Key key, this.component}) : super(key: key);
}
