import 'package:flutter/material.dart';
import 'package:sql_project_part3/Model/book.dart';

class BookDetailsScreen extends StatefulWidget {
  final List<Book> list;
  final book_id;
  const BookDetailsScreen({Key? key, required this.book_id, required this.list})
      : super(key: key);

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  List<Book> listDetail = [];
  void init() {
    for (int i = 0; i < widget.list.length; ++i) {
      if (widget.list[i].bookId == widget.book_id) {
        listDetail.add(widget.list[i]);
      }
    }
  }

  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(68, 167, 184, 1) ,
        title: Text(listDetail[0].bookName),
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
                            listDetail[index].bookName,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            listDetail[index].author.name +
                                " " +
                                listDetail[index].author.surname,
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
                SizedBox(height: 20,),
                Divider(height: 7, thickness: 2, ),
                SizedBox(height: 20,),
                Text(listDetail[index].annotation , style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  letterSpacing: 1
                ),),
                SizedBox(height: 20,),
                ExpansionTile(
                  title: Text('Author', style: TextStyle( fontSize: 17)),
                  subtitle: Text('Information About author' , style: TextStyle( fontSize: 14),),
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
                                   SizedBox(height: 10,),
                                   Text('Surname : '),
                                   SizedBox(height: 10,),
                                   Text('Pseudonym : '),
                                   SizedBox(height: 10,),
                                   Text('BirthDate : '),
                                   SizedBox(height: 10,),

                                 ],
                               ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [

                                   Text(listDetail[index].author.name),
                                   SizedBox(height: 10,),
                                   Text(listDetail[index].author.surname),
                                   SizedBox(height: 10,),
                                   Text(listDetail[index].author.pseudonym),
                                   SizedBox(height: 10,),
                                   Text(listDetail[index].author.birthDate),
                                   SizedBox(height: 10,),

                                 ],
                               ),

                             ],
                           ),
                            Text('About Author : '),
                            SizedBox(height: 10,),
                            Text(listDetail[index].author.about , maxLines: 10, overflow: TextOverflow.ellipsis,)
                          ],
                        )),

                  ],
                ),
                ExpansionTile(
                  title: Text('Publisher', style: TextStyle( fontSize: 17)),
                  subtitle: Text('Information about publisher' , style: TextStyle( fontSize: 14),),
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
                                    SizedBox(height: 10,),
                                    Text('email : '),
                                    SizedBox(height: 10,),
                                    Text('phone : '),
                                    SizedBox(height: 10,),
                                    Text('foundationDate : '),
                                    SizedBox(height: 10,),
                                    Text('address : ')

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Text(listDetail[index].publisher.name),
                                    SizedBox(height: 10,),
                                    Text(listDetail[index].publisher.email),
                                    SizedBox(height: 10,),
                                    Text(listDetail[index].publisher.phone),
                                    SizedBox(height: 10,),
                                    Text(listDetail[index].publisher.foundationDate),
                                    SizedBox(height: 10,),
                                    Text(listDetail[index].publisher.publisherId.toString())

                                  ],
                                ),

                              ],
                            ),
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
