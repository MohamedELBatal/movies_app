import 'package:flutter/material.dart';
import 'package:movies_app/models/SourceResponse.dart';
import 'package:movies_app/screens/browse_tab.dart';
import 'package:movies_app/screens/search_tab.dart';
import 'package:movies_app/screens/watch_list_tab.dart';
import 'package:movies_app/shared/network/remote/api_manager.dart';
import 'package:movies_app/screens/home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Results> films = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF1A1A1A),
          selectedItemColor: Colors.amber,
          iconSize: 30,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_home.png")),
                label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_browse.png")),
                label: "Browse"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_watchlist.png")),
                label: "WatchList"),
          ]),
      body: FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something went Wrong"));
          }
          films = snapshot.data?.results ?? [];
          return tabs[index];
        },
      ),
    );
  }

  late List<Widget> tabs = [
    HomeTab(
      results: films,
    ),
    const SearchTab(),
    const BrowseTab(),
    const WatchListTab(),
  ];
}
