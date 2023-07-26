import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/imput_output/search_use_output.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeIntroInitial extends HomeState {}

class HomeIntroLoading extends HomeState {}

class HomeIntroError extends HomeState {}

class HomeIntroErrorNetwork extends HomeState {}

class ListOnState extends HomeState {
  final bool? isList;
  ListOnState(this.isList);

  @override
  List<Object?> get props => [isList];
}

class SearchResultState extends HomeState {
  final PublishersSearchOutput? list;
  SearchResultState(this.list);

  @override
  List<Object?> get props => [list];
}

class ListComicResult extends HomeState {
  final GetIssuesOutput? listComic;

  ListComicResult(this.listComic);

  @override
  List<Object> get props => [listComic!];
}

class ListPublishersResult extends HomeState {
  final List<Result>? listPublishers;

  ListPublishersResult(this.listPublishers);

  @override
  List<Object?> get props => [listPublishers];
}
