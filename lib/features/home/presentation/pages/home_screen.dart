import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/home/data/data_source/home_ds.dart';
import 'package:movies_app/features/home/data/data_source/home_ds_impl.dart';
import 'package:movies_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:movies_app/features/home/domain/repositories/home_repo.dart';
import 'package:movies_app/features/home/domain/use_cases/get_popular_use_case.dart';
import 'package:movies_app/features/home/domain/use_cases/get_top_rated_use_case.dart';
import 'package:movies_app/features/home/domain/use_cases/get_upcoming_use_case.dart';
import 'package:movies_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:movies_app/features/home/presentation/pages/browse_tab.dart';
import 'package:movies_app/features/home/presentation/pages/home_tab.dart';
import 'package:movies_app/features/home/presentation/pages/search_tab.dart';
import 'package:movies_app/features/home/presentation/pages/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getPopularUseCase: GetPopularUseCase(
          HomeRepoImpl(
            HomeDsImdpl(
              ApiManager(),
            ),
          ),
        ),
        getTopRatedUseCase: GetTopRatedUseCase(
          HomeRepoImpl(
            HomeDsImdpl(
              ApiManager(),
            ),
          ),
        ),
        getUpComingUseCase: GetUpComingUseCase(
          HomeRepoImpl(
            HomeDsImdpl(
              ApiManager(),
            ),
          ),
        ),
      )
        ..add(
          GetPopularEvent(),
        )
        ..add(
          GetUpComingEvent(),
        )
        ..add(
          GetUpComingEvent(),
        ),
      child: Scaffold(
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_browse.png")),
                  label: "Browse"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_watchlist.png")),
                  label: "WatchList"),
            ]),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(child: tabs[index]),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    HomeTab(
      results: [],
    ),
    const SearchTab(),
    const BrowseTab(),
    const WatchListTab()
  ];
}
