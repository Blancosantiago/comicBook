import 'package:comicslibrary/abstractions/http_client.dart';
import 'package:comicslibrary/abstractions/injector.dart';
import 'package:comicslibrary/features/detail_comic_module/components/cubit/detail_comic_cubit.dart';
import 'package:comicslibrary/features/detail_comic_module/pages/detail_comic_page.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/data/get_issues_detail_remote_repository_implement.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/interactor/get_issues_detail_use_case.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/interactor/get_issues_detail_use_case_implement.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/repositories/get_issues_detail_remote_repository.dart';
import 'package:comicslibrary/integrations/data_connection_checker.dart';
import 'package:flutter/material.dart';

abstract class DetailComicModule {
  static const String detailComicRoute = '/detailComic';
  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      detailComicRoute: (context) => const DetailComicPage(),
    };
  }

  static void registerDependencies(Injector injector) {
    _registerGetIssuesDetailFeature(injector);
  }

  static void _registerGetIssuesDetailFeature(Injector injector) {
    injector.registerFactory<GetIssuesDetailRemoteRepository>(
      () => GetIssuesDetailRemoteRepositoryImplement(
        httpClient: injector.resolve<HttpClient>(),
        baseUrl: injector.resolveByName('baseUrl'),
      ),
    );
    injector.registerFactory<GetIssuesDetailUseCaseImpl>(
      () => GetIssuesDetailUseCaseImpl(
        remoteRepository: injector.resolve<GetIssuesDetailRemoteRepository>(),
      ),
    );
    injector.registerFactory<GetIssuesDetailUseCase>(
      () => GetIssuesDetailUseCaseImpl(
        remoteRepository: injector.resolve<GetIssuesDetailRemoteRepository>(),
      ),
    );

    injector.registerFactory<DetailComicCubit>(
      () => DetailComicCubit(
        networkInfo: injector.resolve<NetworkInfo>(),
        getIssuesUseCase: injector.resolve<GetIssuesDetailUseCase>(),
      ),
    );
  }
}
