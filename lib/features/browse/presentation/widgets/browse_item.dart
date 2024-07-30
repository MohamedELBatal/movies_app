import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/browse/data/models/BrowseModel.dart';

class BrowseItem extends StatefulWidget {
  final int index;
  final BrowseModel? browseModel;
  final List<Genres>? genres;

  BrowseItem({super.key, this.genres, required this.index, required this.browseModel});

  @override
  State<BrowseItem> createState() => _BrowseItemState();
}

class _BrowseItemState extends State<BrowseItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var browse = widget.browseModel?.genres ?? "";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          Expanded(
            child: FutureBuilder<BrowseModel>(
              future: ApiManager.getMoviesData(widget.genres?[selectedIndex].name ?? ""),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
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
                if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text("No Sources"));
                }

                var moviesList = snapshot.data!.genres ?? [];
                if (moviesList.isEmpty) {
                  return const Center(child: Text("No Sources"));
                }

                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 5),
                  itemBuilder: (context, index) {
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
  }
}
