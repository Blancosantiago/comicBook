import 'package:bloc/bloc.dart';
import 'package:comicslibrary/features/detail_comic_module/components/cubit/detail_comic_state.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_input.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_output.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/interactor/get_issues_detail_use_case.dart';
import 'package:comicslibrary/integrations/data_connection_checker.dart';

class DetailComicCubit extends Cubit<DetailComicState> {
  final GetIssuesDetailUseCase _getIssuesUseCase;
  final NetworkInfo _networkInfo;
  DetailComicCubit(
      {required GetIssuesDetailUseCase getIssuesUseCase,
      required NetworkInfo networkInfo})
      : _getIssuesUseCase = getIssuesUseCase,
        _networkInfo = networkInfo,
        super(DetailComicIntroInitial());

  Future<void> getComicDetail(String apiUrlSelect) async {
    emit(DetailComicIntroLoading());
    GetIssuesDetailOutput? list = await _getIssuesUseCase
        .execute(GetIssuesDetailInput(apiUrlSelect: apiUrlSelect));
    if (list != null) {
      emit(DetailComicResult(list));
    } else {
      bool hasConnection = await _networkInfo.networkInfo.hasConnection;
      if (!hasConnection) {
      } else {
        emit(DetailComicIntroErrorNetwork());
      }
      emit(DetailComicIntroError());
    }
  }
}
