import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visioneducation/main.dart';

import '../loginpage.dart';
import 'dashboard_widget.dart';

class UserInfoWidget extends StatefulWidget {

  final String user_Name;
  final String user_AccountNo;
  final String user_Logo;
  final String user_amount;
  final String id;
  final String background_Color;

  UserInfoWidget({
    required this.user_Name,
    required this.user_AccountNo,
    required this.user_Logo,
    required this.user_amount,
    required this.id,
    required this.background_Color
  });

  @override
  _UserInfoWidgetState createState() => _UserInfoWidgetState();

}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:DataClass.userName=="Ram"? Container(
        margin: EdgeInsets.fromLTRB(0,7.h,0,0),
        height: 145.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          color: DataClass.uiColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(0.0,0.0), // shadow direction: bottom right
            )
          ],
        ),
        child:Column(
          children: [
            Padding(
              padding:EdgeInsets.fromLTRB(0,7.h,0,0),
              child: CircleAvatar(
                  radius:27.h,
                  backgroundColor: Colors.white,
                  child:Image.asset("assets/ram_profile.png",height:47.h,width: 47.h,),
              ),
            ),
            Padding(
                padding:EdgeInsets.fromLTRB(0,7.h,0,0),
                child:Column(
                  children: [
                    Text("Welcome ${widget.user_Name}",style: TextStyle(color:Colors.white,fontSize: 15.h),),
                    Text("\$ ${widget.user_amount}",style: TextStyle(color:Colors.white,fontSize: 17.h,fontWeight: FontWeight.bold),),
                    Text("Savings *******${widget.user_AccountNo}",style: TextStyle(color:Colors.white,fontSize: 15.h),),
                  ],
                )
            )

          ],
        ) ,
      ):
      Container(
          margin: EdgeInsets.fromLTRB(0,7.h,0,0),
          height: 125.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0.h),
            color: DataClass.uiColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 1.0,
                spreadRadius: 0.0,
                offset: Offset(0.0,0.0), // shadow direction: bottom right
              )
            ],
          ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              height: 160.h,
              width: 75.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius:32.h,
                      backgroundColor: Colors.white,
                      child:Image.asset("assets/ram_profile.png",height:55.h,width: 55.h,),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 170.h,
              width: 195.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome ${widget.user_Name}",style: TextStyle(color:Colors.white,fontSize: 17.h),),
                    Text("\$ ${widget.user_amount}",style: TextStyle(color:Colors.white,fontSize: 17.h,fontWeight: FontWeight.bold),),
                    Text("Savings *******${widget.user_AccountNo}",style: TextStyle(color:Colors.white,fontSize: 17.h),),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

class DrawerWidget extends StatefulWidget {

  final List drawerList;

  DrawerWidget({
    required this.drawerList,

  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  late SharedPreferences logindata;
  late String username;
 @override
  void initState() {
   super.initState();
initializeSharedPreference();

  }
  initializeSharedPreference()async{
    logindata=await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          UserAccountsDrawerHeader(accountName: Text("  Hello ${DataClass.userName}"), accountEmail: Text(""),
            decoration: BoxDecoration(
              color: DataClass.uiColor,
            ),
            currentAccountPicture: CircleAvatar(
              radius:2.5,
              backgroundColor: Colors.white,
              child:Image.asset("assets/ram_profile.png",height:70,width: 70,),
            ),

          ),
          Container(
            decoration: BoxDecoration(
              //0xFF9FA8DA
                color: DataClass.navMenuColor,
                border: Border(bottom: BorderSide(),)),
            child: ListTile(
              leading: Image.asset("assets/Home.png",height: 25,width: 25,),
              title: Text("Dashboard"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/Dashboard");
              },
            ),
          ),
          for(var index in widget.drawerList)
            Container(
              decoration: BoxDecoration(
                  color: DataClass.navMenuColor,
                  border: Border(bottom: BorderSide(),)),
              child: ListTile(
                leading: Image.asset(index["drawerList_image"],height: 25,width: 25,),
                title: Text(index["drawerList_text"]),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(index["drawerList_navigation"]);
                },
              ),
            ),
          Container(
            decoration: BoxDecoration(
              //0xFF9FA8DA
                color: DataClass.navMenuColor,
                border: Border(bottom: BorderSide(),)),
            child: ListTile(
              leading: Image.asset("assets/Logout.png",height: 25,width: 25,),
              title: Text("Logout"),
              onTap: () {
                setLogOUt();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyLoginPage()));
              },
            ),
          ),
        ],
    );
  }
  setLogOUt(){
    logindata.setBool('login',false);
    if(kIsWeb) {
      DefaultCacheManager().emptyCache();
    }
  }
}

var navigationMenuData=[
  {
    "drawerList_image":"assets/Home.png",
    "drawerList_text":"Dashboard",
    "drawerList_navigation":"/Dashboard",
    "drawerList_id": "23"
  },
  {
    "drawerList_image":"assets/about.png",
    "drawerList_text":"About",
    "drawerList_navigation":"/Certification1",
    "drawerList_id": "23"
  },
  {
    "drawerList_image":"assets/forms.png",
    "drawerList_text":"Form",
    "drawerList_navigation":"/carrier",
    "drawerList_id": "23"
  },
  {
    "drawerList_image":"assets/location.png",
    "drawerList_text":"AddPayee",
    "drawerList_navigation":"/AddPayee",
    "drawerList_id": "23"
  },
  {
    "drawerList_image":"assets/Money-Transfer.png",
    "drawerList_text":"MoneyTransfer",
    "drawerList_navigation":"/ScanToPay",
    "drawerList_id": "23"
  },
  {
    "drawerList_image":"assets/Bill Pay.png",
    "drawerList_text":"BillPay",
    "drawerList_navigation":"/BillPay",
    "drawerList_id": "23"
  },
  {
    "drawerList_image":"assets/Recharge.png",
    "drawerList_text":"Recharge",
    "drawerList_navigation":"/Recharge",
    "drawerList_id": "23"
  },
  {
    "drawerList_image":"assets/Scanpay.png",
    "drawerList_text":"ScanToPay",
    "drawerList_navigation":"/ScanToPay",
    "drawerList_id": "23"
  },

];
