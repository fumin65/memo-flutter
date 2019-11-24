import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo/memo/di/app_component.dart';
import 'package:memo/memo/presen/injetable_route.dart';
import 'package:memo/memo/presen/memo/memo_edit_bloc.dart';
import 'package:memo/memo/presen/memo/memo_edit_events.dart';
import 'package:memo/memo/presen/memo/memo_edit_state.dart';
import 'package:memo/memo/presen/memo/memo_registration_events.dart';
import 'package:memo/memo/presen/memo/memo_registration_state.dart';

class MemoEditRoute extends InjectableStatelessRoute {
  final String _memoId;

  MemoEditRoute(AppComponent component, this._memoId) : super(component);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('編集'),
        ),
        body: BlocProvider(
          builder: (context) => component.memoEditBloc,
          child: _Editor(_memoId),
        ));
  }
}

class _Editor extends StatefulWidget {
  final String _memoId;

  _Editor(this._memoId);

  @override
  State<StatefulWidget> createState() => _EditorState(_memoId);
}

class _EditorState extends State<_Editor> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final String _memoId;
  MemoEditBloc _bloc;

  _EditorState(this._memoId);

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _titleController.addListener(() {
      _bloc.add(TitleChanged(_titleController.text));
    });
    _bloc.add(MemoRequired(_memoId));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemoEditBloc, MemoRegistrationState>(
      listener: (context, state) {
        if (state is Edited || state is FailedToLoad) {
          Navigator.pop(context);
        } else if (state is FailedToSave) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        } else if (state is Loaded) {
          _titleController.text = state.title;
          _contentController.text = state.content;
          debugPrint('reattached!!');
        }
      },
      child: BlocBuilder<MemoEditBloc, MemoRegistrationState>(
        builder: (context, state) {
          _onSaveButtonPressed() {
            _bloc.add(SaveButtonPressed(
                _titleController.text, _contentController.text));
          }

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: state.saveButtonEnabled ? null : Colors.grey,
              child: Icon(Icons.save),
              onPressed: state.saveButtonEnabled ? _onSaveButtonPressed : null,
            ),
            body: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _titleController,
                    autofocus: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    decoration: InputDecoration.collapsed(
                      hintText: 'タイトル',
                      hintStyle:
                          TextStyle(fontSize: 32, color: Colors.grey.shade400),
                    ),
                  ),
                ),
                Divider(),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _contentController,
                          keyboardType: TextInputType.multiline,
                          minLines: 10,
                          maxLines: null,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          decoration: InputDecoration.collapsed(
                            hintText: '内容',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
