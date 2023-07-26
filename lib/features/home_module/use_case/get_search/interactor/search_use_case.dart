import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/imput_output/search_use_output.dart';

abstract class SearchUseCase {
  Future<PublishersSearchOutput?> execute(String? input);
  Future<GetIssuesOutput?> executeSearch(
      String?
          input); //To save time we use a getissuesoutput from another use case, only to save time in another use case we would have to create one.
}
