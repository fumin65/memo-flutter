import 'package:memo/memo/app/usecase/create_memo_usecase.dart';

class MemoRegistrationBloc {
  final CreateMemoUseCase _createMemoUseCase;

  MemoRegistrationBloc(this._createMemoUseCase);

  void dispose() {}
}
