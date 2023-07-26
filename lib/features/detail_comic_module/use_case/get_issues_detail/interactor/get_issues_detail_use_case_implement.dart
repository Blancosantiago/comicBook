import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_input.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_output.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/interactor/get_issues_detail_use_case.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/repositories/get_issues_detail_remote_repository.dart';

class GetIssuesDetailUseCaseImpl implements GetIssuesDetailUseCase {
  final GetIssuesDetailRemoteRepository _remoteRepository;

  GetIssuesDetailUseCaseImpl({
    required GetIssuesDetailRemoteRepository remoteRepository,
  }) : _remoteRepository = remoteRepository;

  @override
  Future<GetIssuesDetailOutput?> execute(GetIssuesDetailInput? input) async {
    GetIssuesDetailOutput? welcome = await _remoteRepository.getIssuesDetail(input);
    return welcome;
  }
}
