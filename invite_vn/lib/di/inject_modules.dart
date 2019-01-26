import 'package:invite_vn/di/injector.dart';
import 'package:invite_vn/modules/auth/facebook_auth.dart';
import 'package:invite_vn/modules/auth/google_auth.dart';

void injectModules() async {
  Injector.register(
    type: InjectorType.singleton,
    factoryFunc: () => FacebookAuth(),
  );

  Injector.register(
    type: InjectorType.singleton,
    factoryFunc: () => GoogleAuth(),
  );
}
