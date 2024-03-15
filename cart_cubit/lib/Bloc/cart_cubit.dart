import 'package:bloc/bloc.dart';
import 'package:cart_cubit/screen/ProductItem.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
   final List<ProductItem> productList = [
    ProductItem(id: 1, color: Color(0xFF4285F4), name: 'Product A', price: 19.99),
    ProductItem(id: 2, color: Color(0xFF34A853), name: 'Product B', price: 29.99),
    ProductItem(id: 3, color: Color(0xFFFBBC05), name: 'Product C', price: 14.99),
    ProductItem(id: 4, color: Color(0xFFEA4335), name: 'Product D', price: 24.99),
    ProductItem(id: 5, color: Color(0xFF4285F4), name: 'Product E', price: 39.99),
    ProductItem(id: 6, color: Color(0xFF34A853), name: 'Product F', price: 49.99),
    ProductItem(id: 7, color: Color(0xFFFBBC05), name: 'Product G', price: 9.99),
    ProductItem(id: 8, color: Color(0xFFEA4335), name: 'Product H', price: 34.99),
    ProductItem(id: 9, color: Color(0xFF4285F4), name: 'Product I', price: 22.99),
    ProductItem(id: 10, color: Color(0xFF34A853), name: 'Product J', price: 17.99),
    ProductItem(id: 11, color: Color(0xFFFBBC05), name: 'Product K', price: 27.99),
    ProductItem(id: 12, color: Color(0xFFEA4335), name: 'Product L', price: 19.99),
    ProductItem(id: 13, color: Color(0xFF4285F4), name: 'Product M', price: 31.99),
    ProductItem(id: 14, color: Color(0xFF34A853), name: 'Product N', price: 44.99),
    ProductItem(id: 15, color: Color(0xFFFBBC05), name: 'Product O', price: 15.99),
    ProductItem(id: 16, color: Color(0xFFEA4335), name: 'Product P', price: 28.99),
    ProductItem(id: 17, color: Color(0xFF4285F4), name: 'Product Q', price: 37.99),
    ProductItem(id: 18, color: Color(0xFF34A853), name: 'Product R', price: 23.99),
    ProductItem(id: 19, color: Color(0xFFFBBC05), name: 'Product S', price: 12.99),
    ProductItem(id: 20, color: Color(0xFFEA4335), name: 'Product T', price: 36.99),
  ];
   final List<ProductItem> listOfItem = [];
   void addToCart (ProductItem item){
     listOfItem.add(item);
if (listOfItem.contains(item)){
 emit(ProductIsAdded(name: item.name));
}
   }

}
