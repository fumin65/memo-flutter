import 'package:inject/inject.dart';
import 'package:memo/memo/domain/memo/memo_repository.dart';
import 'package:memo/memo/infra/memo/floor_memo_repository.dart';
import 'package:memo/memo/infra/memo/memo_translator.dart';
import 'package:memo/memo/infra/persistence/database.dart';

@module
class InfraModule {
  @provide
  @asynchronous
  @singleton
  Future<AppDatabase> provideDatabase() async {
    return $FloorAppDatabase.databaseBuilder('app.db').build();
  }

  @singleton
  @provide
  MemoRepository memoRepository(AppDatabase db) {
    return FloorMemoRepository(db.memoDao, MemoTranslator());
  }
}
