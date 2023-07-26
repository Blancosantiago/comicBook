import 'package:comicslibrary/application/application_themes.dart';
import 'package:comicslibrary/core/commons/mg_error.dart';
import 'package:comicslibrary/features/detail_comic_module/components/cubit/detail_comic_cubit.dart';
import 'package:comicslibrary/features/detail_comic_module/components/cubit/detail_comic_state.dart';
import 'package:comicslibrary/features/detail_comic_module/components/presentation/widget/body_detail_comic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailComicComponents extends StatelessWidget {
  final DetailComicCubit? _detailComicCubit;
  const DetailComicComponents({
    Key? key,
    required DetailComicCubit detailComicCubit,
  })  : _detailComicCubit = detailComicCubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ApplicationThemes.appTheme(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(
          "ComicBook",
          style: ApplicationThemes.quickSandBold.copyWith(fontSize: 25),
        ),
      ),
      body: BlocProvider(
        create: (context) => _detailComicCubit!,
        child: BlocBuilder<DetailComicCubit, DetailComicState>(
          bloc: _detailComicCubit!,
          buildWhen: (previous, current) =>
              current is DetailComicResult ||
              current is DetailComicIntroErrorNetwork ||
              current is DetailComicIntroError,
          builder: (context, state) {
            if (state is DetailComicResult) {
              return BodyDetailComic(
                resultDetail: state.resultDetail?.results,
              );
            } else if (state is DetailComicIntroErrorNetwork) {
              return const MgError(
                icon: Icon(Icons.signal_wifi_bad_sharp),
                title: "No internet connection",
              );
            } else if (state is DetailComicIntroError) {
              return const MgError(
                icon: Icon(Icons.error),
                title: "Error",
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
