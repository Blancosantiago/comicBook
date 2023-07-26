import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/imput_output/search_use_output.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/interactor/search_use_case.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/repositories/search_remote_repository.dart';

class SearchUseCaseImpl implements SearchUseCase {
  final SearchRemoteRepository _remoteRepository;

  SearchUseCaseImpl({
    required SearchRemoteRepository remoteRepository,
  }) : _remoteRepository = remoteRepository;

  @override
  Future<PublishersSearchOutput?> execute(String? input) async {
    PublishersSearchOutput? issues = await _remoteRepository.search(input);
    return issues;
  }

  @override
  Future<GetIssuesOutput?> executeSearch(String? input) async {
    GetIssuesOutput? issues = await _remoteRepository.searchList(input);
    return issues;
  }
}
