import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repo/search_repo.dart';
import '../search_cubit/search_cubit.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SearchResultCubit(getIt.get<SearchRepo>()),
        child: Scaffold(body: SafeArea(child: SearchViewBody())));
  }
}
