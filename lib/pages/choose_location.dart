import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../servicez/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();

}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> places = [
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    WorldTime(url: 'Africa/Accra', location: 'Ghana', flag: 'Ghana.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'South Africa', flag: 'south-africa.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'America/Toronto', location: 'Canada', flag: 'canada.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
void updateTime(index) async { // you use async and await whenever you are expecting a value from an API and a future value that will delay
WorldTime instance = places[index];
  await instance.getTime();
  Navigator.pop(context, {
    'location': instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDaytime':instance.isDaytime
  }) ;


     }
  // var counter = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose Location '),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(

        itemCount: places.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
              onTap: (){
                //print(places[index].location);
                updateTime(index);
              },
              title: Text(
                places[index].location,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                ),

              ),
                subtitle: Text(
                  places[index].url,
                  style: TextStyle(
                    fontSize: 16.0,

                  ),
                ),

                leading: CircleAvatar(backgroundImage:AssetImage('assets/${places[index].flag}')),
              ),
            ),
          );
        },
      )

      /*RaisedButton(
    onPressed: (){
      setState(() {
        counter++;
      });
    },
    child: Text('The counter is $counter'),
    ),*/



    );
    }
}





