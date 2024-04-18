import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 25),
      child: Column(
        children: [
          SearchBar(
            leading: Icon(
              Icons.search,
              color: Colors.white,
              size: 35,
            ),
            hintText: "Search",
            keyboardType: TextInputType.text,
            textStyle: MaterialStatePropertyAll(
              TextStyle(color: Colors.white),
            ),
            hintStyle: MaterialStatePropertyAll(
              TextStyle(color: Colors.white),
            ),
            backgroundColor: MaterialStatePropertyAll(Color(0xFF514F4F)),
          ),
          SizedBox(
            height: 200,
          ),
          Center(
            child: Icon(
              Icons.local_movies,
              size: 150,
              color: Color(0xFFB5B4B4),
            ),
          ),
          Text(
            "No Movies Found",
            style: TextStyle(
                color: Color(0xffffffffac),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}