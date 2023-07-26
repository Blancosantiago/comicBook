import 'package:comicslibrary/abstractions/injector.dart';
import 'package:comicslibrary/application/application_themes.dart';
import 'package:comicslibrary/features/detail_comic_module/detail_comic_module.dart';
import 'package:comicslibrary/features/home_module/home_module.dart';
import 'package:comicslibrary/infrastructure/environments.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ApplicationThemes.appTheme(context),
      routes: _generateRoutes(),
      initialRoute: HomeModule.homeRoute,
    );
  }

  Map<String, WidgetBuilder> _generateRoutes() {
    return {
      ...HomeModule.generateRoutes(),
      ...DetailComicModule.generateRoutes(),
    };
  }

  static void registerDependencies(Injector injector) {
    injector.registerFactoryByName(
      () => Environments.baseUrl,
      "baseUrl",
    );

    injector.registerFactoryByName(
      () => Environments.apiComic,
      'apiKey',
    );
  }
}
