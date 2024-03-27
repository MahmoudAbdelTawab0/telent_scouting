import 'package:dio/dio.dart';
import 'package:screens/models/product_detail_model.dart';
import 'package:screens/models/product_model.dart';

class Product_Repo {
 // int  _product = 0;
  Future<ProductModel> getProduct() async {
    final path = 'https://student.valuxapps.com/api/home';
    final response = await Dio().get(path);

    final productModel = ProductModel.fromJson(response.data);
    return productModel;
  }

  Future<ProductDetail> getProductDetail(int id) async {
    final path = 'https://student.valuxapps.com/api/products/$id';
    final response = await Dio().get(path);

    final productModel = ProductDetail.fromJson(response.data);
    return productModel;
  }

}
