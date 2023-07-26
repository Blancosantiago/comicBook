
import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_input.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';

abstract class GetIssuesUseCase {
  Future<GetIssuesOutput?> execute(GetIssuesInput? input);
}
