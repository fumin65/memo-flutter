import 'package:inject/inject.dart';
import 'package:memo/memo/domain/memo/memo_repository.dart';

abstract class DomainLocator {
  @provide
  MemoRepository get memoRepository;
}
