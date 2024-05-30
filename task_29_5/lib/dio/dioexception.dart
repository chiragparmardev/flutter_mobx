import 'package:dio/dio.dart';

class DioExceptionUtil {
  static String handleError(DioException error) {
    String errorDescription = '';
    switch (error.type) {
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 429) {
          errorDescription = 'Too many requests. Please try again later';
        }
        else if (error.response?.statusCode == 400) {
          errorDescription = 'Invalid request';
        }
         else {
          errorDescription =
              'Received invalid status code: ${error.response?.statusCode}';
        }
        break;
      case DioExceptionType.connectionError:
        errorDescription = '404';
        break;
      default:
        errorDescription = 'Something went wrong';
        break;
    }
    return errorDescription;
  }
}
