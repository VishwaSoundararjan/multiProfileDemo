import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import 'package:refluttersdk/refluttersdk.dart';
import '../cutom_Widgets/dashboard_widget.dart';
import 'dashboard1.dart';
import 'mynavigator1.dart';
import 'notification1.dart';


class Certification1 extends StatefulWidget {

const Certification1({Key? key}) : super(key: key);
 @override
  State<Certification1> createState() => _Certification1State();
}

final _reflutterSdk=Refluttersdk();

class _Certification1State extends State<Certification1> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Call the system service here
    //   _reflutterSdk.screentracking("Certification1Page");
    // });
    _reflutterSdk.screentracking("Certification1Page",context);
    _locationUpdate();
 }

  _locationUpdate() async {
   _reflutterSdk.locationUpdate(13.0827,80.2707);
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

          title:Row(
            children: [
              Image.asset(DataClass.visionLogo,height: 150.h,width: 150.w,),
          ],),
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
          backgroundColor: DataClass.uiColor,
          automaticallyImplyLeading: false,

        ),
        body:SingleChildScrollView(
          child: Column(
            children:[

              Padding(
                padding: EdgeInsets.fromLTRB(20.w,20.h,20.w,0),
                child: Container(

                  width: kIsWeb ? 1400.w:350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: Colors.white,
                    boxShadow:  [
                      BoxShadow(
                        color: DataClass.uiColor,
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
                            Text("Mr.Dakshen - Head of Product & Strategies",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.w),),
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
                            direction: Axis.horizontal, // or Axis.horizontal
                            children: [
                              Expanded(
                                child: ReadMoreText(
                                  "A head of product focuses on aligning a company’s product strategy with the overall business strategy."
                                      " This individual is also responsible for managing the product development team.As the head of product, "
                                      "your primary function is to ensure the company’s products meet the needs of its customers. To do this,"
                                      " you’ll likely have to work closely with multiple departments throughout the company.For instance, the "
                                      "head of product is often closely involved in marketing efforts to ensure the customers understand the full"
                                      " range of the product’s benefits. They may also be involved in the design and engineering process.",
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
                      SizedBox(
                        height: 10.h,
                      )
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w,20.h,20.w,0),
                child: Container(
                  height:kIsWeb ? 400.h : 330.h,
                  width: kIsWeb ? 1400.w : 350.w,
                  decoration: BoxDecoration(
                    borderRadius: kIsWeb ? BorderRadius.circular(10.w) : BorderRadius.circular(10.w) ,
                     color: Colors.white,
                    boxShadow:  [
                      BoxShadow(
                        color: kIsWeb ?  Colors.white10 :  DataClass.uiColor,
                        blurRadius:  kIsWeb ?  1.0 : 0.0,
                        spreadRadius:  kIsWeb ?  0.0 : 0.0,
                        offset: Offset(0.0,0.0), // shadow direction: bottom right
                      )
                    ],
                    border: Border.all(
                      color: DataClass.uiColor,
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      // child: Image.asset("assets/pro_owner.png",fit: BoxFit.fitWidth,)
                      child: kIsWeb ? Image.asset("assets/pro_owner.png",height: 100.h,width: 100.w,) : Image.asset("assets/pro_owner.png",fit: BoxFit.fitWidth),
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
