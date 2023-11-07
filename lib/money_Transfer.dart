import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:visioneducation/recharge.dart';
import 'package:visioneducation/user_ram/dashboard1.dart';
import 'package:visioneducation/user_ram/mynavigator1.dart';
import 'package:visioneducation/user_ram/notification1.dart';

import 'cutom_Widgets/dashboard_widget.dart';

class MoneyTransfer extends StatefulWidget {
  const MoneyTransfer({Key? key}) : super(key: key);

  @override
  State<MoneyTransfer> createState() => _MoneyTransferState();
}

class _MoneyTransferState extends State<MoneyTransfer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Refluttersdk().screentracking("AccountPage", context);
    });
  }
  @override
Widget build(BuildContext context) {

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
                Text("Fund Transfer", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17.0.w),),
                SizedBox(height: 10.h,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(
                        color: DataClass.uiColor,

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.w))
                  ),
                  //margin: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                  padding: EdgeInsets.fromLTRB(10.w,10.h,0,0),
                  height: 100.h,
                  width: 400.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.fromLTRB(10.w, 0, 15.w, 10.h),
                        child: Text("From",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.w, 0, 15.w, 10.h),
                        child: Text("Savings******10343", style: TextStyle(fontWeight:FontWeight.bold),),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.w, 0, 15.w, 0),
                        child: Text("Balance \$92292"),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
               Text("To", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0.h),),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w,0,0.w,0),
                  child: TextField(
                    onTap: (){},
                    style: TextStyle(color: Colors.black),

                    decoration: InputDecoration(
                      hintText: 'Enter Payee Name',
                      suffixIcon: Icon(Icons.search,
                          color: Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0),
                    ),
                    keyboardType:
                    TextInputType.text,
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.fromLTRB(0.h, 0, 0, 0),
                  child: SizedBox(
                    height: 50.h,
                    //height of button
                    width: double.infinity,
                    //width of button equal to parent widget
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Text(
                            "ADD"
                          ,style: TextStyle(fontSize: 12.0.h,color: Colors.indigo,fontWeight: FontWeight.bold),),

                        ),
                        Text(" / "),
                        GestureDetector(
                          child: Text(
                              "MANAGE PAYEES"
                            ,style: TextStyle(fontSize: 12.0.h,color: Colors.indigo,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    )
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
