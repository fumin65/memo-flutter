import 'package:floor/floor.dart';
import 'package:memo/memo/infra/persistence/entity/memo_dto.dart';

@dao
abstract class MemoDao {
  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> save(MemoDto memoDto);

  @Query('SELECT * FROM memo WHERE id = :id')
  Future<MemoDto> memo(String id);

  @Query('SELECT * FROM memo')
  Stream<List<MemoDto>> allMemos();
}
