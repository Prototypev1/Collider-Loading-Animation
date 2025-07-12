import 'dart:convert';
import 'package:collider_loading/config.dart';
import 'package:dio/dio.dart';
import 'package:logger_service/logger_service.dart';

class BaseApiRepository {
  const BaseApiRepository(this._dioClient);
  final Dio _dioClient;

  Future<Map<String, dynamic>> baseGet(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    int maxRetries = 3,
    int retryDelay = 1000,
  }) async {
    final fullUrl = '${Config.baseUrl(null)}$endpoint';
    var retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        final response = await _dioClient.get<String>(
          fullUrl,
          queryParameters: queryParams,
          options: Options(headers: headers),
        );

        if (response.data == null) {
          return {};
        }

        var data = jsonDecode(response.data!);
        if (data is String) {
          data = jsonDecode(data);
        }
        return data as Map<String, dynamic>;
      } on DioException catch (e, stack) {
        final r = e.response;
        if (r != null) {
          if (r.data == null) {
            return {};
          }

          if (r.data!.toString().startsWith('{') || r.data!.toString().startsWith('[')) {
            try {
              final data = jsonDecode(r.data!.toString());
              return data as Map<String, dynamic>;
            } catch (jsonError) {
              Log().e('JSON decoding error: $jsonError', null, stack);
              throw Exception('Invalid JSON response: $jsonError');
            }
          } else if (r.statusCode == 200) {
            return {'statusCode': r.statusCode};
          } else if (r.statusCode == 401 || r.statusCode == 403) {
            if (retryCount < maxRetries - 1) {
              try {
                // await _refreshAccessToken(_localRepository);
                // final newToken = _localRepository.getToken();
                final updatedHeaders = headers != null ? Map<String, String>.from(headers) : <String, String>{};
                //updatedHeaders['Authorization'] = 'Bearer $newToken';

                return baseGet(
                  endpoint,
                  queryParams: queryParams,
                  headers: updatedHeaders,
                  maxRetries: maxRetries,
                  retryDelay: retryDelay,
                );
              } on Exception catch (refreshError, refreshStack) {
                Log().e('Failed to refresh token: $refreshError', refreshError, refreshStack);
                retryCount++;
                await Future<void>.delayed(Duration(milliseconds: retryDelay));
                continue;
              }
            }

            Log().e('unauthorized exception: retries exhausted', r, stack);
            throw Exception('Unauthorized request after retries.');
          } else {
            Log().e('API Error: ${r.statusCode} - ${r.data}', r.data, stack);
            throw Exception('Failed due to server error: ${r.data}');
          }
        } else {
          Log().e('Network error: ${e.message}', null, stack);
          throw Exception('Network error: ${e.message}');
        }
      } on FormatException catch (e, stack) {
        Log().e('JSON decoding error: $e', null, stack);
        throw Exception('Invalid JSON response: $e');
      } on Exception catch (e, stack) {
        Log().e('Unexpected error occurred: $e', null, stack);
        throw Exception('Failed to load data: $e');
      }
    }
    throw Exception('Request failed after $maxRetries attempts.');
  }

  Future<Map<String, dynamic>> basePost(
    String endpoint,
    Map<String, dynamic> requestBody, {
    Map<String, String>? headers,
    int maxRetries = 3,
    int retryDelay = 1000,
  }) async {
    final fullUrl = endpoint.startsWith('http') ? endpoint : '${Config.baseUrl(null)}$endpoint';
    var retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        final defaultHeaders = {'Content-Type': 'application/json'};
        final mergedHeaders = headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;

        final response = await _dioClient.post<String>(
          fullUrl,
          data: jsonEncode(requestBody),
          options: Options(headers: mergedHeaders),
        );

        var data = jsonDecode(response.data!);
        if (data is String) {
          data = jsonDecode(data);
        }
        return data as Map<String, dynamic>;
      } on DioException catch (e, stack) {
        final r = e.response;
        if (r != null) {
          if (r.statusCode == 401 || r.statusCode == 403) {
            if (retryCount < maxRetries - 1) {
              try {
                //await _refreshAccessToken(_localRepository);
                // final newToken = _localRepository.getToken();
                // final updatedHeaders = headers != null ? Map<String, String>.from(headers) : <String, String>{};
                // updatedHeaders['Authorization'] = 'Bearer $newToken';

                retryCount++;
                await Future<void>.delayed(Duration(milliseconds: retryDelay));
                continue;
              } on Exception catch (refreshError, refreshStack) {
                Log().e('Failed to refresh token: $refreshError', refreshError, refreshStack);
                retryCount++;
                await Future<void>.delayed(Duration(milliseconds: retryDelay));
                continue;
              }
            }
            Log().e('Unauthorized exception: retries exhausted', r, stack);
            throw Exception('Unauthorized request after retries.');
          }
          Log().e('API Error: ${r.statusCode} - ${r.data}', r.data, stack);
          throw Exception('Error: ${r.statusCode} - ${r.data}');
        }
        Log().e('Network error: ${e.message}', null, stack);
        throw Exception('Network error: ${e.message}');
      } on Exception catch (e, stack) {
        Log().e('Unexpected error occurred: $e', null, stack);
        throw Exception('Unexpected error: $e');
      }
    }
    throw Exception('Request failed after $maxRetries attempts.');
  }

  // Future<void> _refreshAccessToken(LocalRepository localRepository) async {
  //   final log = Log();
  //   final refreshToken = localRepository.getRefreshToken();
  //   final accessToken = localRepository.getToken();

  //   if (refreshToken == null) {
  //     log.w('Attempted to refresh token, but no refresh token was found.');
  //     throw Exception('No refresh token available.');
  //   }

  //   final refreshUrl = '${Config.baseUrl(null)}${AuthenticationEndpoints.refreshUrl}';
  //   Response<String>? response;

  //   try {
  //     log.d('Attempting to refresh token using URL: $refreshUrl');

  //     response = await _dioClient.post<String>(
  //       refreshUrl,
  //       data: {
  //         'refreshToken': refreshToken,
  //         'accessToken': accessToken,
  //       },
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final responseBody = response.data;
  //       if (responseBody != null && responseBody.isNotEmpty) {
  //         try {
  //           final dynamic firstDecodeResult = jsonDecode(responseBody);

  //           if (firstDecodeResult is String) {
  //             final innerJsonString = firstDecodeResult;

  //             final data = jsonDecode(innerJsonString) as Map<String, dynamic>;

  //             final newAccessToken = data['accessToken'] as String? ?? data['jwt'] as String?;
  //             final newRefreshToken = data['refreshToken'] as String?;

  //             if (newAccessToken != null && newAccessToken.isNotEmpty) {
  //               log.i('Successfully refreshed access token (double decoded).');
  //               await localRepository.storeToken(newAccessToken);
  //               if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
  //                 log.i('Storing new refresh token.');
  //                 await localRepository.storeRefreshToken(newRefreshToken);
  //               }
  //               return;
  //             } else {
  //               log.e('Refresh token response inner JSON is missing expected keys (accessToken/jwt).', data);
  //               throw Exception('Invalid refresh token response format (Missing keys in inner JSON).');
  //             }
  //           }
  //         } on Exception catch (e, stack) {
  //           Log()
  //             ..e('Failed to decode refresh token JSON response.', e, stack)
  //             ..e('Raw response body was: $responseBody');
  //           throw Exception('Invalid refresh token response format (Not JSON).');
  //         }
  //       } else {
  //         Log().e('Refresh token response was successful (${response.statusCode}) but body was empty.');
  //         throw Exception('Empty refresh token response.');
  //       }
  //     } else {
  //       Log()
  //         ..e('Refresh token request failed with status: ${response.statusCode}')
  //         ..e('Error response body: ${response.data}');
  //       if (response.statusCode == 401 || response.statusCode == 403) {
  //         throw Exception('Refresh token failed: Unauthorized (${response.statusCode}). Needs logout.');
  //       }
  //       throw DioException(
  //         requestOptions: response.requestOptions,
  //         response: response,
  //         error: 'Refresh token failed with status ${response.statusCode}',
  //         type: DioExceptionType.badResponse,
  //       );
  //     }
  //   } on DioException catch (e, stack) {
  //     log.e('DioException during token refresh: ${e.message}', e.error, stack);
  //     if (e.response != null) {
  //       Log()
  //         ..e('DioException response status: ${e.response?.statusCode}')
  //         ..e('DioException response data: ${e.response?.data}');
  //     }
  //     rethrow;
  //   } catch (e, stack) {
  //     log.e('Unexpected error during token refresh: $e', e, stack);
  //     throw DioException(
  //       requestOptions: response?.requestOptions ?? RequestOptions(path: refreshUrl),
  //       response: response,
  //       error: 'Failed to refresh token: $e',
  //     );
  //   }
  // }

  Future<Map<String, dynamic>> basePut(
    String endpoint,
    Map<String, dynamic> requestBody, {
    Map<String, String>? headers,
  }) async {
    final fullUrl = '${Config.baseUrl(null)}$endpoint';

    try {
      final defaultHeaders = {'Content-Type': 'application/json'};
      final mergedHeaders = headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;

      final response = await _dioClient.put<String>(
        fullUrl,
        data: jsonEncode(requestBody),
        options: Options(headers: mergedHeaders),
      );

      var data = jsonDecode(response.data!);

      if (data is String) {
        data = jsonDecode(data);
      }

      return data as Map<String, dynamic>;
    } on DioException catch (e, stack) {
      final r = e.response;

      if (r != null) {
        Log().e('Error Response from API: ${r.statusCode}', r.data, stack);

        final responseData = r.data;
        final errorDetails = responseData is Map<String, dynamic>
            ? responseData['detail'] ?? 'Unknown error'
            : 'Unexpected response format';
        switch (r.statusCode) {
          case 401:
            Log().e('Unauthorized: $errorDetails', responseData, stack);
            throw Exception('Unauthorized: $errorDetails');
          case 500:
            Log().e('Server error: ${responseData ?? 'No response body'}', responseData, stack);
            throw Exception('Server error: Please try again later.');
          default:
            Log().e('Unhandled error: ${r.statusCode}', responseData, stack);
            throw Exception('Error: ${r.statusCode} - $responseData');
        }
      } else {
        Log().e('Network error: ${e.message}', null, stack);
        throw Exception('Network error: ${e.message}');
      }
    } on Exception catch (e) {
      Log().e('Unexpected error occurred', e.toString());
      throw Exception('Unexpected error: $e');
    }
  }
}
