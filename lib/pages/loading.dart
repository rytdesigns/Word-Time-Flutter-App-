import 'package:flutter/material.dart';
import 'package:com/servicez//world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
String  time=  'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime( // The instance here can be changed to something else, it is just like a variable name . the worldtime is now a datatype like string, var, int, bool etc
        location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
       'isDaytime':instance.isDaytime} //this {} is called map which is used to pass this values into the home page
    );
    //print(instance.time);
    /*setState(() {
      time = instance.time;
    });
  */
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
   // setupWorldTime(); //this is triggered bu the setuWorldTime instance

    }

  @override
  Widget build(BuildContext context) {
    //print(instance.time);
    return Scaffold(
        backgroundColor: Colors.blue[900],
      body: Center(
        child:SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
