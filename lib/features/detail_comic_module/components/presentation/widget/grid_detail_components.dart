import 'package:comicslibrary/application/application_themes.dart';
import 'package:comicslibrary/features/detail_comic_module/components/presentation/widget/grid_detail_body_large_screen.dart';
import 'package:comicslibrary/features/detail_comic_module/components/presentation/widget/grid_detail_body_small_screen.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_output.dart';
import 'package:flutter/material.dart';

class MgGridDetailComponents extends StatelessWidget {
  final List<VolumeDetail>? _volumeDetail;
  final String? _title;
  const MgGridDetailComponents({
    Key? key,
    String? title,
    List<VolumeDetail>? volumeDetail,
  })  : _volumeDetail = volumeDetail,
        _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title ?? "",
            style:
                ApplicationThemes.quickSandBold.copyWith(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 10, right: 5),
            child: Divider(
              color: ApplicationThemes.appTheme(context).colorScheme.onPrimary,
              thickness: 1,
            ),
          ),
          Visibility(
            visible: _volumeDetail!.isNotEmpty,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / (3)),
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2),
              itemCount: _volumeDetail?.length ?? 0,
              semanticChildCount: _volumeDetail?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                VolumeDetail characterCredits =
                    _volumeDetail?[index] ?? VolumeDetail();
                if (MediaQuery.of(context).size.width > 800) {
                  return GridDetailLargeScreen(volumen: characterCredits);
                } else {
                  return GridDetailBodySmallScreen(volumen: characterCredits);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
