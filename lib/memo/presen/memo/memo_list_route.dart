import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memo/memo/di/app_component.dart';
import 'package:memo/memo/domain/memo/memo.dart';
import 'package:memo/memo/presen/injetable_route.dart';
import 'package:memo/memo/presen/memo/memo_bloc.dart';
import 'package:memo/memo/presen/memo/memo_edit_route.dart';
import 'package:memo/memo/presen/memo/memo_registration_route.dart';
import 'package:provider/provider.dart';

class MemoListRoute extends InjectableStatelessRoute {
  MemoListRoute(AppComponent component) : super(component);

  @override
  Widget build(BuildContext context) {
    return Provider<MemoBloc>(
      builder: (context) => component.memoBloc,
      dispose: (context, value) => value.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Memo List'),
        ),
        body: MemoList(component),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MemoRegistrationRoute(component)));
          },
        ),
      ),
    );
  }
}

class MemoList extends StatefulWidget {
  final AppComponent component;

  MemoList(this.component);

  @override
  State<StatefulWidget> createState() {
    return _MemoListState();
  }
}

class _MemoListState extends State<MemoList> {
  static final _format = DateFormat('yyyy/MM/dd HH:mm:ss', 'ja_JP');

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<MemoBloc>(context);
    return StreamBuilder<List<Memo>>(
      stream: bloc.memos,
      builder: (context, snapshot) {
        if (snapshot.data == null || snapshot.data.isEmpty) {
          return Center(
            child: Text('No memos'),
          );
        }
        return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: snapshot.data.length * 2 - 1,
            itemBuilder: (context, index) {
              if (index.isOdd) {
                return Divider();
              }
              final i = snapshot.data.length - (index ~/ 2) - 1;
              final memo = snapshot.data[i];
              return ListTile(
                title: Text(memo.title),
                subtitle: Text(_format.format(memo.lastUpdatedAt)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MemoEditRoute(widget.component, memo.id.value)));
                },
              );
            });
      },
    );
  }
}
