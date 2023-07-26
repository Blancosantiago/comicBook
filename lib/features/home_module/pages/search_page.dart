import 'package:comicslibrary/application/application_themes.dart';
import 'package:comicslibrary/features/home_module/components/cubit/home_cubit.dart';
import 'package:comicslibrary/features/home_module/components/cubit/home_state.dart';
import 'package:comicslibrary/infrastructure/ioc_m.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Due to work related time constraints, I made the search module in HomeModule. This is just an example
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = IocManager.getInstance().resolve<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BarSearch(cubit: cubit),
            BlocProvider(
              create: (context) => cubit,
              child: BlocBuilder<HomeCubit, HomeState>(
                bloc: cubit,
                builder: (context, state) {
                  if (state is ListPublishersResult) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: state.listPublishers!.isEmpty
                          ? const Text("No results!")
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  state.listPublishers!.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ElevatedButton.icon(
                                      label: Text(
                                          state.listPublishers?[index].name ??
                                              ""),
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                          (states) =>
                                              ApplicationThemes.appTheme(
                                                      context)
                                                  .colorScheme
                                                  .secondary,
                                        ),
                                      ),
                                      onPressed: () {
                                        cubit.getCharacters(state
                                                .listPublishers?[index].id
                                                .toString() ??
                                            "");
                                      },
                                      icon: const Icon(
                                        Icons.manage_search_rounded,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                    );
                  } else if (state is SearchResultState) {
                    return SingleChildScrollView(
                      child: Builder(builder: (context) {
                        int numberElement =
                            state.list?.results?.storyArcs?.length ?? 0;
                        return numberElement == 0
                            ? const Text("No results!")
                            : Column(
                                children: [
                                  ...List.generate(
                                    numberElement > 30 ? 30 : numberElement, //the limit is 30 as it is an example. 
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(state.list?.results
                                              ?.characters?[index].name ??
                                          ""),
                                    ),
                                  )
                                ],
                              );
                      }),
                    );
                  } else if (state is HomeIntroLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return const Text("Insert a publisher");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BarSearch extends StatefulWidget {
  const BarSearch({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  State<BarSearch> createState() => _BarSearchState();
}

class _BarSearchState extends State<BarSearch> {
  String? name = "";
  @override
  Widget build(BuildContext context) {
    //An improvement would be to implement a timer and to remove the button

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onFieldSubmitted: (value) => _getListPublishersCubit(),
              autofocus: true,
              onChanged: (value) async {
                setState(() {
                  name = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: () {
              _getListPublishersCubit();
            },
            icon: Icon(
              Icons.search,
              color: name!.length >= 2
                  ? ApplicationThemes.appTheme(context).colorScheme.surface
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void _getListPublishersCubit() {
    if (name!.length >= 2) {
      widget.cubit.searchPublishers(name);
    } else {
      widget.cubit.searchPublishers(null);
    }
  }
}
