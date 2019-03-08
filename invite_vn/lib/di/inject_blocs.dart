import 'package:invite_vn/di/injector.dart';
import 'package:invite_vn/features/profile_setting/user_bloc.dart';

void injectBlocs() async {
  Injector.register(
    type: InjectorType.singleton,
    factoryFunc: () => UserBloc(userRepository: Injector.get()),
  );
}
