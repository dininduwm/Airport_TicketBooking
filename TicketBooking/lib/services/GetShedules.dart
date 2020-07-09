import 'package:TicketBooking/datatypes/Shedule.dart';
import 'package:http/http.dart';
import 'dart:convert';

class GetShedules {
  static List<Shedule> shedules = [];
  static int dataCount = 0;

  static Future<bool> getShedules(String from, String to) async {
    print("Getting Data");

    try {
      String url =
          "https://abstractive-flange.000webhostapp.com/api/getShedule.php?from=" +
              from +
              "&to=" +
              to;

      print(url);

      Response response = await get(url);
      //print(response.body);
      Map data = jsonDecode(response.body);
      //print(data['details']);

      //airports = [];
      int dataCount = 0;

      data['details'].forEach((shedule) {
        print(shedule);
        dataCount++;
        shedules.add(
          Shedule(
            record: shedule['record'],
            dtime: shedule['dtime'],
            atime: shedule['atime'],
            from: shedule['from'],
            to: shedule['to'],
          ),
        ); // adding shedules list

      });

      //print(datas);
      print('Data Count = $dataCount');
      GetShedules.dataCount = dataCount;

      return (true);
    } catch (e) {
      print('Error in shedule loading');

      return (false);
    }
  }
}
