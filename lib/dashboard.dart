import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visioneducation/mynavigator.dart';
import 'carrier.dart';
import 'certification.dart';
import 'notification.dart';
import 'package:refluttersdk/refluttersdk.dart';


final _refluttersdkPlugin = Refluttersdk();

class MyAppp extends StatefulWidget {
  const MyAppp({Key? key}) : super(key: key);

  @override
  State<MyAppp> createState() => _MyApppState();
}

class _MyApppState extends State<MyAppp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Carrier?resulid=OCtMHxLM218V058UF9ENEMyOTY5QXwxSg==&utm_source=SmartDx&utm_medium=wp&utm_campaign=RH_WEB_ET_CHECK_K3m': (BuildContext ctx) => const Carrier(),
        "/Certification": (BuildContext ctx) => const Certification(),
      },
      debugShowCheckedModeBanner: false,
      title: 'vision Education',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home:DashboardPage(title: "vision Education"),
    );
  }
}

class DashboardPage extends StatefulWidget {
   DashboardPage({Key? key, required String title}) : super(key: key);

  @override
  State<DashboardPage> createState() => DashboardPageState();
}


class DashboardPageState extends State<DashboardPage> {

  late var navigationParameter;
  late var screenName;
  late var receivedData;
  late SharedPreferences shared;

  deeplinkHandler(){

    /**
     * App screen Navigations via link and notifications
     */
    _refluttersdkPlugin.listener((data) {
      print("Deeplink Data :: $data") ;
      var deeplinkData = jsonDecode(data);
      var customParams = deeplinkData['customParams'];
      setState(() {
        screenName = jsonDecode(customParams)['screenName'];
        receivedData= jsonDecode(customParams)['data'];
      });
      screenNavigator(screenName,receivedData);
    });

  }

 /**
  * APP SCREEN NAVIGATER 
  */
  screenNavigator(var screenName,var data){
    switch(screenName){

      case "Carrier":{
        if(data!=null){

          Navigator.pushNamed(context, '/Carrier',arguments: data);
        }
        else
          Navigator.pushNamed(context, '/Carrier');
        break;
      }
      case "Certification":{

        if(data!=null){
          Navigator.pushNamed(context, '/Certification',arguments: data);
        }
        else
          Navigator.pushNamed(context, '/Certification');
        break;
      }

      default:{
        print("ScreenName is not defined!!!");
      }
    }

  }


initializeSharedPreference() async {
  shared = await SharedPreferences.getInstance();
  deeplinkHandler();
}


  @override
   initState(){
    super.initState();
    initializeSharedPreference();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Call the system service here
      _refluttersdkPlugin.screentracking("DashboardPage",context);
    });

  }

  

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return true;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu,color: Colors.black),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
        title: Row(
          children: [
          Text("Farook Vision",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
         Container(
           color: Colors.transparent,
           child:  SizedBox(
             height: 20,
             width: 160,
           ),
         ),
          Stack(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => NotificationPage()));
                  },
                  child:Icon(Icons.notifications,color: Colors.black,)
              ),
            ],
          )

        ],),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,

      ),
      body:Container(
        child: (
            SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child:Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10,10,10,0),
                        height: 250,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: Offset(0.0,0.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child:Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.fromLTRB(0,40,0,0),
                              child: CircleAvatar(
                                radius:40.2,
                                  backgroundColor: Colors.white,
                                  child:Image.asset("assets/farook_3.png",height:70,width: 70,)
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.fromLTRB(0,10,0,0),
                              child:Column(
                                children: [
                                  Text("farook@gmail.com",style: TextStyle(color:Colors.black,fontSize: 20.2),),
                                 // Text(shared.getString("userId").toString(),style: TextStyle(color:Colors.white,fontSize: 20.2))
                                ],
                              )
                            )

                          ],
                        ) ,
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(20,10,20,10),

                        child: Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              shadowColor: Colors.black12,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0,),),
                              minimumSize: Size(40, 40), //////// HERE
                            ),

                            onPressed: () async {
                              _refluttersdkPlugin.locationUpdate(13.0827, 80.2707);
                          }, child: Text("Location update",style: TextStyle(color: Colors.black),),

                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(20,10,20,10),

                        child: Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              shadowColor: Colors.black12,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0,),),
                              minimumSize: Size(40, 40), //////// HERE
                            ),
                            onPressed: ()
                           {

                           if (kIsWeb) {
                           _refluttersdkPlugin.customEvent("Payment");

                           var data = { 'eventName': 'Website Open', 'eventData': 'Viewed Groceries', 'pId':123, 	};
                           	_refluttersdkPlugin.customEventWithData(data);
                           }
                           else{
                             var eventData = {
                               "name": "payment",
                               "data": {"id": "6744", "price": "477"}
                             };
                             _refluttersdkPlugin.customEventWithData(eventData);
                           }



                          }, child: Text("Custom event",style: TextStyle(color: Colors.black),),

                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(20,10,20,10),
                        child: Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              shadowColor: Colors.black12,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0,),),
                              minimumSize: Size(40, 40), //////// HERE
                            ),
                            onPressed: () {
                            _refluttersdkPlugin.appConversion();
                          }, child: Text("App conversation tracking",style: TextStyle(color: Colors.black),),

                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(20,10,20,10),
                        child: Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              shadowColor: Colors.black12,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0,),),
                              minimumSize: Size(40, 40), //////// HERE
                            ),
                            onPressed: () async {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => const Certification()));
                          }, child: Text("About",style: TextStyle(color: Colors.black),),

                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(20,10,20,10),

                        child: Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              shadowColor: Colors.black12,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0,),),
                              minimumSize: Size(40, 40), //////// HERE
                            ),
                            onPressed: () async {
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(builder: (context) => const Carrier()));
                            Navigator.of(context).pushNamed('/Carrier?resulid=OCtMHxLM218V058UF9ENEMyOTY5QXwxSg==&utm_source=SmartDx&utm_medium=wp&utm_campaign=RH_WEB_ET_CHECK_K3m');
                          }, child: Text("Form",style: TextStyle(color: Colors.black),),

                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(20,10,20,10),
                        child: Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              shadowColor: Colors.black12,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0,),),
                              minimumSize: Size(40, 40), //////// HERE
                            ),
                            onPressed: () async {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => const NotificationPage()));
                          }, child: Text("Notification list",style: TextStyle(color: Colors.black),),

                          ),
                        ),
                      ),
                    ],
                  )
              ),
            )
        ),
      ),

     endDrawer: MyNavigator()

    ),
    );
  }
}


















