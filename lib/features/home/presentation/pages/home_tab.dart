import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home/data/models/PopularModel.dart';
import 'package:movies_app/features/home/data/models/TopRatedModel.dart';
import 'package:movies_app/features/home/presentation/bloc/home_bloc.dart';

import '../../../../core/api/api_manager.dart';
import '../../data/data_source/home_ds_impl.dart';
import '../../data/repositories/home_repo_impl.dart';
import '../../domain/use_cases/get_popular_use_case.dart';
import '../../domain/use_cases/get_top_rated_use_case.dart';
import '../../domain/use_cases/get_upcoming_use_case.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = "home";

  List<Results> results;
  List<Results> data;

  HomeTab({required this.results,required this.data, super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;

  List<String> images = [
    "assets/images/1.png",
    "assets/images/1.png",
    "assets/images/1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getPopularUseCase: GetPopularUseCase(
          HomeRepoImpl(
            HomeDsImpl(
              ApiManager(),
            ),
          ),
        ),
        getTopRatedUseCase: GetTopRatedUseCase(
          HomeRepoImpl(
            HomeDsImpl(
              ApiManager(),
            ),
          ),
        ),
        getUpComingUseCase: GetUpComingUseCase(
          HomeRepoImpl(
            HomeDsImpl(
              ApiManager(),
            ),
          ),
        ),
      )
        ..add(const GetPopularEvent())
        ..add(const GetUpComingEvent())
        ..add(const GetTopRatedEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250.h,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.93,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: images.map((image) {
                        return SizedBox(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 20.h,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.asMap().entries.map((entry) {
                          int index = entry.key;
                          return Container(
                            width: 10.w,
                            height: 10.h,
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? const Color(0xFF06004E)
                                  : Colors.white,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey[900], // لون الخلفية لقسم New Releases
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, bottom: 10.h),
                        child: Text(
                          'New Releases',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      (state.popularModel != null)
                          ? NewRelease((state.popularModel?.data ?? [])
                              .cast<Response>())
                          : SizedBox(
                              height: 280.h,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey[900], // لون الخلفية لقسم Recommended
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, bottom: 10.h),
                        child: Text(
                          'Recommended',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      (state.topRatedModel != null)
                          ? Recommended((state.topRatedModel?.results ?? []))
                          : SizedBox(
                              height: 280.h,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget NewRelease(List<Response> data) => Container(
        height: 180.h,
        margin: EdgeInsets.only(left: 16.w),
        child: data.isEmpty
            ? const Center(
                child: Text('No Results Found'),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Container(
                    width: 140.w,
                    margin: EdgeInsets.only(right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 150.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${data[i].backdropPath}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Positioned(
                              top: 10.h,
                              left: 10.w,
                              child: Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            data[i].title ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      );

  Widget Recommended(List<Results> results) => Container(
    height: 250.h,
    margin: EdgeInsets.only(left: 16.w),
    child: results.isEmpty
        ? const Center(
      child: Text('No Results Found'),
    )
        : ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: results.length,
      itemBuilder: (context, i) {
        return Container(
          width: 140.w,
          margin: EdgeInsets.only(right: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150.h,
                    child: results[i].backdropPath != null
                        ? CachedNetworkImage(
                      imageUrl:
                      'https://image.tmdb.org/t/p/w500${results[i].backdropPath}',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    )
                        : const Center(
                      child: Text(
                        'No Image',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    left: 10.w,
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      results[i].title ?? 'No Title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 18.sp),
                        SizedBox(width: 4.w),
                        Text(
                          '${results[i].voteAverage ?? 0.0}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Release Date: ${results[i].releaseDate ?? 'Unknown'}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

}
