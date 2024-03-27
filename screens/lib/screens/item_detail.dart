import 'package:flutter/material.dart';
import 'package:screens/some_widgets/star_rate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemDetail extends StatefulWidget {
  final itemData;
  ItemDetail({super.key, required this.itemData});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  final _controller = PageController();

  final int rating = 4;
  int selectedSize = 0;
  int selectedColor = 0;

  final List<Color> itemColor = [
    Colors.black,
    Colors.deepPurple,
    Colors.red,
    Colors.grey,
    Colors.green,
    Colors.amber,
    Colors.brown,
    Colors.blueAccent,
  ];
  final List<double> itemSize = [6.0, 6.5, 7.0, 7.5, 8.0, 8.5];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Header  //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  // button back  //
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xff9098B1),
                        size: 20,
                      ),
                    ),
                  ),

                  //  Item Name  //
                  Container(
                    margin: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Text(
                      widget.itemData.name,
                      style: TextStyle(
                          color: Color(0xff223263),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  //  more button  //
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      child: Icon(
                        Icons.more_vert_rounded,
                        color: Color(0xff9098B1),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //  Line under Header  //
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffEBF0FF),
            ),

            //  Item Images //
            Container(
              width: MediaQuery.of(context).size.width,
              height: 266,
              child: Column(
                children: [
                  // images //
                  Container(
                    height: 238,
                    child: PageView.builder(
                      controller: _controller,
                      reverse: true,
                      itemCount: widget.itemData.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(widget.itemData.images[index]);
                      },
                    ),
                  ),

                  SizedBox(height: 8),

                  // Dots under Images //
                  Container(
                    height: 20,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: widget.itemData.images.length,
                      effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Color(0xff40BFFF),
                        dotColor: Color(0xffEBF0FF),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),

            // Item Detail  //
            Container(
              height: 170,
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  // Item name & Favorite icon //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      // Item name  //
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 100,
                        child: ListView(
                          children: [
                            Text(
                              widget.itemData.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff223263),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ),

                      //  Favorite icon //
                      Icon(
                        Icons.favorite,
                        size: 35,
                        color: widget.itemData.inFavorites
                            ? Colors.red
                            : Color(0xff9098B1),
                      ),
                    ],
                  ),

                  //  Rated star  //
                  Container(
                    height: 16,
                    //rating star//
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        //light star//
                        SizedBox(
                          width: rating * 20,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: rating,
                            itemBuilder: (BuildContext context, int index) {
                              return Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              );
                            },
                          ),
                        ),
                        //off star//
                        SizedBox(
                          width: (5 - rating) * 20,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5 - rating,
                            itemBuilder: (BuildContext context, int index) {
                              return Icon(
                                Icons.star,
                                color: Color(0xffEBF0FF),
                                size: 20,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Item Price  //
                  Text(
                    '\$${widget.itemData.price}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff40bfff),
                    ),
                  ),
                ],
              ),
            ),

            //  Selected Size  //
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Choose Items Size //
                  Text(
                    'الحجم',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff223263),
                    ),
                  ),
                  Container(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemSize.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() {
                                selectedSize = index;
                              }),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: selectedSize == index
                                    ? Color(0xff40bfff)
                                    : Colors.white,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    itemSize[index].toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        );
                      },
                    ),
                  ),

                  // Choose Items Color //
                  Text(
                    'اللون',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff223263),
                    ),
                  ),
                  Container(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemColor.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() {
                                selectedColor = index;
                              }),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: itemColor[index],
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: selectedColor == index
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Specification //
            Container(
              margin: EdgeInsets.only(left: 16, right: 25, top: 24, bottom: 24),
              height: 290,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'المواصفات',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff223263),
                    ),
                  ),
                  // Specification //
                  Container(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Text(
                          widget.itemData.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff9098b1),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //  Review Product       See More //
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  //  Review Product  //
                  Text(
                    'مراجعة المنتج',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff223263),
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  //  see more  //
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'رؤية المزيد',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff40bfff),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),

            // rated star //
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                textDirection: TextDirection.rtl,
                children: [
                  starRate(rating: rating, size: 25),
                  SizedBox(width: 8),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff9098B1),
                    ),
                  )
                ],
              ),
            ),

            // Customer Detail //
            Container(
              margin: EdgeInsets.all(16),
              child: ListTile(
                leading: CircleAvatar(
                  //backgroundImage: AssetImage('assets/Customer images/Profile Picture.png'),
                  radius: 50,
                  child: Icon(Icons.person),
                ),
                title: Text('محمود عبدالتواب شعبان',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff223263),
                  ),
                ),
                subtitle: starRate(rating: 4, size: 22),
              ),
            ),

            // review //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9098B1),
                ),
              ),
            ),
            Image.asset('assets/customer_images/Product Picture.png'),
            Container(
              margin: EdgeInsets.only(top: 21,bottom: 16,right: 16,left: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 55)
                ),
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
