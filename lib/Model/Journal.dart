import 'Author.dart';
import 'Genre.dart';
import 'Publisher.dart';

class Journal {
  int journalId;//
  String journalName;//
  String annotation;//
  int pagesNumber;//
  String publicationDate;//
  int serialNumber;//
  Publisher publisher;//
  int printedProductId;//
  Genre genres;
  String photo;

  Journal(
      {required this.journalId,
      required this.journalName,
      required this.annotation,
      required this.pagesNumber,
      required this.publicationDate,
      required this.serialNumber,
      required this.photo,
      required this.publisher,
      required this.genres,
      required this.printedProductId});
}
