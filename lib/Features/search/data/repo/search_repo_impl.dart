import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/errors/failure.dart';
import '../../../home/data/model/book_model/book_model.dart';
import 'search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResults({
    required String searchQuery,
  }) async {
    try {

      final encodedQuery = Uri.encodeQueryComponent(searchQuery.trim());


      final endpoint = '?q=intitle:$encodedQuery&orderBy=relevance';

      final data = await apiService.get(endPoint: endpoint);


      if (data == null || data['items'] == null || (data['items'] as List).isEmpty) {
        return left(ServerFailure(errMessage: 'No results found for "$searchQuery"'));
      }

      final List<BookModel> books = (data['items'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}

