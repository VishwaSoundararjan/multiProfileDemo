import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:visioneducation/user_ram/dashboard1.dart';
import 'package:visioneducation/user_ram/mynavigator1.dart';
import 'package:visioneducation/user_ram/notification1.dart';

import 'cutom_Widgets/dashboard_menu_widget.dart';
import 'cutom_Widgets/dashboard_widget.dart';

final _refluttersdkPlugin = Refluttersdk();
class Recharge extends StatefulWidget {
  const Recharge({Key? key}) : super(key: key);

  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {

  var ads_array= DataClass.rechargeData;
  @override
  initState(){
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Call the system service here
    //   _refluttersdkPlugin.screentracking("DashboardPage1");
    // });
    _refluttersdkPlugin.screentracking("DashboardPage1",context);
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
      child:Scaffold(
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
            title:Row(
              children: [
                Image.asset(DataClass.visionLogo,height: 150.h,width: 150.w,),
              ],),
            backgroundColor:DataClass.uiColor,//
            automaticallyImplyLeading: false,

          ),
          body:
          Container(
            child:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h,),
                    Text("Recharge",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0.h),),
                  SizedBox(height: 10.h,),
                 Container(
                   decoration: BoxDecoration(
                       //color: Colors.black12,
                       border: Border.all(
                         color: DataClass.uiColor,

                       ),
                       borderRadius: BorderRadius.all(Radius.circular(10.h))
                   ),
                   //margin: EdgeInsets.fromLTRB(15.w,0,15.w,0),
                   // height: 210.h,
                   width: 400.w,
                   child: Column(
                     children: [
                       GridViewWidget(ads_list: this.ads_array),
                       Padding(
                         padding: EdgeInsets.all(12.w),
                         child: TextField(
                           onTap: (){},
                           style: TextStyle(color: Colors.black),
                           keyboardType: TextInputType.number,
                           decoration: InputDecoration(
                             hintText: 'Mobile Number',
                             suffixIcon: Icon(Icons.search,
                                 color: Colors.black54),
                             enabledBorder: UnderlineInputBorder(
                                 borderSide: BorderSide(
                                   color: Colors.black54,
                                 )),

                             hintStyle: TextStyle(
                                 color: Colors.black54,
                                 fontSize: 16.w),
                           ),
                           obscureText: true,
                         ),
                       ),
                       SizedBox(
                         height: 15.h,
                       )
                     ],
                   ),
                 ),
                  Padding(
                    padding:
                    EdgeInsets.fromLTRB(0.w, 7.h, 0.w, 0.h),
                    child: Container(
                      height: 50.h,
                      //height of button
                      width: double.infinity,
                      //width of button equal to parent widget
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:DataClass.uiColor, //
                              padding: EdgeInsets.all(
                                  0.0) //content padding inside button
                          ),
                          onPressed: () {

                          },
                          child: Text("Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.w))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          endDrawer: MyNavigator1(),

      ),
    );;
  }
}



class GridViewWidget extends StatefulWidget {
  GridViewWidget({
    required this.ads_list,
  });
  final List ads_list;
  late var  ads_image;
  late var ads_title;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10.h,0,0,),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            shrinkWrap: true,
            children: List.generate(widget.ads_list.length, (index) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(widget.ads_list[index]['path']);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0,17.h,0,0),
                  child: Column(
                    children:  [
                      Image.asset(widget.ads_list[index]['image'],height: 40.h,width: 40.w,),
                      SizedBox(height: 10.h,),
                      Text(widget.ads_list[index]['title'])
                    ],
                  ),
                ),
              );
            }
            ),
          ),

        ],
      ),
    );
  }
}




class QuickAccessWidget extends StatefulWidget {
  QuickAccessWidget({
    required this.ads_list,
  });
  final List ads_list;
  late var  ads_image;
  late var ads_title;
  @override
  State<QuickAccessWidget> createState() => _QuickAccessWidgetState();
}

class _QuickAccessWidgetState extends State<QuickAccessWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quick Access", style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17.w),),
          SizedBox(height: 10.w,),
          Container(
            height: 85.h,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children:
                    List.generate(widget.ads_list.length, (index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed(widget.ads_list[index]['path']);
                      },
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(3.w,0,3.w,0),
                          child: Row(
                            children: [
                              Container(
                                width: 65.w,
                                margin:EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(

                                  children:  [
                                      Container(
                                        height:45.h,
                                        width: 55.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.h),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 1.0,
                                              spreadRadius: 0.0,
                                              offset: Offset(0.0,0.0), // shadow direction: bottom right
                                            )
                                          ],
                                        ),
                                          child: Center(
                                              child: Image.asset(widget.ads_list[index]['image'],height: 35.h,width: 35.w,)),
                                      ),
                                    SizedBox(height: 10.h,),
                                    Flexible(child: Column(
                                      children: [
                                        Text(widget.ads_list[index]['title'],style: TextStyle( fontSize: 12.w),textAlign: TextAlign.center,),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              // SizedBox(width: 20.h,)
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  )
                  ),
                ],
              ),
            ),
    ),
        ],
      )
    );
  }
}

