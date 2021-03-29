import 'package:get_it/get_it.dart';
import 'package:todoapp/core/services/DialogService.dart';
import 'package:todoapp/core/services/authenticationManager.dart';
import 'package:todoapp/core/services/navigationManager.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationManager());
  locator.registerLazySingleton(() => AuthenticationManager());
  locator.registerLazySingleton(() => DialogService());

}