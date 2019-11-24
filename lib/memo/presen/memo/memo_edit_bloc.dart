import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:memo/memo/app/usecase/fetch_memo_usecase.dart';
import 'package:memo/memo/app/usecase/update_memo_usecase.dart';
import 'package:memo/memo/presen/memo/memo_edit_events.dart';
import 'package:memo/memo/presen/memo/memo_edit_state.dart';
import 'package:memo/memo/presen/memo/memo_registration_events.dart';
import 'package:memo/memo/presen/memo/memo_registration_state.dart';

class MemoEditBloc extends Bloc<MemoRegistrationEvent, MemoRegistrationState> {
  final FetchMemoUseCase _fetchMemoUseCase;
  final UpdateMemoUseCase _updateMemoUseCase;

  String _editedMemoId;

  MemoEditBloc(this._fetchMemoUseCase, this._updateMemoUseCase);

  @override
  MemoRegistrationState get initialState => Editing(saveButtonEnabled: true);

  @override
  Stream<MemoRegistrationState> mapEventToState(
      MemoRegistrationEvent event) async* {
    if (event is MemoRequired) {
      _editedMemoId = event.memoId;
      yield Loading();

      try {
        final memo = await _fetchMemoUseCase.handle(event.memoId);
        if (memo == null) {
          yield FailedToLoad();
        } else {
          yield Loaded(title: memo.title, content: memo.content);
        }
      } catch (error) {
        debugPrint(error.toString());
        yield FailedToLoad();
      }
    } else if (event is TitleChanged) {
      yield Editing(saveButtonEnabled: event.title.isNotEmpty);
    } else if (event is SaveButtonPressed) {
      yield Saving();
      try {
        await _updateMemoUseCase.handle(
            _editedMemoId, event.title, event.content);
        yield Edited();
      } catch (error) {
        yield FailedToSave(message: '保存に失敗しました');
      }
    }
  }
}
