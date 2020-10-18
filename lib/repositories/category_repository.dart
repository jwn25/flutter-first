import 'package:myapp/models/Category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<List<Category>> getCategories() async {
    var response =
        await http.get("https://liveasily.com/api/quote-categories/get-all");

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Category> categories = CategoryModel.fromJson(data).data;
      return categories;
    } else {
      throw Exception();
    }
  }
}
