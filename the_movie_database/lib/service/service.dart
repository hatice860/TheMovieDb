import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';
import 'package:the_movie_database/controller/controller.dart';
import 'package:the_movie_database/model/model.dart';

typedef _FromJson = Function(Map<String, dynamic> type)?;

class ApiService<T> {
  static  String baseUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=7b076625c94975dce5956e9a61f3e033&page=";
  int perPage = 10;

  

  Future<T?> getMethod(
      {    required int pageKey,
        _FromJson fromJson,
      bool isLoad = false}) async {
    if (isLoad) {
      //loading();
    }
    Response? response;
    final dio = Dio();
    try {
      response = await dio.get(
        baseUrl + pageKey.toString()
      );
      if (response.statusCode == HttpStatus.ok) {
        return fromJson == null ? response.data : fromJson(response.data);
      } else {
        return null;
      }
    } catch (error) {
      if (isLoad) {
        Grock.back();
      }
    }
    return null;
  }
}
