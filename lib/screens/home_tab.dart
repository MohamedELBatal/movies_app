import 'package:flutter/material.dart';
import 'package:movies_app/models/SourceResponse.dart';

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
          Container(
            height: MediaQuery.of(context).size.height * .30,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.zero),
                color: Colors.black),
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
