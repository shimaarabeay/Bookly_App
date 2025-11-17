

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/local_storage.dart';
import '../../data/repo/search_repo.dart';
import 'search_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  final SearchRepo searchRepo;

  SearchResultCubit(this.searchRepo) : super(SearchResultInitial()) ;




  Future<void> fetchSearchResults({required String searchQuery}) async {
    emit(SearchResultLoading());

    var result = await searchRepo.fetchSearchResults(searchQuery: searchQuery);
    result.fold(
          (failure) {
        emit(SearchResultFailure(errMessage: failure.errMessage));
      },
          (books) {
        emit(SearchResultSuccess(books: books));
      },
    );
  }
}

