import 'package:comicslibrary/application/application_themes.dart';
import 'package:flutter/material.dart';

class MgError extends StatelessWidget {
  final String _title;
  final Icon _icon;

  const MgError({
    required String title,
    required Icon icon,
    Key? key,
  })  : _title = title,
        _icon = icon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _title,
            style: ApplicationThemes.quickSandBold.copyWith(fontSize: 23),
          ),
          const SizedBox(
            height: 5,
          ),
          _icon
        ],
      ),
    );
  }
}
