import 'package:flutter/material.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF233B55),
        title: Center(
          child: Text("Category",
          style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20,color: Colors.white),
          ),
        ),
        actions: [
          Icon(Icons.search_rounded,color: Colors.white,)
        ],
      ),
      body:


                   Container(
height:MediaQuery.of(context).size.height ,
                     width: MediaQuery.of(context).size.width,

                     child: GridView.builder(
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (context,Idex){
                          return Container(
                            height: 800,
                            width: MediaQuery.of(context).size.width,

                            margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: Color(0xFF336EA6)
                            ),

                              child: Container(
                                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                                             Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: 100,
                                                      child: Image.asset("asstes/images/تخاطب 1.png"),
                                                             ),
                                    Center(
                                      child: Text(
                                        "Speech",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                    ),

                                    Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                                  SizedBox(height: 10,)
                                  ]
                                  ,
                                ),
                              ),

                          );
                        },
                      ),


                              ),





    );
  }
}
