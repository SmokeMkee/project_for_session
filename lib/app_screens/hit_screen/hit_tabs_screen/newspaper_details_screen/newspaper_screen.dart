import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sql_project_part3/Model/Like.dart';
import 'package:sql_project_part3/Model/Newspaper.dart';


class NewspaperDetailsScreen extends StatefulWidget {
  final newspaper_id;
  final List<Newspaper> list;

  const NewspaperDetailsScreen(
      {Key? key, required this.newspaper_id, required this.list})
      : super(key: key);

  @override
  _NewspaperDetailsScreenState createState() => _NewspaperDetailsScreenState();
}

class _NewspaperDetailsScreenState extends State<NewspaperDetailsScreen> {
  List<Newspaper> listDetail = [];
  void init() {
    for (int i = 0; i < widget.list.length; ++i) {
      if (widget.list[i].newspaperId == widget.newspaper_id) {
        listDetail.add(widget.list[i]);
      }
    }
  }

  late Color _buttonColor;
  void pressButton() {
    Like.listForNewspaper.add((listDetail[0]));
    setState(() {
      if (_buttonColor == Colors.white) {
        _buttonColor = Colors.black54;
      } else {
        _buttonColor = Colors.white;
      }
    });
  }

  @override
  void initState() {
    _buttonColor = Colors.white;;
    init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(68, 167, 184, 1),
        title: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Row(
            children: [
              Expanded(child: Text(listDetail[0].newsPaperName)),
              IconButton(
                  onPressed: () {
                    pressButton();
                  },
                  icon: SvgPicture.asset(
                    'assets/like.svg',
                    color: _buttonColor,
                  ))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(listDetail[0].photo),
                                fit: BoxFit.contain)),
                        width: double.infinity,
                        height: 300,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listDetail[index].newsPaperName,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            listDetail[index].publisher.name,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.orangeAccent),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            listDetail[index].publicationDate,
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(listDetail[index].pagesNumber.toString(),
                              style:
                                  TextStyle(fontSize: 17, color: Colors.grey))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 7,
                  thickness: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  listDetail[index].annotation,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  title: Text('Publisher', style: TextStyle(fontSize: 17)),
                  subtitle: Text(
                    'Information about publisher',
                    style: TextStyle(fontSize: 14),
                  ),
                  // Contents
                  children: [
                    ListTile(
                        title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Name : '),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('email : '),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('phone : '),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('foundationDate : '),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('address : ')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  listDetail[index].publisher.name,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(listDetail[index].publisher.email),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(listDetail[index].publisher.phone),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    listDetail[index].publisher.foundationDate),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(listDetail[index]
                                    .publisher
                                    .publisherId
                                    .toString())
                              ],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
              ]);
            }),
      ),
    );
  }
}
