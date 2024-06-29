import 'package:dio/dio.dart';
import 'package:quick_log/quick_log.dart';

import 'cache_helper.dart';

class DioHelper {
  DioHelper() {
    _dio.interceptors.add(AppInterceptor());
  }

  final _dio = Dio(
    BaseOptions(
      baseUrl: "",
      // baseUrl: "https://thimar.amr.aait-d.com/api/",
      headers: {"Accept": "application/json"},
    ),
  );

  Future<CustomResponse> get(String path) async {
    try {
      if (path.isEmpty) {
        // Fake API
        await Future.delayed(const Duration(seconds: 2));
        return CustomResponse(isSuccess: true);
      } else {
        final response = await _dio.get(path);
        return CustomResponse(isSuccess: true, data: response.data);
      }
    } on DioException catch (ex) {
      return handleException(ex);
    }
  }

  Future<CustomResponse> send(String path, {Map<String, dynamic>? data}) async {
    try {
      if (path.isEmpty) {
        await Future.delayed(const Duration(seconds: 2));
        return CustomResponse(isSuccess: true);
      } else {
        final response = await _dio.post(path, data: data);
        return CustomResponse(isSuccess: true, data: response.data);
      }
    } on DioException catch (ex) {
      return handleException(ex);
    }
  }

  CustomResponse handleException(DioException ex) {
    String? msg = ex.response?.data["message"];
    return CustomResponse(isSuccess: false, message: msg ?? ex.type.name);
  }
}

class CustomResponse {
  final bool isSuccess;
  final dynamic data;
  String? message;

  CustomResponse({required this.isSuccess, this.message, this.data}) {
    message = message ?? data?["message"] ?? "Failed Try Again Later";
  }
}

class AppInterceptor extends Interceptor {
  final log = const Logger('');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    log.fine("onRequest");
    log.info("( ${options.method} )${options.baseUrl}${options.path}");
    log.fine("Data");
    log.fine(options.data);
    log.fine("Query Parameters");
    log.fine(options.queryParameters);
    options.headers.putIfAbsent("Authorization", () => "Bearer ${CacheHelper.token}",);
    log.fine("*"*30);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    log.error("onError");
    log.error("onError ${err.type}");
    log.error("onError ${err.stackTrace}");
    log.error(err.response?.data??err.message);
    log.error("*"*30);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    log.fine("onResponse");
    log.fine(response.data);
    log.fine("*"*30);
  }
}
