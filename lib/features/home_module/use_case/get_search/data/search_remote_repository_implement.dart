import 'package:comicslibrary/abstractions/http_client.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/imput_output/search_use_output.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/repositories/search_remote_repository.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';

class SearchRemoteRepositoryImplement implements SearchRemoteRepository {
  final String _baseUrl;
  final HttpClient _httpClient;
  static const String _searchEndpointUrl = '/publishers/';
  static const String _searchpublishersEndpointUrl = '/publisher/';

  SearchRemoteRepositoryImplement({
    required String baseUrl,
    required HttpClient httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient;

  @override
  Future<PublishersSearchOutput?> search(String? id) async {
    var url = '$_baseUrl$_searchpublishersEndpointUrl$id/?';
    var response = await _httpClient.get(
      url,
    );

    if (response.isOk()) {
      PublishersSearchOutput? codes =
          PublishersSearchOutput.fromMap(response.data);
      return codes;
    } else {
      return null;
    }
  }

  @override
  Future<GetIssuesOutput?> searchList(String? input) async {
    String name = input ?? "";
    var url = '$_baseUrl$_searchEndpointUrl?filter=name:$name&';

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
