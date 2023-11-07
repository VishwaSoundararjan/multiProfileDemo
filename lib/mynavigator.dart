import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:visioneducation/carrier.dart';
import 'package:visioneducation/dashboard.dart';
import 'package:visioneducation/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visioneducation/userIdentifier.dart';
import 'certification.dart';



class MyNavigator extends StatefulWidget {
  const MyNavigator({Key? key}) : super(key: key);

  @override
  State<MyNavigator> createState() => _MyNavigatorState();
}

final _refluttersdkPlugin=Refluttersdk();
class _MyNavigatorState extends State<MyNavigator> {

  late SharedPreferences logindata;
  late String username;


  var logButtonStatus=false;
  var unreadNotificationcount=0;

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

             UserAccountsDrawerHeader(accountName: Text("farook@gmail.com"), accountEmail: Text(""),
             currentAccountPicture: CircleAvatar(
               radius:2.5,
                 backgroundColor: Colors.white,
                 child:Image.asset("assets/farook_3.png",height:70,width: 70,)
             ),

              ),

          ListTile(
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashboardPage(title: 'VisionEducation',)));
            },
          ),

          
          ListTile(
            title: const Text("About"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Certification()));
            },
          ),
          ListTile(
            
            title: const Text('Form'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Carrier()));
            },
          ),
          ListTile(
           
            title: Text("Logout"),
            onTap: () {
              setLogOUt();
              UserIdentifier.clearUserData();
              // handleLogout(context);
              //DefaultCacheManager().emptyCache();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyLoginPage()));

            },
          ),
        ],
      ),
    );
  }
  void handleLogout(BuildContext context) {
    // Use pushAndRemoveUntil to remove all previous routes from the stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyLoginPage()),
          (route) => false,
    );
  }
  setLogOUt(){
    logindata.setBool('login',false);
    if(kIsWeb) {
      DefaultCacheManager().emptyCache();
    }
  }
}