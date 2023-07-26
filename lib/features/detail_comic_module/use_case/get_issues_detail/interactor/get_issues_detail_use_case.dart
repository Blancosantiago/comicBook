
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_input.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_output.dart';

abstract class GetIssuesDetailUseCase {
  Future<GetIssuesDetailOutput?> execute(GetIssuesDetailInput? input);
}
