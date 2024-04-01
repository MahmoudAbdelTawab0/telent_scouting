import 'package:flutter/material.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> names =[
      "Speech",
      "Autism",
      "Learing difficulties",
      "Intelligence tast",
      "Behavior modiffication",
      "Skills development",

    ];

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
      body: SingleChildScrollView(
                     scrollDirection: Axis.vertical,
                     child: Column(
                       children: [
                         SizedBox(height: 10,),
                         Container(
                         height:MediaQuery.of(context).size.height ,
                           width: MediaQuery.of(context).size.width,
                     
                           child: GridView.builder(
                              itemCount: names.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              itemBuilder: (context,Idex){
                                return Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                     
                                  margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    color: Color(0xFF336EA6)
                                  ),
                     
                                    child: Container(
                                      margin: EdgeInsets.all(12),
                         alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                                                   Container(
                                                            width: MediaQuery.of(context).size.width,
                                                            height: 100,
                                                            child: Image.asset("asstes/images/تخاطب 1.png"),
                                                                   ),
                                         Row(
                                           crossAxisAlignment: CrossAxisAlignment.end,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             SizedBox(
                                               width: 115,
                                               child: Center(
                                                 child: Text(
                                                   names[Idex],
                                                   style: TextStyle(
                                                       fontWeight: FontWeight.w500,
                                                       color: Colors.white,
                                                       fontSize: 18),
                                                   maxLines: 2,
                                                 ),
                                               ),
                                             ),
                     
                                             Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                                             SizedBox(height: 10,)
                     
                                           ],
                                         ),
                                          SizedBox(height: 10,)
                                        ]
                                        ,
                                      ),
                                    ),
                     
                                );
                              },
                            ),
                     
                     
                                    ),
                       ],
                     ),
                   ),





    );
  }
}
