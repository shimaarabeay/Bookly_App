  import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../../../home/data/model/book_model/book_model.dart';

abstract class SearchRepo {

   Future<Either<Failure, List<BookModel>>> fetchSearchResults({required String searchQuery});
 }