import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'choose_location.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}



class _HomeState extends State<Home> {

  Map data = {}; // initially setting this into empty map
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; // this is checking the data variable above is empty or not if it is empty it will run modal or else the upadeted time
   // print(data);
    // The below code helps to change the background image
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.blue[900];
    String smallIg = data['flag'];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
          ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,300,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location'); //we are storing the updated time on the dynamic result variable
                    setState(() {
                      data =({
                        'location': result['location'],
                        'flag':result['flag'],
                        'time':result['time'],
                        'isDaytime':result['isDaytime']
                      });

                    });
                  },
                  icon:Icon(
                      Icons.edit_location,
                    color: Colors.grey[200],
                    size: 30.0,
                  ),
                  label: Text(
                      'Edit Location',
                    style: TextStyle(
                        color: Colors.grey[200],
                      fontSize: 25.0
                    ),
                  ),
                ),
                SizedBox(height:30.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [CircleAvatar(
                      backgroundImage: AssetImage('assets/$smallIg'),
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: Text(
                          data['location'],
                          style: TextStyle(
                            fontSize:24.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ),


                    ]
                ),

                SizedBox(height:30.0),
                Text(data['time'],
                  style: TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                    color: Colors.white,
                  ),

                )
              ],

            ),
          ),
        ),
      )

    );
  }
}
