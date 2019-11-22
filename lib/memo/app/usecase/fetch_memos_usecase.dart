import 'package:memo/memo/domain/memo/memo.dart';
import 'package:memo/memo/domain/memo/memo_repository.dart';

class FetchMemosUseCase {
  final MemoRepository _repository;

  FetchMemosUseCase(this._repository);

  Stream<List<Memo>> handle() {
    return _repository.allMemos();
  }
}
