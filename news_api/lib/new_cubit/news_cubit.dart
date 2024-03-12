import 'package:bloc/bloc.dart';
import 'package:dio/src/response.dart';
import 'package:meta/meta.dart';
import 'package:news_api/repository/NewsRepository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
void getNews () async{
  try {
    emit(NewsLoding());
     final  news = NewsRepository().getTopBusinessNews();

     emit(NewsSuccess(news));
  } on Exception catch (e) {
    emit(NewsFailed());
  }



}
}
