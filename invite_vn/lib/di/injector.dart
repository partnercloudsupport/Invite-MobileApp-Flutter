import 'dart:async';

typedef FactoryFunc<D> = D Function();

String _getKey(Type type, String name) {
  return name == null ? type.toString() : type.toString() + name;
}

class Injector {
  Injector._internal();

  static final _factories = Map<String, _Factory<dynamic>>();

  static Future<void> register<D>({
    InjectorType type,
    String name,
    FactoryFunc<D> factoryFunc,
  }) async {
    String key = _getKey(D, name);
    _factories[key] = _Factory<D>(
      type,
      factoryFunc,
    );
  }

  static D get<D>({
    String name,
  }) {
    String key = _getKey(D, name);
    return _factories[key].getDependency();
  }
}

enum InjectorType { provide, singleton }

class _Factory<D> {
  InjectorType type;
  D dependency;
  FactoryFunc factoryFunc;

  _Factory(
      this.type,
      this.factoryFunc,
      );

  D getDependency() {
    switch (type) {
      case InjectorType.provide:
        return factoryFunc() as D;

      case InjectorType.singleton:
        if (dependency == null) {
          dependency = factoryFunc() as D;
        }
        return dependency;

      default:
        return null;
    }
  }
}