import 'package:memo/memo/domain/memo/memo.dart';
import 'package:memo/memo/domain/memo/memo_id.dart';
import 'package:memo/memo/domain/memo/memo_repository.dart';

class FetchMemoUseCase {
  final MemoRepository _repository;

  FetchMemoUseCase(this._repository);

  Future<Memo> handle(String memoId) => _repository.memo(MemoId(memoId));
}
