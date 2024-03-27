import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         // backgroundColor: Colors.white,
          title: Text(
            "Markaz ElAmal",
            style: TextStyle(fontSize: 15),
          ),
          actions: [
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
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body:ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Container(
              margin: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Image.asset("asstes/images/Mask group.png"),
            ),
            Container(
              margin: EdgeInsets.all(16),
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 85,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, Idex) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(16),
                      width: 135,
                      height: 78,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xFF336EA6)),
                      child:
                      Center(
                        child: Text(
                          "Speech",
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
            ),
            Container(
              margin: EdgeInsets.all(16),
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
                    margin: const EdgeInsets.all(10),
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
