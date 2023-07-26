import 'package:comicslibrary/features/home_module/components/cubit/home_cubit.dart';
import 'package:comicslibrary/features/home_module/components/presentation/home_components.dart';
import 'package:comicslibrary/infrastructure/ioc_m.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildHomeComponent(
        context,
      ),
    );
  }

  HomeComponents _buildHomeComponent(BuildContext context) {
    return HomeComponents(
        homeCubit: IocManager.getInstance().resolve<HomeCubit>());
  }
}
