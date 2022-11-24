import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_exceptions.dart';
import 'local_storage_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(Dio(), ref.watch(localStorageProvider));
});

class ApiService {
  final Dio _dioClient;
  final LocalStorageService _localStorageService;

  ApiService(this._dioClient, this._localStorageService) {
    _dioClient.options = BaseOptions(
      baseUrl: "http://doosan.gurumustardoil.com/api/v1",
      responseType: ResponseType.json,
      connectTimeout: 8000,
      receiveTimeout: 8000,
      sendTimeout: 8000,
    );
    _dioClient.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<dynamic> postRequest(
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    bool headersRequired = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dioClient.post(
        path,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(
          headers: headersRequired
              ? {
                  HttpHeaders.authorizationHeader:
                      "Bearer ${await _localStorageService.getToken()}",
                }
              : null,
        ),
      );
      final jsonResponse = response.data;
      final status = jsonResponse["status"];
      final message = jsonResponse["message"];
      if (status) {
        return jsonResponse;
      } else {
        return Future.error(message);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getRequest(
    String path, {
    Map<String, dynamic>? params,
    bool headersRequired = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dioClient.get(
        path,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(
          headers: headersRequired
              ? {
                  HttpHeaders.authorizationHeader:
                      "Bearer ${await _localStorageService.getToken()}",
                }
              : null,
        ),
      );
      final jsonResponse = response.data;
      String? error;
      if (jsonResponse is Map) {
        error = jsonResponse["error"];
      }
      if (error == null) {
        return jsonResponse;
      } else {
        return Future.error(error);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }
}
