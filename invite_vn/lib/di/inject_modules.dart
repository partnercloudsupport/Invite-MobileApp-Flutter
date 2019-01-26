import 'package:invite_vn/di/injector.dart';
import 'package:invite_vn/modules/auth/facebook_auth.dart';

void injectModules() async {
  Injector.register(
    type: InjectorType.singleton,
    factoryFunc: () => FacebookAuth(),
  );
}
