import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sql_project_part3/Model/Author.dart';
import 'package:sql_project_part3/Model/Genre.dart';
import 'package:sql_project_part3/Model/Publisher.dart';
import 'package:sql_project_part3/Model/book.dart';

import 'Photos.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  Future<List<Book>> fetchAlbum() async {
    Photo photo = new Photo();
    photo.initPhoto();
    List<Book> books = [];
    var datas = await http
        .get(
            Uri.parse('http://10.0.2.2:9514/api/printed-product/get/all/books'))
        .timeout(Duration(seconds: 5));
    var jsonData = json.decode(datas.body);

    for (var u in jsonData) {
      List<Genre> genres = [];

      for (var s in u['genres']) {
        genres.add(new Genre(name: s['name']));
      }

      Book book = Book(
          volumesNumber: u['volumesNumber'],
          bookId: u['bookId'],
          printedProductId: u['printedProductId'],
          author: new Author(
              about: u['author']['about'],
              birthDate: u['author']['birthDate'],
              surname: u['author']['surname'],
              name: u['author']['name'],
              authorId: u['author']['authorId'],
              pseudonym: u['author']['pseudonym']),
          genres: genres,
          bookName: u['name'],
          publicationDate: u['publicationDate'],

          publisher: new Publisher(
            publisherId: u['publisher']['publisherId'],
            name: u['publisher']['name'],
            email: u['publisher']['email'],
            phone: u['publisher']['phone'],
            foundationDate: u['publisher']['foundationDate'],
          ),

          serialNumber: u['serialNumber'],
          pagesNumber: u['pagesNumber'],
          annotation: u['annotation'],
          photo: photo.imagePhoto[rng.nextInt(photo.imagePhoto.length)]);

      books.add(book);
    }
    print(books.length);
    return books;
  }

  void onTap(int bookId) async {
    List<Book> books = await fetchAlbum();
    Navigator.of(context).pushNamed('/main_screen/book_details',
        arguments: {'book_id': bookId, 'list': books});
    print(bookId);
  }

  Photo photo = new Photo();
  var rng = new Random();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchAlbum(),
        builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 250,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Stack(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(snapshot.data![index].photo),
                                        fit: BoxFit.cover)),
                                width: double.infinity,
                                height: 150,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    snapshot.data![index].author.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(snapshot.data![index].bookName),
                                ],
                              ),
                            ],
                          ),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () => onTap(snapshot.data![index].bookId),
                            ),
                          ),
                        ]),
                      );
                    }),
              ],
            );
          }
        });
  }
}
