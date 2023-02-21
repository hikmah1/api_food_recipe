import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doa_api/models/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//class koneksi api
//class RecipeApi digunakan
class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "20", "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "08cbda4204mshe606f84b2f445bfp1b221ejsn2d6aeecb85d2",
      "x-rapidapi-host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
