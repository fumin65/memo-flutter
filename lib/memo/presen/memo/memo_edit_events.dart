import 'package:memo/memo/presen/memo/memo_registration_events.dart';

class MemoRequired extends MemoRegistrationEvent {
  final String memoId;

  MemoRequired(this.memoId);
}
