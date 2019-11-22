import 'package:intl/intl.dart';
import 'package:memo/memo/domain/memo/memo.dart';
import 'package:memo/memo/domain/memo/memo_id.dart';
import 'package:memo/memo/infra/persistence/entity/memo_dto.dart';

class MemoTranslator {
  static final DateFormat _format = DateFormat('yyyy/MM/dd HH:mm:ss', 'ja_JP');

  Memo toMemo(MemoDto dto) {
    return Memo(MemoId(dto.id), dto.title, dto.content,
        _format.parse(dto.createAt), _format.parse(dto.lastUpdatedAt));
  }

  MemoDto toDto(Memo memo) {
    return MemoDto(memo.id.value, memo.title, memo.content,
        _format.format(memo.createdAt), _format.format(memo.lastUpdatedAt));
  }
}
