import 'package:memo/memo/domain/memo/memo.dart';
import 'package:memo/memo/domain/memo/memo_repository.dart';

class CreateMemoUseCase {
  final MemoRepository _repository;

  CreateMemoUseCase(this._repository);

  Future<void> handle(String title, String content) {
    final id = _repository.newId();
    final memo = Memo(id, title, content, DateTime.now());
    return _repository.save(memo);
  }
}
