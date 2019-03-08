import 'dart:async';

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

    http.Response response;

    switch (method) {
      case GET:
        response = await http.get(
          url,
          headers: headers,
        );
        break;

      case POST:
        response = await http.post(
          url,
          headers: headers,
          body: body,
        );
        break;

      case PUT:
        response = await http.put(
          url,
          headers: headers,
          body: body,
        );
        break;

      case DELETE:
        response = await http.delete(
          url,
          headers: headers,
        );
        break;

      default:
        break;
    }

    if (response != null) {
      print(response.body);
    }

    return response;
  }
}

const HOST = "http://10.0.2.2";

Map<String, String> _headers = {};

void updateHeaders({String id, String accessToken, String version}) {
  _headers = {
    "id": id,
    "access_token": accessToken,
    "version": version,
  };
}

Map<String, String> getHeaders() {
  return _headers;
}
