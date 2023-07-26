import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_input.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/interactor/get_issues_use_case.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/repositories/get_issues_remote_repository.dart';

class GetIssuesUseCaseImpl implements GetIssuesUseCase {
  final GetIssuesRemoteRepository _remoteRepository;

  GetIssuesUseCaseImpl({
    required GetIssuesRemoteRepository remoteRepository,
  }) : _remoteRepository = remoteRepository;

  @override
  Future<GetIssuesOutput?> execute(GetIssuesInput? input) async {
    GetIssuesOutput? issues = await _remoteRepository.getIssues(input);
    return issues;
  }
}
