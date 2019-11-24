import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:memo/memo/app/usecase/create_memo_usecase.dart';
import 'package:memo/memo/presen/memo/memo_registration_events.dart';
import 'package:memo/memo/presen/memo/memo_registration_state.dart';

class MemoRegistrationBloc
    extends Bloc<MemoRegistrationEvent, MemoRegistrationState> {
  final CreateMemoUseCase _createMemoUseCase;

  MemoRegistrationBloc(this._createMemoUseCase);

  @override
  MemoRegistrationState get initialState => Editing(saveButtonEnabled: false);

  @override
  Stream<MemoRegistrationState> mapEventToState(
      MemoRegistrationEvent event) async* {
    if (event is TitleChanged) {
      yield Editing(saveButtonEnabled: event.title.isNotEmpty);
    } else if (event is SaveButtonPressed) {
      yield Saving();

      try {
        await _createMemoUseCase.handle(event.title, event.content);
        yield Edited();
      } catch (error) {
        debugPrint(error.toString());
        yield FailedToSave(message: '保存に失敗しました');
      }
    }
  }
}
