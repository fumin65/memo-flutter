import 'package:floor/floor.dart';

@Entity(primaryKeys: ['id'], tableName: 'memo')
class MemoDto {
  final String id;

  final String title;

  final String content;

  final String createAt;

  final String lastUpdatedAt;

  MemoDto(this.id, this.title, this.content, this.createAt, this.lastUpdatedAt);
}
