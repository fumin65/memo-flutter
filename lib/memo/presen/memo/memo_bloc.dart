import 'dart:async';

import 'package:memo/memo/app/usecase/fetch_memos_usecase.dart';
import 'package:memo/memo/domain/memo/memo.dart';

class MemoBloc {
  final FetchMemosUseCase _fetchMemosUseCase;

  Stream<List<Memo>> get memos => _fetchMemosUseCase.handle();

  MemoBloc(this._fetchMemosUseCase);

  void dispose() {}
}
