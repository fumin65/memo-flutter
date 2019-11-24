import 'package:memo/memo/presen/memo/memo_registration_state.dart';

class Loading extends MemoRegistrationState {
  Loading() : super(saveButtonEnabled: false, showsLoading: true);
}

class Loaded extends MemoRegistrationState {
  final String title;
  final String content;

  Loaded({this.title, this.content})
      : super(saveButtonEnabled: true, showsLoading: false);
}

class FailedToLoad extends MemoRegistrationState {
  FailedToLoad() : super(saveButtonEnabled: false, showsLoading: false);
}
