import 'package:inject/inject.dart';
import 'package:memo/memo/app/usecase/fetch_memos_usecase.dart';
import 'package:memo/memo/presen/memo/memo_bloc.dart';

@module
class PresenModule {
  @provide
  MemoBloc provideMemoBloc(FetchMemosUseCase fetchMemosUseCase) {
    return MemoBloc(fetchMemosUseCase);
  }
}
