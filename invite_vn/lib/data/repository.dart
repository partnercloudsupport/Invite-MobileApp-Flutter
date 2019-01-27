abstract class Repository<Q, S> {

  Future<S> get(Q request);

  Future<S> insert(Q request);

  Future<S> update(Q request);

  Future<S> delete(Q request);
}