import 'package:http/http.dart';
import 'dart:convert';

class GetBooked {

  static String passport;
  static String shedule;
  
  static Future<bool> book(String seat) async {
    print("Getting Data");

    try {
      String and = '&';
      String url =
          "https://abstractive-flange.000webhostapp.com/api/insert.php?seat=" + seat +
              and +
              "passport=" + passport + and +
              "shedule="+shedule;

      print(url);
      
      Response response = await get(url);
      print(response.body);
      Map data = jsonDecode(response.body);
      //print(data['details']);

      if (data['response'] == 'Ok'){
        return (true);
      }

      
    } catch (e) {
      print('Error in data loading');
    }

    return (false);
  }  
}
