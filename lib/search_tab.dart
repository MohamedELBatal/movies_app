import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  static const String routeName = "Search";
  const SearchTab({super.key});

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _movies = [
    'The Shawshank Redemption',
    'The Godfather',
    'The Dark Knight',
    'Pulp Fiction',
    'The Lord of the Rings: The Return of the King',
  ]; // قائمة بأفلام لاستخدامها كأمثلة
  List<String> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_filterMovies);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterMovies);
    _searchController.dispose();
    super.dispose();
  }

  void _filterMovies() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredMovies = _movies
          .where((movie) => movie.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 25),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search, color: Colors.white, size: 35),
              hintStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: const Color(0xFF514F4F),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _filteredMovies.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_movies,
                    size: 150,
                    color: Color(0xFFB5B4B4),
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
            )
                : ListView.builder(
              itemCount: _filteredMovies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _filteredMovies[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
