import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const khomeView = '/homeView';
  static const ksplashView = '/';
  static const kbookDetailsView = '/bookDetailsView';
  static const ksearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: ksplashView, builder: (context, state) => SplashView()),
      GoRoute(path: khomeView, builder: (context, state) => HomeView()),

      GoRoute(
        path: kbookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),

      GoRoute(path: ksearchView, builder: (context, state) => SearchView()),
    ],
  );

  // Define other routes as needed
}
