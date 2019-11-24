import 'package:memo/memo/domain/memo/memo_id.dart';
import 'package:memo/memo/domain/memo/memo_repository.dart';

class UpdateMemoUseCase {
  final MemoRepository _repository;

  UpdateMemoUseCase(this._repository);

  Future<void> handle(String targetId, String title, String content) async {
    final memo = await _repository.memo(MemoId(targetId));
    memo
      ..title = title
      ..content = content;
    await _repository.save(memo);
  }
}
