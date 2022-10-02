import 'package:flutter/material.dart';
import 'tourism_place.dart';

class DetailPage extends StatefulWidget {
  final TourismPlace place;

  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.place.name),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Container(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.network(widget.place.imageUrls[index]),
                      );
                    },
                    itemCount: widget.place.imageUrls.length,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 16, top: 20),
                  child: Text(
                    widget.place.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.place.ticketPrice,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                          ),
                        )
                      ],
                    ),
                    locationDetail(widget.place.location, Icon(Icons.location_on_outlined)),
                    locationDetail(widget.place.openDays, Icon(Icons.calendar_today)),
                    locationDetail(widget.place.openTime, Icon(Icons.access_time)),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Deskripsi:',
                        )
                      ],
                    ),
                    SizedBox(height: 4,),
                    Text(widget.place.description),
                  ],
                )
              ],
            ),
          )
        )

    );
  }

  Widget locationDetail(String text, Icon ikon){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 5),
            child: ikon,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      )
    );
  }
}
