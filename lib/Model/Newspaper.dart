import 'Author.dart';
import 'Genre.dart';
import 'Publisher.dart';

class Newspaper {
  int newspaperId;
  String newsPaperName;
  String annotation;
  int pagesNumber;
  String publicationDate;
  int serialNumber;
  Publisher publisher;
  int printedProductId;
  List<Genre> genres;
  String photo;

  Newspaper(
      {required this.newspaperId,
        required this.newsPaperName,
        required this.annotation,
        required this.pagesNumber,
        required this.publicationDate,
        required this.serialNumber,
        required this.photo,
        required this.publisher,
        required this.genres,
        required this.printedProductId});
}
