import 'package:comicslibrary/application/application_themes.dart';
import 'package:comicslibrary/core/commons/mg_error.dart';
import 'package:comicslibrary/features/home_module/components/cubit/home_cubit.dart';
import 'package:comicslibrary/features/home_module/components/cubit/home_state.dart';
import 'package:comicslibrary/features/home_module/components/presentation/widget/body_home.dart';
import 'package:comicslibrary/features/home_module/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeComponents extends StatelessWidget {
  final HomeCubit? _homeCubit;
  const HomeComponents({
    Key? key,
    required HomeCubit homeCubit,
  })  : _homeCubit = homeCubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ApplicationThemes.appTheme(context).colorScheme.secondary,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HomeModule.searchRoute);
              },
              icon: const Icon(Icons.search))
        ],
        title: Text(
          "ComicBook",
          style: ApplicationThemes.quickSandBold.copyWith(fontSize: 25),
        ),
      ),
      body: BlocProvider(
        create: (context) => _homeCubit!,
        child: BlocBuilder<HomeCubit, HomeState>(
          bloc: _homeCubit!..getListComic(),
          buildWhen: (previous, current) =>
              current is ListComicResult ||
              current is HomeIntroErrorNetwork ||
              current is HomeIntroError,
          builder: (context, state) {
            if (state is ListComicResult) {
              return BodyHome(
                homeCubit: _homeCubit!,
                resultList: state.listComic,
              );
            } else if (state is HomeIntroErrorNetwork) {
              return const MgError(
                icon: Icon(Icons.signal_wifi_bad_sharp),
                title: "No internet connection",
              );
            } else if (state is HomeIntroError) {
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
