import 'package:bloc/bloc.dart';
import 'package:dio/src/response.dart';
import 'package:meta/meta.dart';
import 'package:news_api_cubit/news_model/NewsModel.dart';
import 'package:news_api_cubit/repository/NewsRepository.dart';


part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
void getNews () async{
  try {
    emit(NewsLoding());
     final  TopBissinseNews news = await NewsRepository().getTopBusinessNews();

     emit(NewsSuccess( news ));
  }  catch (e) {
    emit(NewsFailed());
  }



}
}
