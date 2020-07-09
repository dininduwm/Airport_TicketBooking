import 'package:http/http.dart';
import 'dart:convert';
import 'GetAirports.dart';

class GetLogin {
  
  static Future<bool> login(String passport, String password) async {
    print("Getting Data");

    await GetAirports.GetAirportss(); // populating airports

    try {
      String and = '&';
      String url =
          "https://abstractive-flange.000webhostapp.com/api/login.php?password=" + password +
              and +
              "passport=" + passport;

      print(url);
      
      Response response = await get(url);
      print(response.body);
      Map data = jsonDecode(response.body);
      //print(data['details']);

      if (data['response'] == 'ok'){
        return (true);
      }

      
    } catch (e) {
      print('Error in data loading');
    }

    return (false);
  }  
}
