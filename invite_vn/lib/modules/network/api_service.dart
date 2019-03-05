import 'package:http/http.dart' as http;

const GET = 0;
const POST = 1;
const PUT = 2;
const DELETE = 3;

const METHOD = Symbol("method");
const URL = Symbol("url");
const HEADERS = Symbol("headers");
const BODY = Symbol("body");

String _getSymbolName(Symbol symbol) {
  final str = RegExp("(\".+\")").firstMatch(symbol.toString()).group(1);
  return str.substring(1, str.length - 1);
}

abstract class ApiService {
  @override
  Future<http.Response> noSuchMethod(Invocation invocation) async {
    final method = invocation.namedArguments[METHOD];
    final url = invocation.namedArguments[URL];
    final Map<String, String> headers = invocation.namedArguments[HEADERS];

    var body;
    invocation.namedArguments.forEach((key, value) {
      if (key == BODY) {
        body = value;
      } else if (!(key == METHOD || key == URL || key == HEADERS)) {
        body[_getSymbolName(key)] = value;
      }
    });

    switch (method) {
      case GET:
        return http.get(
          url,
          headers: headers,
        );

      case POST:
        return http.post(
          url,
          headers: headers,
          body: body,
        );

      case PUT:
        return http.put(url, headers: headers, body: body);

      case DELETE:
        return http.delete(
          url,
          headers: headers,
        );

      default:
        return null;
    }
  }
}
