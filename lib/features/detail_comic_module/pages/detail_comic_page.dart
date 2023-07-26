import 'package:comicslibrary/features/detail_comic_module/components/cubit/detail_comic_cubit.dart';
import 'package:comicslibrary/features/detail_comic_module/components/presentation/detail_comic_components.dart';
import 'package:comicslibrary/infrastructure/ioc_m.dart';
import 'package:flutter/material.dart';

class DetailComicPage extends StatelessWidget {
  const DetailComicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      body: _buildHomeComponent(context, arguments),
    );
  }

  DetailComicComponents _buildHomeComponent(BuildContext context, arguments) {
    return DetailComicComponents(
        detailComicCubit: IocManager.getInstance().resolve<DetailComicCubit>()
          ..getComicDetail(arguments["apiUrlSelect"]));
  }
}
