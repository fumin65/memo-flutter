import 'package:memo/memo/domain/memo/memo.dart';
import 'package:memo/memo/domain/memo/memo_id.dart';
import 'package:memo/memo/domain/memo/memo_repository.dart';
import 'package:memo/memo/infra/memo/memo_translator.dart';
import 'package:memo/memo/infra/persistence/dao/memo_dao.dart';
import 'package:uuid/uuid.dart';

class FloorMemoRepository implements MemoRepository {
  final MemoDao _dao;
  final MemoTranslator _translator;

  FloorMemoRepository(this._dao, this._translator);

  @override
  Stream<List<Memo>> allMemos() {
    return _dao
        .allMemos()
        .map((dtos) => dtos.map((dto) => _translator.toMemo(dto)));
  }

  @override
  Future<Memo> memo(MemoId id) {
    return _dao.memo(id.value).then((dto) => _translator.toMemo(dto));
  }

  @override
  MemoId newId() {
    return MemoId(Uuid().v4());
  }

  @override
  Future<void> save(Memo memo) {
    return _dao.save(_translator.toDto(memo));
  }
}
