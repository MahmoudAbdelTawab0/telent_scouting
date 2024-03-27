import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screens/cubit/items_data/item_cubit.dart';
import 'package:screens/models/categories_model.dart';
import 'package:screens/models/product_model.dart';
import 'package:screens/repositories/categories_repo.dart';
import 'package:screens/repositories/product_repo.dart';
import 'package:screens/screens/category_detail.dart';
import 'package:screens/screens/item_detail.dart';
import 'package:screens/some_widgets/card.dart';
import 'package:screens/some_widgets/circle_avatar.dart';
import 'package:screens/some_widgets/internet_error.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageID = 1;
  late Future<ProductModel> productModel;
  late Future<CategoriesModel> categoryModel;

  @override
  void initState() {
    super.initState();
    context.read<ItemCubit>().getData();
    productModel = Product_Repo().getProduct();
    categoryModel = Categories_Repo().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          context.read<ItemCubit>().getData();
          productModel = Product_Repo().getProduct();
          categoryModel = Categories_Repo().getCategories();
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // [search bar, favorite icon, notifications icon]
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          size: 30,
                        ),
                        hintText: "Search Product",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border_rounded,
                    size: 30,
                  ),
                  const Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  ),
                ],
              ),
              //  Data  //
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.80,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      //banners//
                      BlocBuilder<ItemCubit, ItemState>(
                        builder: (context, state) {
                          if (state is ItemLoading) {
                            return SizedBox(
                              width: 300.0,
                              height: 150.0,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade400,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }
                          if (state is ItemSuccessed) {
                            final banners = state.data.data.banners;
                            return CarouselSlider.builder(
                              options: CarouselOptions(
                                  height: 206,
                                  enableInfiniteScroll: true,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.zoom,
                                  autoPlayCurve: Curves.ease),
                              itemCount: banners.length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    banners[itemIndex].image,
                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Shimmer.fromColors(
                                          baseColor: Colors.grey.shade700,
                                          highlightColor: Colors.grey.shade400,
                                          child: Container(
                                            height: 200,
                                            color: Colors.grey,
                                          ));
                                    },
                                  ),
                                );
                              },
                            );
                          }
                          if (state is ItemLoading) {
                            return Text(
                              "CHECK YOUR NETWORK.....AND TRY AGAIN !!!!!",
                              style: TextStyle(fontSize: 30),
                            );
                          }
                          return Container();
                        },
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      // Category     see more button//
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Category',
                              style: TextStyle(
                                color: Color(0xFF223263),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'More Category',
                                style: TextStyle(
                                  color: Color(0xFF40BFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      //  Category items  //
                    FutureBuilder(
                        future: categoryModel,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: SizedBox(
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 6,
                                  itemBuilder: (context, index) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey.shade900,
                                    highlightColor: Colors.grey.shade400,
                                    child: const Row(
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 30),
                                        SizedBox(
                                          width: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }

                          if (snapshot.hasData) {
                            final data = snapshot.data!.data.data;
                            return Container(
                              height: 105,
                              margin:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return CategoryScreen(
                                              data: data[index]);
                                        },
                                      ));
                                    },
                                    child: circleAvatar(
                                        imageNet: data[index].image,
                                        name: data[index].name),
                                  );
                                },
                              ),
                            );
                          } else {
                            return net_Error();
                          }
                        },
                      ),

                    const SizedBox(
                        height: 24,
                      ),

                      // Flash Sale ....... See More button//
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Flash Sale',
                              style: TextStyle(
                                color: Color(0xFF223263),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'See More',
                                style: TextStyle(
                                  color: Color(0xFF40BFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      // List of Flash Sale items //

                      BlocBuilder<ItemCubit, ItemState>(
                        builder: (context, state) {
                          if (state is ItemLoading) {
                            return SizedBox(
                              width: 300.0,
                              height: 100.0,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade400,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }
                          if (state is ItemSuccessed) {
                            final product = state.data.data.products;
                            return Container(
                              height: 211,
                              margin: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: product.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return ItemDetail(
                                              itemData: product[index],
                                            );
                                          },
                                        ));
                                      },
                                      child: card(
                                          image: product[index].image,
                                          name: product[index].name,
                                          price: product[index].price,
                                          discount: product[index].discount),
                                    );
                                  }),
                            );
                          }
                          if (state is ItemFailed) {
                            return Text("HAS ARORR !!!!!!!");
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),

                      // Mega Sale ....... See More//
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Mega Sale',
                              style: TextStyle(
                                color: Color(0xFF223263),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'See More',
                                style: TextStyle(
                                  color: Color(0xFF40BFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      //  List of Mega Sale items  //
                      BlocBuilder<ItemCubit, ItemState>(
                        builder: (context, state) {
                          if (state is ItemLoading) {
                            return SizedBox(
                              width: 300.0,
                              height: 100.0,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade400,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }
                          if (state is ItemSuccessed) {
                            final product = state.data.data.products;
                            return Container(
                              height: 211,
                              margin: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: product.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return ItemDetail(
                                              itemData: product[index],
                                            );
                                          },
                                        ));
                                      },
                                      child: card(
                                          image: product[index].image,
                                          name: product[index].name,
                                          price: product[index].price,
                                          discount: product[index].discount),
                                    );
                                  }),
                            );
                          }
                          if (state is ItemFailed) {
                            return Text("HAS ARORR !!!!!!!");
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(
                        height: 9,
                      ),

                      // Image Recommended Product //
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(children: [
                          Image.asset(
                            'assets/images/Recomended_Product.png',
                            height: 206,
                            width: MediaQuery.of(context).size.width,
                          ),
                          const Positioned(
                            top: 48,
                            left: 24,
                            child: Text(
                              'Recomended\nProduct',
                              textWidthBasis: TextWidthBasis.parent,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 136,
                            left: 24,
                            child: Text(
                              'We recommend the best for you',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      //GridView//
                      BlocBuilder<ItemCubit, ItemState>(
                        builder: (context, state) {
                          if(state is ItemLoading){
                            return SizedBox(
                              width: 300.0,
                              height: 100.0,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade400,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }
                          if (state is ItemSuccessed){
                            final product = state.data!.data.products;
                            return Container(
                              height: 400,
                              width: 200,
                              margin: const EdgeInsets.all(10,),
                              child: GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                itemCount: product.length,
                                itemBuilder: (context,index){
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ItemDetail(
                                                itemData: product[index],
                                              );
                                            },
                                          ));
                                    },
                                    child: card(
                                        image: product[index].image,
                                        name: product[index].name,
                                        price: product[index].price,
                                        discount: product[index].discount),
                                  );
                                },
                              ),
                            );


                          }
                          if (state is ItemFailed) {
                            return Text("HAS ARORR !!!!!!!");
                          }
                          return Container();
                        },
                      ),

                      const SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
