import 'package:cart_cubit/Bloc/cart_cubit.dart';
import 'package:cart_cubit/screen/ProductItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return badges.Badge(
                badgeContent: Text(
                    context.read<CartCubit>().listOfItem.length.toString(),
                style: TextStyle(color: Colors.white),
                ),
                showBadge: true,
                position: badges.BadgePosition.topEnd(top: -5, end: 4),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_cart)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: context.read<CartCubit>().productList.length,
          itemBuilder: (context, index) {
            final ProductItem = context.read<CartCubit>().productList[index];
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
                onPressed: () {
                  context.read<CartCubit>().addToCart(ProductItem);
                },
                child: Text("Add"),
              ),
            );
          }),
    );
  }
}
