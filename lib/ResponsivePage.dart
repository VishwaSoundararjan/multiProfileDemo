import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visioneducation/recharge.dart';
import 'package:visioneducation/sampleforms.dart';
import 'package:visioneducation/subScreens/ScanToPay.dart';
import 'package:visioneducation/user_ram/carrier1.dart';
import 'package:visioneducation/user_ram/certification1.dart';
import 'package:visioneducation/user_ram/dashboard1.dart';
import 'package:visioneducation/user_ram/mynavigator1.dart';
import 'package:visioneducation/user_ram/notification1.dart';
import 'package:visioneducation/user_ram/postgraduaction1.dart';

import 'addPayee.dart';
import 'billPay.dart';
import 'certification.dart';
import 'cutom_Widgets/dashboard_menu_widget.dart';
import 'cutom_Widgets/dashboard_userInfo_widget.dart';
import 'cutom_Widgets/dashboard_widget.dart';
import 'money_Transfer.dart';


class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) => MaterialApp(
        routes: {
          '/Carrier?resulid=OCtMHxLM218V058UF9ENEMyOTY5QXwxSg==&utm_source=SmartDx&utm_medium=wp&utm_campaign=RH_WEB_ET_CHECK_K3m': (BuildContext ctx) => const Carrier1(),
          "/Certification1": (BuildContext ctx) => const Certification1(),
          "/Certification": (BuildContext ctx) => const Certification(),
          "/carrier":(BuildContext ctx) => const Carrier1(),
          "/Graduation" : (BuildContext ctx) => const PostGraduation1(),
          "/Dashboard" : (BuildContext ctx) => const MyAppp1(),
          "/AddPayee" : (BuildContext ctx) => const AddPayee(),
          "/BillPay" : (BuildContext ctx) => const BillPay(),
          "/MoneyTransfer" : (BuildContext ctx) => const ScanToPay(),
          "/ScanToPay" : (BuildContext ctx) => const MoneyTransfer(),
          "/Recharge" : (BuildContext ctx) => const Recharge(),
          "/Sampleform" : (BuildContext ctx) => const Sampleform(),
        },

        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SamplePage(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(360,640),
    );
  }
}

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}
final _refluttersdkPlugin = Refluttersdk();
class _SamplePageState extends State<SamplePage> {

  var array= DataClass.dashboardButtons;
  var ads_array=DataClass.dashboardAdsData;
  late var navigationParameter;
  late var screenName;
  late var receivedData;
  late SharedPreferences shared;
  late var userName;

  deeplinkHandler(){

    /*
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
    _refluttersdkPlugin.screentracking("DashboardPage1",context);
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
                icon: Icon(Icons.menu,color: Colors.white),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ],
          title: Row(
            children: [
              Image.asset(DataClass.visionLogo,height: 150.h,width: 150.w,),
              Container(
                color: Colors.transparent,
                child:  SizedBox(
                  height: 20.h,
                  width: 105.w,
                ),
              ),
              Stack(
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => NotificationPage1()));
                      },
                      child:Icon(Icons.notifications,color: Colors.white,)
                  ),
                ],
              )

            ],),
          backgroundColor: DataClass.uiColor,//
          automaticallyImplyLeading: false,

        ),
        body:
        Container(
          child: (
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UserInfoWidget(user_Name: DataClass.userName, user_AccountNo: "*******2212", user_Logo: "l", user_amount: "28292.00", id: "32", background_Color: "blue"),

                        Container(
                          margin: EdgeInsets.fromLTRB(0,7.h,0,0),
                          color: Colors.black12,
                          child:SizedBox(width: 330.h,height: 2.5.h,),
                        ),
                        array.length==6?
                        Container(
                          //color: Colors.black,
                          width: 325.h,
                          child:
                          GridView.count(
                            primary: false,
                            padding: EdgeInsets.fromLTRB(12.w,15.h,0,0),
                            crossAxisCount: 3,
                            crossAxisSpacing: 0.h,
                            mainAxisSpacing: 0.0,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            children: List.generate(array.length, (index) {
                              return  Wrap(
                                // alignment: WrapAlignment.center,
                                // crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  ButtonWidget(
                                    widget_Image: array[index]['image'],
                                    widget_Title: array[index]['title'].toString(),
                                    widget_Type: "button",
                                    routing_Path: array[index]['path'],
                                    id: array[index]['id'].toString(),
                                  ),
                                ],
                              );
                            }
                            ),
                          ),

                        ):Container(
                          // width: 360,
                          // height: 250,
                          margin: EdgeInsets.fromLTRB(0,7.h,0,0),
                          padding: EdgeInsets.fromLTRB(20.h,0,0,0),
                          child:
                          GridView.count(
                            primary: false,
                            padding: EdgeInsets.fromLTRB(30.h,13.h,30.h,0),
                            crossAxisCount: 2,
                            crossAxisSpacing: 30.h,
                            mainAxisSpacing: 0.0,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            children: List.generate(array.length, (index) {
                              return  Wrap(
                                children: [
                                  ButtonWidget(
                                    widget_Image: array[index]['image'],
                                    widget_Title: array[index]['title'].toString(),
                                    widget_Type: "button",
                                    routing_Path: array[index]['path'],
                                    id: array[index]['id'].toString(),
                                  ),
                                ],
                              );
                            }
                            ),
                          ),

                        ),
                        Container(
                          height: 110.h,
                          width: 340.h,
                          padding: EdgeInsets.fromLTRB(5.h,10.h,5.h,0),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5.h),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(DataClass.banner)
                            ),
                          ),

                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,7.h,0,0),
                          color: Colors.black12,
                          child:SizedBox(width: 330.h,height: 2.h,),
                        ),
                        Container(
                          child: AdsWidget(ads_list:this.ads_array,),
                        ),

                      ],
                    ),
                  ),
                ),
              )
          ),
        ),
        endDrawer: MyNavigator1(),

      ),
    );
  }
}

