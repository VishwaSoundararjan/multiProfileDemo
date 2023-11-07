import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:refluttersdk/refluttersdk.dart';

import '../cutom_Widgets/dashboard_widget.dart';
import '../user_ram/dashboard1.dart';
import '../user_ram/mynavigator1.dart';
import '../user_ram/notification1.dart';

class VehicleLoan extends StatefulWidget {
  const VehicleLoan({Key? key}) : super(key: key);

  @override
  State<VehicleLoan> createState() => _VehicleLoanState();
}

class _VehicleLoanState extends State<VehicleLoan> {
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
        SingleChildScrollView(
          child: Column(
            children:[
              Padding(
                padding: EdgeInsets.fromLTRB(20.w,20.h,20.w,0),
                child: Container(

                  // height:kIsWeb ? 1400.h : 330.h,
                  width: kIsWeb ? 1400.w : 350.w,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10.w),
                  //   color: Colors.white,
                  //   boxShadow: const [
                  //     BoxShadow(
                  //       //color: kIsWeb ?  Colors.white10 :  Colors.black38,
                  //       blurRadius: kIsWeb ?0.0 : 0.0,
                  //       spreadRadius: kIsWeb ? 0.0 : 0.0,
                  //       offset: Offset(0.0,0.0), // shadow direction: bottom right
                  //     )
                  //   ],
                  //   border: Border.all(
                  //     color: DataClass.uiColor,
                  //   ),
                  // ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/vehicleLoan.png",fit: BoxFit.fitWidth,),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w,40.h,20.w,0),
                child: Container(
                  // height: kIsWeb ? 150.h :300.h,
                  width: kIsWeb ? 1400.w:350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.h),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0,0.0), // shadow direction: bottom right
                      ),
                    ],
                    border: Border.all(
                      color: DataClass.uiColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.w,15.h,10.w,0),
                        child:   Row(
                          children: [
                            Text("Vehicle Loan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.w),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.w,5.h,10.w,0),
                        child:   Row(
                          children: [
                            SizedBox(
                              height: 2.h,width: 50.w,
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.w,20.h,20.w,0),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: ReadMoreText(
                                      "Enjoy competitive interest rates on your vehicle loan. Our app provides "
                                      "transparent information on interest rates, ensuring that you can make"
                                      " informed decisions and select a loan product that offers favorable terms and "
                                      "affordable repayments. Explore a wide range of vehicles to suit your needs."
                                      " Whether you're looking for a car, motorcycle, or commercial vehicle, our app "
                                      "offers financing options for various types of vehicles, allowing you to choose"
                                      " the one that fits your lifestyle and business requirements.",
                                  trimLines: 15,
                                  colorClickableText: Colors.pink,
                                  trimMode: TrimMode.Line,
                                  // trimCollapsedText: 'Read more',
                                  // trimExpandedText: 'Read less',
                                  moreStyle: TextStyle(fontSize: 14.w, fontWeight: FontWeight.bold,color: Colors.blue),
                                  lessStyle: TextStyle(fontSize: 14.w, fontWeight: FontWeight.bold,color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),),

                      // Padding(
                      //     padding: EdgeInsets.fromLTRB(10,40,10,10),
                      //     child: Container(
                      //       child: ElevatedButton(
                      //         style: ElevatedButton.styleFrom(
                      //           backgroundColor: Colors.lightBlue,
                      //           shadowColor: Colors.black12,
                      //           elevation: 3,
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(10.0)),
                      //           minimumSize: Size(350, 55), //////// HERE
                      //         ),
                      //         onPressed: (){
                      //         },
                      //         child:
                      //         Text('Read More',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                      //       ),
                      //     )
                      // ),
                      SizedBox(height: 10.h,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: kIsWeb ? 20.h : 20.h,
              )
            ],
          ),
        ),
        endDrawer: MyNavigator1(),
      ),
    );
  }
}
