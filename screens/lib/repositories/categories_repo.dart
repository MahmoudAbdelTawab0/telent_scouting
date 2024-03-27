import 'package:dio/dio.dart';
import 'package:screens/models/categories_model.dart';
import 'package:screens/models/category_items_model.dart';

class Categories_Repo {
  Future<CategoriesModel> getCategories() async{
    final path = 'https://student.valuxapps.com/api/categories';
    final response = await Dio().get(path);

    final categoryData = CategoriesModel.fromJson(response.data);
    return categoryData;
  }
  Future<CategoryItems> getCategoryItems(int id) async{
    final path = 'https://student.valuxapps.com/api/products?category_id=$id';
    final response = await Dio().get(path);

    final categoryItems = CategoryItems.fromJson(response.data);
    return categoryItems;
  }
}