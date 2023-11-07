import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:visioneducation/cutom_Widgets/dashboard_userInfo_widget.dart';
import 'package:visioneducation/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../cutom_Widgets/dashboard_widget.dart';


class MyNavigator1 extends StatefulWidget {

  MyNavigator1({Key? key}) : super(key: key);

  @override
  State<MyNavigator1> createState() => _MyNavigator1State();
}

final _refluttersdkPlugin=Refluttersdk();
class _MyNavigator1State extends State<MyNavigator1> {

  late SharedPreferences logindata;
  late String username;


  var logButtonStatus=false;
  var unreadNotificationcount=0;
  var drawerList=DataClass.navigationMenuData;
  setUnreadNotificationCount() async {
    var count= await _refluttersdkPlugin.getUnReadNotificationCount();
    setState(() {
      unreadNotificationcount=count!;
    });
  }

@override
void initState() {
    // TODO: implement initState
    super.initState();
    initializeSharedPreference();
    setUnreadNotificationCount();
  }
  initializeSharedPreference()async{
  logindata=await SharedPreferences.getInstance();
  }


  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
             // UserAccountsDrawerHeader(accountName: Text("ram@gmail.com"), accountEmail: Text(""),
             // currentAccountPicture: CircleAvatar(
             //   radius:2.5,
             //     backgroundColor: Colors.white,
             //     child:Image.asset("assets/ram_profile.png",height:70,width: 70,),
             // ),
             //
             //  ),

          DrawerWidget(drawerList: drawerList),

        ],
      ),
    );
  }

}

class NavigatorData{

  static var drawerList=[
  {
  "drawerList_image":"assets/location.png",
  "drawerList_text":"Dashboard",
  "drawerList_navigation":"/Dashboard",
  "drawerList_id": "23"
  },
  {
  "drawerList_image":"assets/location.png",
  "drawerList_text":"About",
  "drawerList_navigation":"",
  "drawerList_id": "23"
  },
  {
  "drawerList_image":"assets/location.png",
  "drawerList_text":"Form",
  "drawerList_navigation":"/carrier",
  "drawerList_id": "23"
  },

  ];
}