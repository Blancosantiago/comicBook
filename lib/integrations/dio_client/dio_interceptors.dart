import 'package:comicslibrary/infrastructure/environments.dart';
import 'package:dio/dio.dart';

class DioInterceptorConfig extends Interceptor {
  var dio = Dio();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.path ="${options.path}api_key=${Environments.apiComic}format=json" ;
    super.onRequest(options, handler);
  }
}
