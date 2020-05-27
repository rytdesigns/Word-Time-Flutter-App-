import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {

  String location; // the location we will be filtering
  String time; // the time in the respective locations
  String flag; // tiny image icon for the location
  String url; // url for the api endpoint
  bool isDaytime; // This will check if the time is day or night
 WorldTime({this.location, this.time,this.flag,this.url, this.isDaytime});  // this is a constructor with a named value


 Future<void> getTime() async {
   try {
     Response response = await get(
         'https://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);
     // print(response.body);
     // print('The date and time is'+data['datetime'] );
     String datetime = data["datetime"];

     // var moonLanding = DateTime.parse("2020-05-03T16:44:08.290016+01:00");
     String offset = data['utc_offset'].substring(
         1, 3); // this helped to remove the plus sign in the utc_offset
     // DateTime rio = DateTime.parse(datetime);
     // create DateTime object
     DateTime now = DateTime.parse(datetime);
     DateTime rio = now.add(Duration(hours: int.parse(offset)));

     // set the time property
     isDaytime = rio.hour > 6 && rio.hour < 20 ? true:false;
     time = DateFormat.jm().format(rio);
     //print(time);
   }
   catch (e){
     print('Hello there is an error:$e');
   }

  }
}

// creating the instance of the class WorldTime just like  DateTime now = DateTime.parse(datetime)

