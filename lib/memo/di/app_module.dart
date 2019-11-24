import 'package:inject/inject.dart';
import 'package:memo/memo/app/usecase/create_memo_usecase.dart';
import 'package:memo/memo/app/usecase/fetch_memos_usecase.dart';
import 'package:memo/memo/domain/memo/memo_repository.dart';

@module
class AppModule {
  @provide
  @singleton
  FetchMemosUseCase provideFetchMemosUseCase(MemoRepository repository) {
    return FetchMemosUseCase(repository);
  }

  @provide
  @singleton
  CreateMemoUseCase provideCreateMemoUseCase(MemoRepository repository) {
    return CreateMemoUseCase(repository);
  }
}
