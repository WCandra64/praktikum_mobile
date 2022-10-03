import 'package:flutter/material.dart';
import 'package:kuis/books_data.dart';

import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String textList(List list) {
    String text = '';
    for(int i=0; i<list.length; i++){
      if(i==0) {
        text = list[i];
      } else{
        text = text+', '+list[i];
      }
    }
    return text;
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9/17,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20
        ),
        itemBuilder: (context, index){
          final BooksData book = booksData[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailPage(book: book);
              }));
            },
            child:
              Card(
                child:
                Column(
                  children: [
                    Image.network(
                      book.imageLinks,
                      fit: BoxFit.fill,
                      height: 260,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 20, 5),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        book.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          // fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 20, 5),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        textList(book.authors),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(
                                Icons.calendar_today,
                                size: 13,
                                color: Colors.grey[700]
                            ),
                          ),
                          Text(
                            book.publishedDate,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 13,
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey[700]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          );
        },
        itemCount: booksData.length,
      ),
    );
  }
}
