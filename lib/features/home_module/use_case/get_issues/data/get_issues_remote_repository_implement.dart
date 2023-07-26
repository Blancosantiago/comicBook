import 'package:comicslibrary/abstractions/http_client.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_input.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/repositories/get_issues_remote_repository.dart';

class GetIssuesRemoteRepositoryImplement implements GetIssuesRemoteRepository {
  final String _baseUrl;
  final HttpClient _httpClient;
  static const String _getIssuesEndpointUrl = '/issues/?';

  GetIssuesRemoteRepositoryImplement({
    required String baseUrl,
    required HttpClient httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient;

  @override
  Future<GetIssuesOutput?> getIssues(GetIssuesInput? input) async {
    var url = '$_baseUrl$_getIssuesEndpointUrl';

    var response = await _httpClient.get(
      url,
    );

    if (response.isOk()) {
      GetIssuesOutput? codes = GetIssuesOutput.fromMap(response.data);
      return codes;
    } else {
      return null;
    }
  }
}
