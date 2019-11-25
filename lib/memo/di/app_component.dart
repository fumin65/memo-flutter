import 'package:inject/inject.dart';
import 'package:memo/memo/di/app_component.inject.dart';
import 'package:memo/memo/di/app_module.dart';
import 'package:memo/memo/di/infra_module.dart';
import 'package:memo/memo/di/presen_locator.dart';
import 'package:memo/memo/di/presen_module.dart';

@Injector(const [InfraModule, AppModule, PresenModule])
abstract class AppComponent implements PresenLocator {
  static create(
      InfraModule infraModule, AppModule appModule, PresenModule presenModule) {
    return AppComponent$Injector.create(infraModule, appModule, presenModule);
  }
}
