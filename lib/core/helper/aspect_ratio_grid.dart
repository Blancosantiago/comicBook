import 'package:flutter/material.dart';

SliverGridDelegateWithFixedCrossAxisCount aspectRatioGrid(
    BuildContext context) {
  if (MediaQuery.of(context).size.width > 800) {
    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / (0.8)),
        mainAxisSpacing: 2,
        crossAxisSpacing: 2);
  } else {
    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / (1.4)),
        mainAxisSpacing: 2,
        crossAxisSpacing: 2);
  }
}
