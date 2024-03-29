import 'package:carousel_slider/carousel_slider.dart';
import 'package:elemal_project/cubits/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategoriesCubit>().getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                Text(
            "Markaz ElAmal",
            style: TextStyle(fontSize: 15),
          ),
                  Container(
                    child: Row(
                      children: [
                      Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color(0xFF336EA6),
              ),
              height: 40,
              width: 40,
              child: Icon(
                Icons.notifications_none_sharp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color(0xFF336EA6),
              ),
              height: 40,
              width: 40,
              child: Icon(
                Icons.mark_chat_unread_outlined,
                color: Colors.white,
              ),
            ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 16, 16, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 60,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Color(0xFF233B55),
                        ),
                        hintText: "Search",
                        hintStyle:
                            TextStyle(fontSize: 20, color: Color(0xFF233B55)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFF336EA6),
                    ),
                    height: 60,
                    width: 60,
                    child: Icon(
                      Icons.tune_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 1),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Image.asset("asstes/images/Mask group.png"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "category",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF233B55),
                        fontWeight: FontWeight.w600),
                  ),
                  Text("See All",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF233B55),
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
              BlocBuilder <CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLodeing){

                    return SizedBox(
                      height: 85,
                      width: MediaQuery.of(context).size.width,

                    );
                  }
                  if (state is CategoriesSuccessed ){
                    final cate = state.data.category;
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 85,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cate.length,
                        itemBuilder: (BuildContext context, int itemIndex) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(16, 16, 16, 1),
                              width: 135,
                              height: 78,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  color: Color(0xFF336EA6)),
                              child:
                              Center(
                                child: Text(
                                  cate[itemIndex].name as String,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  if (state is CategoriesFiled){
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 85,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int itemIndex) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(16, 16, 16, 1),
                              width: 135,
                              height: 78,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  color: Color(0xFF336EA6)),
                              child:
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade400,
                                child: Container(
                                 // margin: const EdgeInsets.symmetric(
                                      //horizontal: 30),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container(
child: Text("mahmoud"),
                  );
                },
              ),

            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctors",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF233B55),
                        fontWeight: FontWeight.w600),
                  ),
                  Text("See All",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF233B55),
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
            Container(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    height: 300,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy:
                    CenterPageEnlargeStrategy.zoom,
                    autoPlayCurve: Curves.ease),
                itemCount: 6,
                itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 1),
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFF233B55),
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child:Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              height: 122,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                color: Colors.white,
                              ),
                              child: Center(child: Image.asset("asstes/images/sara 1.png")),

                          ),

                          Text("Dr: Sara Selem",
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),
                          ),
                        Text("12 experience",
                          style: TextStyle(color: Color(0xFF9ECAE3),fontSize: 16,fontWeight: FontWeight.w600),),
                          Text("20.99",
                            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                          Text("see more ...",
                            style: TextStyle(color: Color(0xFF9ECAE3),fontSize: 16,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    )

                  );
                },
              )
              ),

          ],
        ));
  }
}
