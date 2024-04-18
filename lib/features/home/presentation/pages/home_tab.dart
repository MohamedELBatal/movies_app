import 'package:flutter/material.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/features/home/data/models/PopularModel.dart';
import 'package:movies_app/features/home/presentation/widgets/movie_item.dart';

class HomeTab extends StatelessWidget {
  List<Results> results;

  HomeTab({required this.results, super.key});

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          FutureBuilder(future: ApiManager.getMoviesData(EndPoints.popular), builder:(context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went Wrong"));
            }
            var results = snapshot.data
            ;
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 15,),
                itemBuilder: (context, index) {
                  return MovieItem(results: Results.fromJson(results),);
                },itemCount: index),
            );
          }, ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .15,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.zero),
              color: Color(0xFF282A28),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .15,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.zero),
              color: Color(0xFF282A28),
            ),
          ),
        ],
      ),
    );
  }
}