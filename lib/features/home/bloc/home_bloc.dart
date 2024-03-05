import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/bloc/home_event.dart';
import 'package:news_app/features/home/bloc/home_state.dart';
import 'package:news_app/features/home/data/home_repository.dart';
import 'package:news_app/features/home/models/news_model.dart';

class HomeBloc extends Bloc<NewsEvent, NewsState> {
  HomeRespository newsRepository;
  HomeBloc({required this.newsRepository}) : super(HomeInitialState()) {
    on<NewsEvent>((event, emit) async {
      if (event is FetchNewsEvent) {
        emit(HomeLoadingState());
        try {
          final List<List<NewsModel>> newsByCategories =
              await newsRepository.fetchAllNews();
          emit(NewsSuccessState(
              topHeadlines: newsByCategories[0],
              bbcNews: newsByCategories[1],
              bitCoin: newsByCategories[2],
              techCrunch: newsByCategories[3]));
        } catch (e) {
          emit(NewsErrorState(error: e.toString()));
        }
      }
    });
  }
}
