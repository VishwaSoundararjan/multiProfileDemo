import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:visioneducation/recharge.dart';
import 'package:visioneducation/user_ram/dashboard1.dart';
import 'package:visioneducation/user_ram/mynavigator1.dart';
import 'package:visioneducation/user_ram/notification1.dart';

import 'cutom_Widgets/dashboard_widget.dart';


class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => CardPageState();
}

class CardPageState extends State<CardPage> {

  var cardPageData=DataClass.cardPageData;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Refluttersdk().screentracking("AccountPage", context);
    });
    Future<bool> _onWillPop() async {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MyAppp1()));
      return false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) =>(
                  Row(
                    children: [
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
                      ),
                      IconButton(
                        icon: Icon(Icons.menu,color: Colors.white),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      ),
                    ],
                  )
              ),
            ),
          ],
          title: Row(
            children: [
              Image.asset(DataClass.visionLogo,height: 150.h,width: 150.w,),
            ],),
          backgroundColor: DataClass.uiColor, //
          automaticallyImplyLeading: false,

        ),
        body:
        Container(

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                Text("Cards", style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17.w),),
                SizedBox(height: 10.h,),
                Container(
                  decoration: BoxDecoration(
                      //color: Colors.black12,
                      border: Border.all(
                        color: DataClass.uiColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  //margin: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                  width: 400.w,
                  child: Column(
                    children: [
                      GridViewWidget(ads_list: this.cardPageData),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        endDrawer: MyNavigator1(),
      ),
    );
  }
}
