import 'package:comicslibrary/application/application.dart';
import 'package:comicslibrary/infrastructure/environments.dart';
import 'package:comicslibrary/infrastructure/ioc_m.dart';
import 'package:flutter/material.dart';

void main() async {
  Environments.init(Flavor.dev);
  IocManager.register();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Application());
}
