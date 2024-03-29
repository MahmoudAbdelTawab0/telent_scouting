import 'package:dio/dio.dart';
import 'package:elemal_project/models/categories.dart';


class Categories_Repo {
  // int  _product = 0;
  Future<Categories> getData() async {
    final path = 'https://markaz-el-amal.onrender.com/category/doctor?ln=ar';
    final response = await Dio().get(path);

    final dataModel = Categories.fromJson(response.data);
    return dataModel;
  }
}
//   Future<ProductDetail> getProductDetail(int id) async {
//     final path = 'https://student.valuxapps.com/api/products/$id';
//     final response = await Dio().get(path);
//
//     final productModel = ProductDetail.fromJson(response.data);
//     return productModel;
//   }
//
// }