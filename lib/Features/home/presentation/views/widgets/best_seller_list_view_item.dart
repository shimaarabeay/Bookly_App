import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          // Navigate to book details view
          GoRouter.of(
            context,
          ).push(AppRouter.kbookDetailsView, extra: bookModel);
        },
        child: Row(
          children: [
            SizedBox(
              height: 150.h,
              child: CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
              ),
            ),

            SizedBox(width: 30.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.volumeInfo.title??"No title",
                    style: Styles.playfairDisplay,
                  ),
                  SizedBox(height: 3.h),
                  Text((bookModel.volumeInfo.authors != null && bookModel.volumeInfo.authors!.isNotEmpty)
                      ? bookModel.volumeInfo.authors![0]
                      : 'Unknown Author',
                    style: Styles.textStyle14,
                  ),

                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Text("Free", style: Styles.textStyle18),
                      Spacer(),
                      BookRating(
                        rating:
                        int.tryParse(
                          bookModel.volumeInfo.maturityRating ?? '',
                        ) ??
                            0,
                        count: bookModel.volumeInfo.pageCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
