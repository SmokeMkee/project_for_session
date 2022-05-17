import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sql_project_part3/Model/Author.dart';
import 'package:sql_project_part3/Model/Genre.dart';
import 'package:sql_project_part3/Model/Newspaper.dart';
import 'package:sql_project_part3/Model/Publisher.dart';
import 'package:sql_project_part3/Model/book.dart';
import 'package:sql_project_part3/app_screens/hit_screen/hit_tabs_screen/Photos.dart';
class NewsPapers_Screen extends StatefulWidget {
  const NewsPapers_Screen({Key? key}) : super(key: key);

  @override
  _NewsPapers_ScreenState createState() => _NewsPapers_ScreenState();
}

class _NewsPapers_ScreenState extends State<NewsPapers_Screen> {
  
  Photo photo = new Photo();
  var rng = new Random();

  
  Future<List<Newspaper>> fetchAlbum() async {
    photo.initPhoto();
    var datas = await http
        .get(
        Uri.parse('http://10.0.2.2:9514/api/printed-product/get/all/newspapers'))
        .timeout(Duration(seconds: 5));
    var jsonData = json.decode(datas.body);
    List<Newspaper> newspapers = [];

    for (var u in jsonData) {
      List<Genre> genres = [];

      for (var s in u['genres']) {
        genres.add(new Genre(name: s['name']));
      }

      Newspaper newspaper = Newspaper(
          newspaperId: u['newspaperId'],
          printedProductId: u['printedProductId'],
          genres: genres,
          newsPaperName: u['name'],
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
          annotation: u['annotation'], photo: photo.imagePhoto[rng.nextInt(photo.imagePhoto.length)]);

      newspapers.add(newspaper);
    }
    print(newspapers.length);
    return newspapers;
  }

  void onTap(int newspaperId) async {
    List<Newspaper> newspaper = await fetchAlbum();
    Navigator.of(context).pushNamed('/main_screen/newspaper_details',
        arguments: {'book_id': newspaperId, 'list': newspaper});
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: fetchAlbum(),
        builder: (BuildContext context, AsyncSnapshot<List<Newspaper>> snapshot) {
          if (snapshot.data == null) {
            return Center(
                child: CircularProgressIndicator()
            );
          } else {
            return Stack(
              children: [
                GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 270,
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
                                    snapshot.data![index].publisher.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(snapshot.data![index].newsPaperName),
                                ],
                              ),
                            ],
                          ),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () => onTap(snapshot.data![index].newspaperId),
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
