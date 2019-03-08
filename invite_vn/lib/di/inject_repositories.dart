import 'package:invite_vn/data/user/repositories/user_api_service.dart';
import 'package:invite_vn/data/user/repositories/user_repository.dart';
import 'package:invite_vn/data/user/repositories/user_repository_service.dart';
import 'package:invite_vn/di/injector.dart';

void injectRepositories() async {
  Injector.register<UserRepository>(
    type: InjectorType.singleton,
    factoryFunc: () => UserRepositoryService(userApiService: UserApiService()),
  );
}