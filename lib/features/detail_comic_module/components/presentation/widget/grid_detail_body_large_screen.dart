import 'package:comicslibrary/application/application_themes.dart';
import 'package:comicslibrary/core/commons/mg_view_image_network.dart';
import 'package:comicslibrary/features/detail_comic_module/use_case/get_issues_detail/imput_output/get_issues_detail_use_output.dart';
import 'package:flutter/material.dart';

class GridDetailLargeScreen extends StatelessWidget {
  const GridDetailLargeScreen({
    Key? key,
    required VolumeDetail volumen,
  })  : _volumen = volumen,
        super(key: key);

  final VolumeDetail _volumen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MgViewImageNetwork(
            element:
                "https://comicvine.gamespot.com/a/uploads/scale_small/1/13291/297251-619-clawster.jpg", //I added this link because there was no link to the characters, I saw in documentation that it could be taken from somewhere else
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.height * 0.05),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          child: Text(
            _volumen.name ?? "(Not available!)",
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: ApplicationThemes.quickSandBold.copyWith(
              fontSize: 12,
              color: ApplicationThemes.appTheme(context).colorScheme.surface,
            ),
          ),
        ),
      ],
    );
  }
}
