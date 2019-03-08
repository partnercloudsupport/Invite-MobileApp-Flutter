import 'dart:async';

import 'package:http/http.dart';
import 'package:invite_vn/modules/network/api_service.dart';

const USER = "/api/v1/user";

class UserApiService extends ApiService {
  Future<Response> login({
    method = POST,
    url = "$HOST$USER/login",
    body,
  });

  Future<Response> logout({
    method = POST,
    url = "$HOST$USER/logout",
    body,
    headers,
  });
}
