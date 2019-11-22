import 'package:flutter/cupertino.dart';
import 'package:injectorio/injectorio.dart';
import 'package:memo/memo/domain/memo/memo_repository.dart';
import 'package:memo/memo/infra/memo/floor_memo_repository.dart';
import 'package:memo/memo/infra/memo/memo_translator.dart';
import 'package:memo/memo/infra/persistence/database.dart';

class InfraModule extends Module {
  void prepare() async {
    debugPrint('start');
    var db = await $FloorAppDatabase.databaseBuilder('app.db').build();
    MemoRepository memoRepository =
        FloorMemoRepository(db.memoDao, MemoTranslator());
    single(memoRepository);
    debugPrint('end');
  }
}
