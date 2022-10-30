import 'package:dio/dio.dart';

/// created by YunusEmre
/// on 30-Oct-22

mixin DateOperationsMixin {
  final dateApiUrl = 'http://api.timezonedb.com/v2.1/get-time-zone';
  final dateApiUrlParameters = <String, dynamic>{
    'key': '1TNDEPNYWZX3',
    'format': 'json',
    'by': 'zone',
    'zone': 'Europe/Istanbul',
  };
  final Dio dio = Dio();

  Future<DateTime?> getPresentDate() async {
    try {
      final response = await _getDate();
      DateTime date = DateTime.parse(response['formatted']);
      return date;
    } catch (e) {
      rethrow;
    }
  }

  dynamic _getDate() async {
    try {
      final response = await dio.get(dateApiUrl, queryParameters: dateApiUrlParameters);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
