import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/new_cubit/news_cubit.dart';
import 'package:news_api/news_model/NewsModel.dart';
import 'package:news_api/repository/NewsRepository.dart';
import 'package:news_api/screens/ArtcleScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future newsbissinse;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsbissinse = NewsRepository().getTopBusinessNews();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        newsbissinse = NewsRepository().getTopBusinessNews();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: BlocBuilder<NewsCubit,NewsState>(
          builder: (context,state){

            if(state is NewsLoding){
              return const Center(
                  child: CircularProgressIndicator(),
                 );
            }
            if (state is NewsSuccess){
              final newsmodel = state.news;


              return ListView.builder(
                  itemCount: newsmodel.articles.lenght,

                   itemBuilder: (context, index) {
                     final item = newsmodel.articles[index];

                     return ListTile(

                     onTap: () {
                         Navigator.of(context).push(
                           MaterialPageRoute(
                             builder: (context) {
                               return ArticleScreen(
                                 article: item,
                               );
                             },
                           ),
                         );
                       },
                       leading: Image.network(
                         item.urlToImage ??
                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs9D-X5cHZJLrdiE5LrViNnma1zuO_ZAeEmPqdH9wkuw&s",
                         height: 60,
                         width: 60,
                       ),
                       title: Text(
                         item.title ?? "mnhgftd",
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       ),
                       subtitle: Text(
                         item.description ?? "empty description",
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       ),
                       // trailing: Icon(Icons.abc),
                     );
                   },
                 );
            }
            return SizedBox();
          }
        )
      ),
    );
  }
}


//FutureBuilder(
//
//             future:newsbissinse ,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (snapshot.hasData) {
//                 final response = snapshot.data;
//                 final data = response!.data;
//                 print("\n\n\ndata.............................:\n$data\n\n\n");
//                 final newsmodel = TopBissinseNews.fromJson(data);
//                 return ListView.builder(
//                   itemCount: newsmodel.articles.length,
//                   itemBuilder: (context, index) {
//                     final item = newsmodel.articles[index];
//                     return ListTile(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return ArticleScreen(
//                                 article: item,
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       leading: Image.network(
//                         item.urlToImage ??
//                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs9D-X5cHZJLrdiE5LrViNnma1zuO_ZAeEmPqdH9wkuw&s",
//                         height: 60,
//                         width: 60,
//                       ),
//                       title: Text(
//                         item.title ?? "mnhgftd",
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       subtitle: Text(
//                         item.description ?? "empty description",
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       // trailing: Icon(Icons.abc),
//                     );
//                   },
//                 );
//               }
//       if(snapshot.hasError){
//         print("\n\n\nerror${snapshot.error}\n\n");
//       }
//               return Center(
//                 child: Text("try again!!!"),
//               );
//             }),
