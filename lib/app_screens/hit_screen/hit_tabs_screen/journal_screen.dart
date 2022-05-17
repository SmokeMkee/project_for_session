import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sql_project_part3/Model/Author.dart';
import 'package:sql_project_part3/Model/Genre.dart';
import 'package:sql_project_part3/Model/Journal.dart';
import 'package:sql_project_part3/Model/Publisher.dart';
import 'package:sql_project_part3/Model/book.dart';

import 'Photos.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  Future<List<Journal>> fetchAlbum() async {
    photo.initPhoto();
    var datas = await http
        .get(Uri.parse(
            'http://10.0.2.2:9514/api/printed-product/get/all/journals'))
        .timeout(Duration(seconds: 5));
    var jsonData = json.decode(datas.body);
    List<Journal> journals = [];

    for (var u in jsonData) {
      Journal journal = Journal(
          printedProductId: u['printedProductId'],
          genres: new Genre(name: u['name']),
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
          photo: photo.imagePhoto[rng.nextInt(photo.imagePhoto.length)],
          journalName: u['name'],
          journalId: u['journalId']);

      journals.add(journal);
    }
    print(journals.length);
    return journals;
  }

  void onTap(int journal_id) async {
    List<Journal> journals = await fetchAlbum();
    Navigator.of(context).pushNamed('/main_screen/journal_details',
        arguments: {'book_id': journal_id, 'list': journals});
    print(journal_id);
  }

  Photo photo = new Photo();
  var rng = new Random();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchAlbum(),
        builder: (BuildContext context, AsyncSnapshot<List<Journal>> snapshot) {
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
                                        image: NetworkImage(
                                            snapshot.data![index].photo),
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
                                    snapshot.data![index].publisher.name,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(snapshot.data![index].journalName),
                                ],
                              ),
                            ],
                          ),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () =>
                                  onTap(snapshot.data![index].journalId),
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
