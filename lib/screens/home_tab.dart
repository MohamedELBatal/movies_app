import 'package:flutter/material.dart';
import 'package:movies_app/models/SourceResponse.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';
import 'package:movies_app/shared/network/remote/endPoint.dart';

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
          FutureBuilder(future: ApiManager.getMoviesData(EndPoints.moviesData), builder:(context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went Wrong"));
            }
            var results = snapshot.data?.results??[];
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Text("${results[index].title}");
              },itemCount: results.length,),
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
