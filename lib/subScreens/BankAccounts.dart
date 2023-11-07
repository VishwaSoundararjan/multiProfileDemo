import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refluttersdk/refluttersdk.dart';

import '../cutom_Widgets/dashboard_widget.dart';
import '../user_ram/notification1.dart';

class BankAccount extends StatefulWidget {
  const BankAccount({Key? key}) : super(key: key);

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {

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

    return Scaffold(
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
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bank Account"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
