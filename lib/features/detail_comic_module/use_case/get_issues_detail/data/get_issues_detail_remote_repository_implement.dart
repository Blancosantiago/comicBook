import 'package:comicslibrary/abstractions/http_client.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_input.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_output.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/repositories/get_issues_detail_remote_repository.dart';

class GetIssuesDetailRemoteRepositoryImplement
    implements GetIssuesDetailRemoteRepository {
  final String _baseUrl; 
  final HttpClient _httpClient;

  GetIssuesDetailRemoteRepositoryImplement({
    required String baseUrl,
    required HttpClient httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient;

  @override
  Future<GetIssuesDetailOutput?> getIssuesDetail(
      GetIssuesDetailInput? input) async {
    var url = "${input?.apiUrlSelect ?? ""}?";

    var response = await _httpClient.get(
      url,
    );

    if (response.isOk()) {
      return GetIssuesDetailOutput.fromMap(response.data);
    } else {
      return null;
    }
  }
}
