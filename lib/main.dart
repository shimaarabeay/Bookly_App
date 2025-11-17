import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';

import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Features/search/data/repo/search_repo.dart';

void main() {
  testSearch();
  setup();
  runApp(const BooklyApp());
}
void testSearch() async {
  final dio = Dio();
  final response = await dio.get(
    'https://www.googleapis.com/books/v1/volumes?q=intitle:flutter&filter=free-ebooks&orderBy=relevance',
  );
  print(response.data);
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                  ..fetchFeaturedBooks(),
          ),

          BlocProvider(
            create: (context) =>
                NewsetBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewsetBooks(),
          ),

         
        ],

        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: KprimaryColor,
          ),
        ),
      ),
    );
  }
}
