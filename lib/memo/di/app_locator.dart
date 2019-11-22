import 'package:inject/inject.dart';
import 'package:memo/memo/app/usecase/fetch_memos_usecase.dart';

abstract class AppLocator {
  @provide
  FetchMemosUseCase get fetchMemosUseCase;
}
