import 'package:memo/memo/domain/memo/memo_id.dart';

class Memo {
  static const int _maxTitleLength = 100;

  final MemoId id;
  String _title;
  String _content;
  final DateTime createdAt;
  DateTime lastUpdatedAt;

  Memo(this.id, String title, String content, this.createdAt,
      [DateTime lastUpdatedAt]) {
    if (id == null) {
      throw ArgumentError.notNull('id');
    }
    this.title = title;
    this.content = content;
    this.lastUpdatedAt = lastUpdatedAt == null ? createdAt : lastUpdatedAt;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
    _update();
  }

  String get title => _title;

  set title(String value) {
    if (value == null || value.isEmpty) {
      throw ArgumentError('title must not be null or empty.');
    } else if (value.length > _maxTitleLength) {
      throw ArgumentError('title must be $_maxTitleLength or less');
    }
    _title = value;
    _update();
  }

  void _update() {
    lastUpdatedAt = DateTime.now();
  }
}
