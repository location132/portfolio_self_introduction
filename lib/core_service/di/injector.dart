import './injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt di = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => di.init();

class Injector {
  Injector._();

  static void init() {
    configureDependencies();
  }

  static void reset() {
    di.reset();
  }
}
