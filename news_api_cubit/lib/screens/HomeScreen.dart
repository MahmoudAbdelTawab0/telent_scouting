import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cubit/new_cubit/news_cubit.dart';
import 'package:news_api_cubit/news_model/NewsModel.dart';
import 'package:news_api_cubit/repository/NewsRepository.dart';
import 'package:news_api_cubit/screens/ArtcleScreen.dart';

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
   context.read<NewsCubit>().getNews();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<NewsCubit>().getNews();
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
              final TopBissinseNews newsmodel = state.news;



              return ListView.builder(
                  itemCount: newsmodel.articles.length,

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

                       title: Text(
                         item.title ?? "Empty Title",
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       ),
                       subtitle: Text(
                         item.description ?? "empty description",
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       ),
                       trailing: Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(14),
                             image: DecorationImage(
                                 image: NetworkImage(
                                   item.urlToImage ??
                                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs9D-X5cHZJLrdiE5LrViNnma1zuO_ZAeEmPqdH9wkuw&s",

                                 )
                             )

                         ),
                       ),
                     );
                   },
                 );
            }
            if(state is NewsFailed){

              return Center(
                child: Text(
                  "CHEK YOUR NETWORK!!!!",
                  style: TextStyle(fontSize: 40,
                  color: Color(0xFF2D5BD0),
                  ),
                ),
              );
            }

            return SizedBox();
          }
        )
      ),
    );
  }
}



