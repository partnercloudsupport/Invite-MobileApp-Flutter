const HOST = "http://localhost:4000";

abstract class Repository<Q, S> {
  Future<S> get(Q request);

  Future<S> insert(Q request);

  Future<S> update(Q request);

  Future<S> delete(Q request);

  Map<String, String> getHeaders() {
    return {
      "id": "0f2d2cf6-10a2-492a-82f3-1d5bcd400d9b",
      "access_token":
          "eyJhbGciOiJIUzI1NiIsImtpZCI6IjBmMmQyY2Y2LTEwYTItNDkyYS04MmYzLTFkNWJjZDQwMGQ5Ymludml0ZV90ZXZpaW5fMDgwMjIwMTlhIiwidHlwIjoiSldUIn0.eyJpc3MiOiJcdTAwMDEiLCJzdWIiOiJcdTAwMDEiLCJhdWQiOiIwZjJkMmNmNi0xMGEyLTQ5MmEtODJmMy0xZDViY2Q0MDBkOWIiLCJleHAiOjE1NTE4NjYzMzUsIm5iZiI6MTU1MTc4MTczNSwiaWF0IjoxNTUxNzc5OTM1LCJqdGkiOiIwZjJkMmNmNi0xMGEyLTQ5MmEtODJmMy0xZDViY2Q0MDBkOWIifQ.pzfy8Lnh4ybnBb_06ViecupK29yqAnq6Y9GQiaMozw0",
      "version": "1",
    };
  }
}
