import 'package:comicslibrary/abstractions/http_client.dart';
import 'package:comicslibrary/abstractions/injector.dart';
import 'package:comicslibrary/application/application.dart';
import 'package:comicslibrary/features/detail_comic_module/detail_comic_module.dart';
import 'package:comicslibrary/features/home_module/home_module.dart';
import 'package:comicslibrary/integrations/data_connection_checker.dart';
import 'package:comicslibrary/integrations/dio_client/dio_http_client.dart';
import 'package:comicslibrary/integrations/get_it.dart';

abstract class IocManager {
  static Injector? _injector;

  static void register() {
    _injector = Injector.register(GetItInjector());
    registerCommonDependencies(_injector!);
    Application.registerDependencies(_injector!);
    DetailComicModule.registerDependencies(_injector!);
    HomeModule.registerDependencies(_injector!);
  }

  static Injector getInstance() => _injector!;
  static void registerCommonDependencies(Injector injector) {
    injector.registerFactory<HttpClient>(() => DioHttpClient());
    injector.registerFactory<NetworkInfo>(() => NetworkInfoImpl());
  }
}
