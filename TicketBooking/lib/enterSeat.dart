import 'package:TicketBooking/services/GetBooked.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class EnterSeat extends StatefulWidget {
  @override
  _EnterSeatState createState() => _EnterSeatState();
}

class _EnterSeatState extends State<EnterSeat> {
  TextEditingController seatNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          
          if (seatNumberController.text != '') {
            // if a passWord and a passport number has enterd
            bool res = await GetBooked.book(seatNumberController.text);
            if (res) {
              print("Booking Successfull");
              Toast.show(
                "Booking successfull",
                this.context,
                gravity: Toast.BOTTOM,
                duration: Toast.LENGTH_LONG,
              );
              Navigator.popAndPushNamed(this.context, '/');
            } else {
              Toast.show(
                "Booking Faild Please try again",
                this.context,
                gravity: Toast.BOTTOM,
                duration: Toast.LENGTH_LONG,
              );
            }
          } else {
            Toast.show(
              "Please fill Seat Number",
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
                      "Enter the Seat No : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                      controller: seatNumberController,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the Seat No",
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
