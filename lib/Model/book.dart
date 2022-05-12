import 'package:sql_project_part3/Model/Publisher.dart';

import 'Author.dart';
import 'Genre.dart';

class Book {
  int bookId;
  String bookName;
  String annotation;
  int pagesNumber;
  String publicationDate;
  int serialNumber;
  Publisher publisher;
  int printedProductId;
  Author author;
  int volumesNumber;
  List<Genre> genres;
  String photo;

  Book(
      {
        required this.bookId,
        required this.bookName,
        required this.annotation,
        required this.pagesNumber,
        required this.publicationDate,
        required this.serialNumber,
        required this.photo,

        required this.publisher,
        required this.genres,
        required this.volumesNumber,
        required this.author,
        required this.printedProductId
      });
}
