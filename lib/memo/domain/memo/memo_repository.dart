import 'package:memo/memo/domain/memo/memo.dart';
import 'package:memo/memo/domain/memo/memo_id.dart';

abstract class MemoRepository {
  MemoId newId();

  Future<Memo> memo(MemoId id);

  Future<void> save(Memo memo);

  Stream<List<Memo>> allMemos();
}
