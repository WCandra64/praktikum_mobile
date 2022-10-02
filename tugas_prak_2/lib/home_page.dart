import 'package:flutter/material.dart';
import 'package:tugas_prak_2/detail_page.dart';
import 'package:tugas_prak_2/tourism_place.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism Place'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailPage(place: place);
              }));
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    place.imageUrls[0],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 10, 20, 5),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              place.name,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              place.ticketPrice,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                              Icons.location_on_outlined,
                              size: 16,
                              color: Colors.grey[700]
                          ),
                        ),
                        Text(
                          place.location,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]
                          ),
                        ),
                      ],
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.calendar_today,
                                size: 14,
                              ),
                            ),
                            Text(
                              place.openDays,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 5),
                              child: const Icon(
                                Icons.access_time,
                                size: 14,
                              ),
                            ),
                            Text(
                              place.openTime,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}
