import 'package:comicslibrary/application/application_themes.dart';
import 'package:comicslibrary/features/home_module/components/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class RowSelect extends StatelessWidget {
  final HomeCubit _homeCubit;
  final bool _listOn;
  const RowSelect({
    Key? key,
    required HomeCubit homeCubit,
    required bool listOn,
  })  : _homeCubit = homeCubit,
        _listOn = listOn,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Latest Issues",
          textAlign: TextAlign.start,
          style: ApplicationThemes.quickSandBold
              .copyWith(fontSize: 12, color: Colors.black),
        ),
        Row(
          children: [
            ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) =>
                      ApplicationThemes.appTheme(context).colorScheme.secondary,
                ),
              ),
              onPressed: () {
                _homeCubit.listActive(active: true);
              },
              icon: Icon(
                Icons.list,
                color: !_listOn
                    ? null
                    : ApplicationThemes.appTheme(context).colorScheme.surface,
              ),
              label: Text(
                "List",
                style: ApplicationThemes.quickSandRegular.copyWith(
                  color: !_listOn
                      ? null
                      : ApplicationThemes.appTheme(context).colorScheme.surface,
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) =>
                      ApplicationThemes.appTheme(context).colorScheme.secondary,
                ),
              ),
              onPressed: () {
                _homeCubit.listActive(active: false);
              },
              icon: Icon(
                Icons.grid_on_rounded,
                color: _listOn
                    ? null
                    : ApplicationThemes.appTheme(context).colorScheme.surface,
                size: 16,
              ),
              label: Text(
                "Grid",
                style: ApplicationThemes.quickSandRegular.copyWith(
                  color: _listOn
                      ? null
                      : ApplicationThemes.appTheme(context).colorScheme.surface,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
