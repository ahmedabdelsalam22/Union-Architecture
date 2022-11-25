import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';

import '../../../core/services/srevices_locator.dart';
import '../../../core/utils/app_string.dart';
import '../components/now_playing_component.dart';
import '../components/popular_component.dart';
import '../components/top_rated_component.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return sl<MoviesBloc>()
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
          ..add(GetTopRatedMoviesEvent());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              Container(
                margin: EdgeInsets.fromLTRB(
                  16.0.sp,
                  24.0.sp,
                  16.0.sp,
                  8.0.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.popular,
                      style: GoogleFonts.poppins(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 0.15.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Row(
                          children: [
                            const Text(
                              AppString.seeMore,
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponent(),
              Container(
                margin: EdgeInsets.fromLTRB(
                  16.0.sp,
                  24.0.sp,
                  16.0.sp,
                  8.0.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.topRated,
                      style: GoogleFonts.poppins(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Row(
                          children: [
                            const Text(
                              AppString.seeMore,
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponent(),
              SizedBox(height: 50.0.h),
            ],
          ),
        ),
      ),
    );
  }
}
