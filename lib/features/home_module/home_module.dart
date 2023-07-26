import 'package:comicslibrary/abstractions/http_client.dart';
import 'package:comicslibrary/abstractions/injector.dart';
import 'package:comicslibrary/features/home_module/components/cubit/home_cubit.dart';
import 'package:comicslibrary/features/home_module/pages/home_page.dart';
import 'package:comicslibrary/features/home_module/pages/search_page.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/data/get_issues_remote_repository_implement.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/interactor/get_issues_use_case.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/interactor/get_issues_use_case_implement.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/repositories/get_issues_remote_repository.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/data/search_remote_repository_implement.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/interactor/search_use_case.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/interactor/search_use_case_implement.dart';
import 'package:comicslibrary/features/home_module/use_case/get_search/repositories/search_remote_repository.dart';
import 'package:comicslibrary/integrations/data_connection_checker.dart';
import 'package:flutter/material.dart';

abstract class HomeModule {
  static const String homeRoute = '/home';
  static const String searchRoute = '/searchPage';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      homeRoute: (context) => const HomePage(),
      searchRoute: (context) => const SearchPage()
    };
  }

  static void registerDependencies(Injector injector) {
    _registerSearchFeature(injector);
    _registerGetIssuesFeature(injector);
  }

  static void _registerGetIssuesFeature(Injector injector) {
    injector.registerFactory<GetIssuesRemoteRepository>(
      () => GetIssuesRemoteRepositoryImplement(
        httpClient: injector.resolve<HttpClient>(),
        baseUrl: injector.resolveByName('baseUrl'),
      ),
    );
    injector.registerFactory<GetIssuesUseCaseImpl>(
      () => GetIssuesUseCaseImpl(
        remoteRepository: injector.resolve<GetIssuesRemoteRepository>(),
      ),
    );
    injector.registerFactory<GetIssuesUseCase>(
      () => GetIssuesUseCaseImpl(
        remoteRepository: injector.resolve<GetIssuesRemoteRepository>(),
      ),
    );

    injector.registerFactory<HomeCubit>(
      () => HomeCubit(
        searchUseCase: injector.resolve<SearchUseCase>(),
        networkInfo: injector.resolve<NetworkInfo>(),
        getIssuesUseCase: injector.resolve<GetIssuesUseCase>(),
      ),
    );
  }

  static void _registerSearchFeature(Injector injector) {
    injector.registerFactory<SearchRemoteRepository>(
      () => SearchRemoteRepositoryImplement(
        httpClient: injector.resolve<HttpClient>(),
        baseUrl: injector.resolveByName('baseUrl'),
      ),
    );
    injector.registerFactory<SearchUseCaseImpl>(
      () => SearchUseCaseImpl(
        remoteRepository: injector.resolve<SearchRemoteRepository>(),
      ),
    );
    injector.registerFactory<SearchUseCase>(
      () => SearchUseCaseImpl(
        remoteRepository: injector.resolve<SearchRemoteRepository>(),
      ),
    );
  }
}
