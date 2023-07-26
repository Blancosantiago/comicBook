import 'package:comicslibrary/core/commons/mg_view_image_network.dart';
import 'package:comicslibrary/features/detail_comic_module/components/presentation/widget/grid_detail_components.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_output.dart';
import 'package:flutter/material.dart';

class BodyDetailComic extends StatelessWidget {
  final ResultsDetail? _resultDetail;
  const BodyDetailComic({
    Key? key,
    ResultsDetail? resultDetail,
  })  : _resultDetail = resultDetail,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                MgGridDetailComponents(
                    title: "Characters",
                    volumeDetail: _resultDetail?.characterCredits),
                MgGridDetailComponents(
                    title: "Teams",
                    volumeDetail: _resultDetail?.teamCredits),
                MgGridDetailComponents(
                    title: "Locations",
                    volumeDetail: _resultDetail?.locationCredits),
              ],
            ),
          ),
          MgViewImageNetwork(
              element: _resultDetail?.image?.originalUrl,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.45)
        ],
      ),
    );
  }
}
