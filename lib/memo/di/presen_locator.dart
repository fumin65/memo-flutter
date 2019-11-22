import 'package:inject/inject.dart';
import 'package:memo/memo/presen/memo/memo_bloc.dart';

abstract class PresenLocator {
  @provide
  MemoBloc get memoBloc;
}
