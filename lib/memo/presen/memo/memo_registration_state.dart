import 'package:flutter/cupertino.dart';

abstract class MemoRegistrationState {
  final bool saveButtonEnabled;
  final bool showsLoading;

  MemoRegistrationState(
      {@required this.saveButtonEnabled, @required this.showsLoading});
}

class Saving extends MemoRegistrationState {
  Saving() : super(saveButtonEnabled: false, showsLoading: true);
}

class Editing extends MemoRegistrationState {
  Editing({@required bool saveButtonEnabled})
      : super(saveButtonEnabled: saveButtonEnabled, showsLoading: false);
}

class Edited extends MemoRegistrationState {
  Edited() : super(saveButtonEnabled: false, showsLoading: false);
}

class FailedToSave extends MemoRegistrationState {
  final String message;

  FailedToSave({this.message})
      : super(saveButtonEnabled: true, showsLoading: false);
}
