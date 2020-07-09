import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class GetAirports {
  static List<DropdownMenuItem<int>> airports = [];
  static List<String> airportID = [];
  static int dataCount = 0;

  static Future<bool> GetAirportss() async {
    print("Getting Data");

    try {
      String url =
          "https://abstractive-flange.000webhostapp.com/api/getAirports.php";

      print(url);
      
      Response response = await get(url);
      //print(response.body);
      Map data = jsonDecode(response.body);
      //print(data['details']);

      //airports = [];
      int dataCount = 0;

      data['details'].forEach((airport) {
        print(airport);
        dataCount++;
        airportID.add(airport['regName']); // adding the id to the airportID list
        airports.add(
          DropdownMenuItem(
            child: Text(airport['regName'] + ' - ' + airport['location'] + ' - ' + airport['country']),
            value: dataCount-1,
          )
        );
      });

      //print(datas);
      print('Data Count = $dataCount');
      GetAirports.dataCount = dataCount;

      return (true);
    } catch (e) {
      print('Error in data loading');

      return(false);
    }
  }  
}
