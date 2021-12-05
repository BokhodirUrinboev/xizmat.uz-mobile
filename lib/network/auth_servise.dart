import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:xizmat_uz/model/Token.dart';
import 'package:xizmat_uz/network/local_service.dart';

class AuthService {
  LocaleService localeService = LocaleService();

  // var dio = Dio(); // with default Options

// Set default configs

// or new Dio with a BaseOptions instance.
//   var options = BaseOptions(
//     baseUrl: 'https://www.xx.com/api',
//     connectTimeout: 5000,
//     receiveTimeout: 3000,
//   );

  Dio clientCreate() {
    var cookieJar = CookieJar();

    var dio = Dio(BaseOptions(
      baseUrl: 'https://backend-8c530141.nhost.app/auth',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }

  void login(
      {required String email,
      required String password,
      required Function onComplate}) {
    clientCreate().post("/login", data: FormData.fromMap(
        // {"email": "ilhomShergoziyev@gmail.com", "password": "1234567"}
        {"email": email, "password": password})).then((value) {
      var token = Token.fromJson(value.data);
      localeService.jwtToken(token.jwt_token);
      onComplate();
    }).onError((error, stackTrace) {
      print("error $error");
    });
  }

  void register({required String email, required String password,required Function onComplate}) {
    clientCreate().post("/register", data: FormData.fromMap(
        // {"email": "ilhomShergoziyev@gmail.com", "password": "1234567"}
        {"email": email, "password": password})).then((value) {
      var token = Token.fromJson(value.data);
      localeService.jwtToken(token.jwt_token);
      onComplate();
    }).onError((error, stackTrace) {
      print("error $error");
    });
  }
}
