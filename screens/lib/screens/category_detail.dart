import 'package:flutter/material.dart';
import 'package:screens/models/categories_model.dart';
import 'package:screens/models/category_items_model.dart';
import 'package:screens/repositories/categories_repo.dart';
import 'package:screens/screens/home_screen.dart';
import 'package:screens/screens/item_detail.dart';
import 'package:screens/some_widgets/card_rated.dart';
import 'package:screens/some_widgets/internet_error.dart';

class CategoryScreen extends StatefulWidget {
  final Datum data;
  const CategoryScreen({super.key, required this.data});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<CategoryItems> itemsModel;

  @override
  void initState() {
    super.initState();
    itemsModel = Categories_Repo().getCategoryItems(widget.data.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //  Header  //
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  // button back  //
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return const Home();
                        },
                      ), (route) => false);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xff9098B1),
                        size: 20,
                      ),
                    ),
                  ),

                  //  Category Name  //
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: Text(
                      widget.data.name,
                      style: const TextStyle(
                          color: Color(0xff223263),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),

            //  Line under Header  //
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffEBF0FF),
            ),

            // Items in the same Category //
            RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  itemsModel =
                      Categories_Repo().getCategoryItems(widget.data.id);
                });
              },
              child: FutureBuilder(
                  future: itemsModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final items = snapshot.data!.data.data;
                      return Container(
                        margin: const EdgeInsets.only(top: 16, left: 16),
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 1 / 1.5,
                          ),
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ItemDetail(itemData: items[index],),
                                    ));
                              },
                              child: card_Rated(
                                  image: items[index].image,
                                  name: items[index].name,
                                  price: items[index].price,
                                  discount: items[index].discount,
                                  rating: 4),
                            );
                          },
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return net_Error();
                  }),
            ),
            // FutureBuilder(
            //     future: Categories_Repo().getCategoryItems(widget.data.id),
            //     builder: (context, snapshot) {
            //       if(snapshot.hasData) {
            //         final items = snapshot.data!.data.data;
            //         return Container(
            //           margin: EdgeInsets.only(top: 16, left: 16),
            //           height: MediaQuery.of(context).size.height,
            //           child: GridView.builder(
            //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 2,
            //                 mainAxisSpacing: 15,
            //                 crossAxisSpacing: 15
            //             ),
            //             itemCount: items.length,
            //             itemBuilder: (context, index) {
            //               return card_Rated(image: items[index].image,
            //                   name: items[index].name,
            //                   price: items[index].price,
            //                   discount: items[index].discount,
            //                   rating: 3);
            //             },),
            //         );
            //       }
            //       if(snapshot.connectionState == ConnectionState.waiting){
            //         return CircularProgressIndicator();
            //       }
            //       return net_Error();
            //     }
            // ),
          ],
        ),
      ),
    );
  }
}
