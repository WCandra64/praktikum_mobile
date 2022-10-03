import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuis/books_data.dart';
import 'books_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final BooksData book;

  const DetailPage({Key? key, required this.book}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
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
          title: Text(widget.book.title),
        ),
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Container(
                    child: Image.network(widget.book.imageLinks, height: 420, fit: BoxFit.fill,),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8, top: 20),
                    child: Text(
                      widget.book.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                            'By '+textList(widget.book.authors),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL(widget.book.previewLink);
                          },
                          child: const Text('Preview'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            // primary: Colors.red,
                            // fixedSize: const Size.fromWidth(100.0),
                          ),
                        ),
                      ),
                      bookDetail('Penerbit', widget.book.publisher),
                      const SizedBox(height: 10,),
                      bookDetail('Tanggal Terbit', widget.book.publishedDate),
                      const SizedBox(height: 10,),
                      bookDetail('Kategori', textList(widget.book.categories)),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                              'Deskripsi: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 4,),
                      Text(widget.book.description),
                    ],
                  )
                ],
              ),
            )
        )

    );
  }

  Widget bookDetail(String key, String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start ,
      children: [
        Text(
            '$key: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )
        ),
        Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            )
        ),
      ],
    );
  }

  void _launchURL(_url) async {
    if(!await launch(_url)) throw 'Could not launch $_url';
  }
}
