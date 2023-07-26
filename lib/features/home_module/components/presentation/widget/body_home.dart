import 'package:comicslibrary/features/home_module/components/cubit/home_cubit.dart';
import 'package:comicslibrary/features/home_module/components/cubit/home_state.dart';
import 'package:comicslibrary/features/home_module/components/presentation/widget/grid_comic.dart';
import 'package:comicslibrary/features/home_module/components/presentation/widget/list_comic.dart';
import 'package:comicslibrary/features/home_module/components/presentation/widget/row_button_and_title.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyHome extends StatelessWidget {
  final HomeCubit _homeCubit;
  final GetIssuesOutput? _resultList;
  const BodyHome(
      {Key? key, required HomeCubit homeCubit, GetIssuesOutput? resultList})
      : _resultList = resultList,
        _homeCubit = homeCubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool listOn = false;
    return BlocProvider(
      create: (context) => _homeCubit,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is ListOnState) {
            listOn = state.isList!;
          }
        },
        bloc: _homeCubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RowSelect(
                  homeCubit: _homeCubit,
                  listOn: listOn,
                ),
                listOn
                    ? ListHomeComic(
                        homeCubit: _homeCubit,
                        resultList: _resultList ?? GetIssuesOutput())
                    : GridHomeComic(
                        homeCubit: _homeCubit,
                        resultList: _resultList ?? GetIssuesOutput()),
              ],
            ),
          );
        },
      ),
    );
  }
}
