import 'package:comicslibrary/application/application_themes.dart';
import 'package:comicslibrary/core/commons/mg_view_image_network.dart';
import 'package:comicslibrary/core/helper/aspect_ratio_grid.dart';
import 'package:comicslibrary/features/home_module/components/cubit/home_cubit.dart';
import 'package:comicslibrary/features/home_module/use_case/get_issues/imput_output/get_issues_use_output.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GridHomeComic extends StatelessWidget {
  final GetIssuesOutput _resultList;
  final HomeCubit _homeCubit;
  const GridHomeComic({
    Key? key,
    required GetIssuesOutput resultList,
    required HomeCubit homeCubit,
  })  : _resultList = resultList,
        _homeCubit = homeCubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        gridDelegate: aspectRatioGrid(context),
        itemCount: _resultList.results?.length ?? 0,
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Result element = _resultList.results?[index] ?? Result();
          return InkWell(
            onTap: () => _homeCubit.selectComic(element, context),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MgViewImageNetwork(
                        element: element.image?.superUrl ?? "",
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          textAlign: TextAlign.center,
                          element.name ?? "Not available!",
                          style: ApplicationThemes.quickSandMedium
                              .copyWith(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "${element.name ?? "(Not available!)"}  #${element.issueNumber ?? ""}",
                          textAlign: TextAlign.center,
                          style: ApplicationThemes.quickSandMedium
                              .copyWith(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          textAlign: TextAlign.center,
                          element.dateAdded == null
                              ? "Not available!"
                              : DateFormat(
                                  'MMMM d, yyyy',
                                ).format(element.dateAdded!),
                          style: ApplicationThemes.quickSandMedium
                              .copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
