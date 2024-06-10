import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/browse/data/repositories/browse_repo_impl.dart';
import 'package:movies_app/features/browse/domain/use_cases/get_browse_use_case.dart';
import 'package:movies_app/features/browse/presentation/bloc/browse_bloc.dart';

import '../../data/data_sources/browse_ds_impl.dart';
import '../../data/models/BrowseModel.dart';

class BrowseTab extends StatefulWidget {
  static const String routeName = "Browse";

  BrowseTab({Key? key, this.genres}) : super(key: key);

  final List<Genres>? genres;

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}
class _BrowseTabState extends State<BrowseTab> {
  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseBloc(
        getBrowseUseCase: GetBrowseUseCase(
          BrowseRepoImpl(
            BrowseDSImpl(
              ApiManager(),
            ),
          ),
        ),
      )..add(const GetBrowseEvent()),
      child: BlocConsumer<BrowseBloc, BrowseState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    "Browse Category",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded( // هنا يجب أن يكون Expanded داخل Column
                  child: FutureBuilder<BrowseModel>(
                    future: ApiManager.getMoviesData(
                      widget.genres?[selectedIndex].name ?? "",
                    ),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }
                      print(snapshot.data);

                      if (!snapshot.hasData || snapshot.data == null) {
                        return const Center(child: Text("No Sources"));
                      }

                      var moviesList = snapshot.data!.genres ?? [];
                      if (moviesList.isEmpty) {
                        return const Center(child: Text("No Sources"));
                      }
                      print(snapshot.data);

                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          setState(() {});
                          print(snapshot.data);
                          return Text("${moviesList[index].name}");
                        },
                        itemCount: moviesList.length,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
