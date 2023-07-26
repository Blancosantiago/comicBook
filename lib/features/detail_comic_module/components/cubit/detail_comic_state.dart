import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_output.dart';
import 'package:equatable/equatable.dart';

abstract class DetailComicState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailComicIntroInitial extends DetailComicState {}

class DetailComicIntroLoading extends DetailComicState {}

class DetailComicIntroError extends DetailComicState {}

class DetailComicIntroErrorNetwork extends DetailComicState {}

class DetailComicResult extends DetailComicState {
  final GetIssuesDetailOutput? resultDetail;

  DetailComicResult(this.resultDetail);

  @override
  List<Object?> get props => [resultDetail];
}
