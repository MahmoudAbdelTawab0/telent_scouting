import 'package:dio/dio.dart';

class CartRepository{
  final Dio _dio = Dio();
Future<Response> addItemToCart(int productId) async{
  final response = await _dio.post("https://student.valuxapps.com/api/carts",
  data:{
    "product_id": productId
  }
  );
  return response;
}

}
