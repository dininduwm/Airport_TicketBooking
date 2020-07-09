import 'package:TicketBooking/services/GetAirports.dart';
import 'package:TicketBooking/services/GetShedules.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class BookFlight extends StatefulWidget {
  @override
  _BookFlightState createState() => _BookFlightState();
}

class _BookFlightState extends State<BookFlight> {
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<DropdownMenuItem<int>> airports = GetAirports.airports;

  int fromAirportIndex; // store the values of the starting airport
  int toAirportIndex; // store the values of the ending airport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () async {
          if (fromAirportIndex != null && toAirportIndex != null) {
            // if a passWord and a passport number has enterd
            bool res = await GetShedules.getShedules(GetAirports.airportID[fromAirportIndex], 
                          GetAirports.airportID[toAirportIndex]);
            if (res) {
              print("logged In");
              Toast.show(
                "Search successfull",
                this.context,
                gravity: Toast.BOTTOM,
                duration: Toast.LENGTH_LONG,
              );
              Navigator.popAndPushNamed(this.context, '/shedules');
            } else {
              Toast.show(
                "Login Faild Please try again",
                this.context,
                gravity: Toast.BOTTOM,
                duration: Toast.LENGTH_LONG,
              );
            }
          } else {
            Toast.show(
              "Please fill From and To airports",
              this.context,
              gravity: Toast.BOTTOM,
              duration: Toast.LENGTH_LONG,
            );
          }
        },
      ),
      appBar: AppBar(
        title: Text("Aeroplene ticket Booking"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset('assets/round-trip-ticket.gif'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Starting Airport : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50.0,
                        ),
                        Container(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  hint: Text('Select From Airport'),
                                  value: fromAirportIndex,
                                  items: airports,
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      fromAirportIndex = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Starting Airport : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50.0,
                        ),
                        Container(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  hint: Text('Select To Airport'),
                                  value: toAirportIndex,
                                  items: airports,
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      toAirportIndex = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
