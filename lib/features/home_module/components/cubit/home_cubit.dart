import 'package:bloc/bloc.dart';
import 'package:comicslibrary/features/detail_comic_module/detail_comic_module.dart';
import 'package:comicslibrary/features/home_module/components/cubit/home_state.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/interactor/get_issues_use_case.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/imput_output/search_use_output.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/interactor/search_use_case.dart';
import 'package:comicslibrary/integrations/data_connection_checker.dart';
import 'package:flutter/material.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetIssuesUseCase _getIssuesUseCase;
  final SearchUseCase _searchUseCase;
  final NetworkInfo _networkInfo;
  HomeCubit(
      {required GetIssuesUseCase getIssuesUseCase,
      required SearchUseCase searchUseCase,
      required NetworkInfo networkInfo})
      : _getIssuesUseCase = getIssuesUseCase,
        _searchUseCase = searchUseCase,
        _networkInfo = networkInfo,
        super(HomeIntroInitial());

  Future<void> getListComic() async {
    emit(HomeIntroLoading());
    GetIssuesOutput? list = await _getIssuesUseCase.execute(null);
    if (list != null) {
      emit(ListComicResult(list));
    } else {
      bool hasConnection = await _networkInfo.networkInfo.hasConnection;
      if (!hasConnection) {
      } else {
        emit(HomeIntroErrorNetwork());
      }
      emit(HomeIntroError());
    }
  }

  Future<void> searchPublishers(String? name) async {
    if (name != null) {
      emit(HomeIntroLoading());
      GetIssuesOutput? list = await _searchUseCase.executeSearch(name);
      List<Result>? codes1 = list!.results??[];
      codes1.removeWhere((element) =>
          !element.name.toString().toLowerCase().contains(name.toLowerCase()));
      emit(ListPublishersResult(codes1));
    } else {
      emit(HomeIntroInitial());
    }
  }

  Future<void> getCharacters(String id) async {
    emit(HomeIntroLoading());
    PublishersSearchOutput? list = await _searchUseCase.execute(id);
    emit(SearchResultState(list));
  }

  selectComic(Result comic, BuildContext context) {
    Navigator.of(context).pushNamed(DetailComicModule.detailComicRoute,
        arguments: {"apiUrlSelect": comic.apiDetailUrl});
  }

  listActive({bool? active}) {
    emit(ListOnState(active));
  }
}
