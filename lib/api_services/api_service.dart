import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio dio = Dio();

  Future<dynamic> getResponse({required String url}) async {
    dynamic responseJson;

    Response response;
    try {
      response = await dio.get(url);
      responseJson = returnResponse(response: response);
      return responseJson;
    } on SocketException {
      throw Exception('No Internet Connection');
    }
  }

  // Future getPostResponse(String url, data) async {
  //   dynamic responseJson;
  //
  //   Response response;
  //
  //   try {
  //     response = await _dio.post(url, data: data);
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }
  //
  //   return responseJson;
  // }

  dynamic returnResponse({required Response response}) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw Exception(response.data.toString());
      case 401:
      case 403:
        throw Exception(response.data.toString());
      case 500:
      default:
        throw Exception(
            'Error occurred with status code : ${response.statusCode}');
    }
  }
}
