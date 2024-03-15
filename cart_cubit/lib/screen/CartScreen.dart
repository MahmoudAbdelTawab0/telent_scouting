import 'package:cart_cubit/Bloc/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
body: ListView.builder(
    itemCount: context.watch<CartCubit>().listOfItem.length,
    itemBuilder: (context, index) {
      final ProductItem = context.watch<CartCubit>().listOfItem[index];
      return ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ProductItem.color,
          ),
        ),
        title: Text(ProductItem.name),
        subtitle: Text("\$${ProductItem.price}"),
        trailing: TextButton(
          child:Icon(Icons.delete_outlined),
          onPressed: () {
            context.read<CartCubit>().removeFromCart(ProductItem);
          },

        ),
      );
    }
    ),
    );
  }
}
