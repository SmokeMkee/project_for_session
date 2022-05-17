
import 'package:flutter/material.dart';
import 'package:sql_project_part3/Model/Like.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onTapForBook(int bookId) {
    Navigator.of(context).pushNamed('/main_screen/like_screen/book_details',
        arguments: {'book_id': bookId, 'list': Like.listForBook});
  }
  void onTapForJournal(int journalId) {
    Navigator.of(context).pushNamed('/main_screen/like_screen/journal_details',
        arguments: {'journal_id': journalId, 'list': Like.listForJournal});
  }
  void onTapForNewspaper(int newspaperId) {
    Navigator.of(context).pushNamed('/main_screen/like_screen/newspaper_details',
        arguments: {'newspaper_id': newspaperId, 'list': Like.listForNewspaper});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(68, 167, 184, 1),
        title: Text("Сохраненные"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Books',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisExtent: 250,
                        childAspectRatio: 3 / 2,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
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
                                              Like.listForBook[index].photo),
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
                                      Like.listForBook[index].bookName,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(Like.listForBook[index].author.name,      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ],
                            ),
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () => onTapForBook(
                                    Like.listForBook[index].bookId),
                              ),
                            ),
                          ]),
                        );
                      },
                      itemCount: Like.listForBook.length,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Journals', style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisExtent: 250,
                        childAspectRatio: 3 / 2,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
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
                                              Like.listForJournal[index].photo),
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
                                      Like.listForJournal[index].journalName,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(Like
                                        .listForJournal[index].publisher.name,      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ],
                            ),
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () => onTapForJournal(
                                    Like.listForJournal[index].journalId),
                              ),
                            ),
                          ]),
                        );
                      },
                      itemCount: Like.listForJournal.length,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Newspaper', style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisExtent: 250,
                        childAspectRatio: 3 / 2,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
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
                                          image: NetworkImage(Like
                                              .listForNewspaper[index].photo),
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
                                      Like.listForNewspaper[index]
                                          .newsPaperName,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      Like.listForNewspaper[index].publisher
                                          .name,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () => onTapForNewspaper(
                                    Like.listForNewspaper[index].newspaperId),
                              ),
                            ),
                          ]),
                        );
                      },
                      itemCount: Like.listForNewspaper.length,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
