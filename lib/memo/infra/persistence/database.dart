import 'dart:async';

import 'package:floor/floor.dart';
import 'package:memo/memo/infra/persistence/dao/memo_dao.dart';
import 'package:memo/memo/infra/persistence/entity/memo_dto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [MemoDto])
abstract class AppDatabase extends FloorDatabase {
  MemoDao get memoDao;
}
