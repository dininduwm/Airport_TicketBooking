import 'package:TicketBooking/datatypes/Shedule.dart';
import 'package:TicketBooking/services/GetShedules.dart';
import 'package:flutter/material.dart';

class ShowShedules extends StatefulWidget {
  ShowShedules({Key key}) : super(key: key);

  @override
  _ShowShedulesState createState() => _ShowShedulesState();
}

class _ShowShedulesState extends State<ShowShedules> {
  List<Shedule> shedules =
      GetShedules.shedules; // take the loaded shedules from the list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select the Flight you want to Book"),
      ),
      body: ListView.builder(
        itemCount: shedules == null ? 0 : shedules.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              color: Colors.lightBlue[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Departure Time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(shedules[index].dtime),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Arrival Time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(shedules[index].atime),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Plane ID",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(shedules[index].plane),
                        ],
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.book,
                      ),
                      label: Text("Book"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
