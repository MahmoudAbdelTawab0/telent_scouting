part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsLoding extends NewsState {}
class NewsSuccess extends NewsState {
  final Future<Response> news;
  NewsSuccess(this.news);
}
class NewsFailed extends NewsState {}