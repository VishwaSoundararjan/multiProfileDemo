import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:visioneducation/dashboard.dart';
import 'package:visioneducation/user_ram/dashboard1.dart';
import 'package:visioneducation/user_ram/mynavigator1.dart';
import 'package:visioneducation/user_ram/notification1.dart';
import '../cutom_Widgets/dashboard_widget.dart';


class Sampleform extends StatefulWidget {
  const Sampleform({Key? key}) : super(key: key);

  @override
  State<Sampleform> createState() => _SampleformState();
}

final _refluttersdkPlugin=Refluttersdk();

class _SampleformState extends State<Sampleform> {

  late String name;
  late String mobile;
  late String email;
  late String city;
  late String age;
  late String gender;

  int gendervalue=0;

  bool conditionagreed=false;
  bool value = false;
  bool nametextAlert=false;
  bool mobiletextAlert=false;
  bool emailtextAlert=false;
  bool citytextAlert=false;
  bool agetextAlert=false;
  bool gendermale=false;
  bool genderfemale=false;

  String dropdownvalue = 'B.Sc';
  String formId="112";
  String apiKey="api_key_b78db6b3-9462-4132-a4d3-894db10b3782";

  final name_controller=TextEditingController();
  final mobile_contoller=TextEditingController();
  final email_controller=TextEditingController();
  final city_contoller=TextEditingController();
  final age_controller=TextEditingController();


  var items = [
    'B.Sc',
    'M.Sc',
    'BCA',
    'MCA',
    'BE',
  ];

  formdataCapture() {

    Map formData = {
      "Name": name,
      "EmailID": email,
      "MobileNo": mobile,
      "Gender": gender,
      "formid": formId, // required
      "apikey": apiKey,
      "City": city // required
    };
    _refluttersdkPlugin.formDataCapture(formData);
  }

  var unreadNotificationcount=0;
  setUnreadNotificationCount() async{
    var count= await _refluttersdkPlugin.getUnReadNotificationCount();
    setState(() {
      unreadNotificationcount=count!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refluttersdkPlugin.appConversion();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Call the system service here
    //   _refluttersdkPlugin.screentracking("SampleformPage");
    // });_refluttersdkPlugin.screentracking("SampleformPage");
    setUnreadNotificationCount();
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
          automaticallyImplyLeading: false,
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
            //   Container(
            //     color: Colors.transparent,
            //     child:  SizedBox(
            //       height: 20.h,
            //       width: 110.w,
            //     ),
            //   ),
            // Stack(
            //   children: [
            //     GestureDetector(
            //         onTap: (){
            //           Navigator.pushReplacement(context,
            //               MaterialPageRoute(builder: (context) => NotificationPage1()));
            //         },
            //         child:Icon(Icons.notifications)
            //     ),
            //
            //     // unreadNotificationcount>0? Positioned(
            //     //   top: 1,
            //     //   right: 2,
            //     //   left: 9,
            //     //   child: Container(
            //     //     height: 13,
            //     //     width: 20,
            //     //     decoration: BoxDecoration(color: unreadNotificationcount>0 ? Colors.redAccent : Colors.transparent,
            //     //         borderRadius: BorderRadius.circular(12.0)
            //     //     ),
            //     //
            //     //     child: Row(
            //     //       mainAxisAlignment: MainAxisAlignment.center,
            //     //       children:  <Widget>[
            //     //         Text("${unreadNotificationcount}",style: TextStyle(fontSize: 10.0),),
            //     //       ],
            //     //     ),
            //     //   ),
            //     // ):Container(),
            //   ],
            // )
          ],),
          backgroundColor: DataClass.uiColor,

        ),

        body: Scaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Container(
                //height: 00.h,
                //color: DataClass.uiColor,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.w,0,10.w,0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.w),
                    border: Border.all(width: 1,color: DataClass.uiColor),
                  ),
                  margin: EdgeInsets.fromLTRB(30.w,30.h,30.w,30.h),
                  //height: 650.h,
                  width:double.infinity,
                  child:(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(5.w, 10.h, 0, 0),
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("Your Name",style: TextStyle(color: Colors.black,fontSize: 17.w,fontWeight: FontWeight.bold,),),
                                  Container(
                                    height: 30.h,
                                    width: 300.w,
                                    margin: EdgeInsets.fromLTRB(0,5.h,0,0),
                                    // decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //       color: DataClass.uiColor,
                                    //     ),
                                    //     borderRadius: BorderRadius.all(Radius.circular(20))
                                    // ),

                                    child:  Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                           padding:EdgeInsets.fromLTRB(0,0,0,0) ,
                                            child: TextField(
                                              onTap: (){
                                                setState(() {
                                                });
                                              },
                                              controller: name_controller,
                                              style: TextStyle(color: Colors.black),
                                              keyboardType: TextInputType.name,
                                              decoration:
                                              InputDecoration(
                                                suffixIcon: nametextAlert?  Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ) : null,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.w)
                                                ),
                                                ),
                                            ),
                                          ),

                                        ),
                                      ],
                                    )
                                  )
                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("Your Mobile ",style: TextStyle(color: Colors.black,fontSize: 17.w,fontWeight: FontWeight.bold,),),
                                Container(
                                  height: 30.h,
                                  width: 300.w,
                                  margin: EdgeInsets.fromLTRB(0,5.h,0,0),
                                  child:  Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          onTap: (){
                                            setState(() {
                                            });
                                          },
                                          controller: mobile_contoller,
                                          style: TextStyle(color: Colors.black),
                                          keyboardType: TextInputType.phone,
                                          decoration:
                                          InputDecoration(
                                            suffixIcon: mobiletextAlert?  Icon(
                                              Icons.error,
                                              color: Colors.red,
                                            ) : null,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.w)
                                            ),
                                              //errorText:mobiletextAlert?"Enter valid number" : null,
                                          ),
                                        ),

                                      ),
                                    ],
                                  ),
                                )

                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("Your Email",style: TextStyle(color: Colors.black,fontSize: 17.w,fontWeight: FontWeight.bold,),),
                                 Container(
                                   height: 30.h,
                                   width: 300.w,
                                   margin: EdgeInsets.fromLTRB(0,5.h,0,0),

                                   child: Flex(
                                     direction: Axis.horizontal,
                                     children: [
                                       Expanded(
                                         child: TextField(
                                           onTap: (){
                                             setState(() {
                                             });
                                           },
                                           controller: email_controller,
                                           style: TextStyle(color: Colors.black),
                                           keyboardType: TextInputType.emailAddress,
                                           decoration:
                                           InputDecoration(
                                             suffixIcon: emailtextAlert?  Icon(
                                               Icons.error,
                                               color: Colors.red,
                                             ) : null,
                                               //errorText:emailtextAlert?"Enter valid mail" : null,
                                             border: OutlineInputBorder(
                                                 borderRadius: BorderRadius.circular(10.w)
                                             ),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 )

                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("Your City",style: TextStyle(color: Colors.black,fontSize: 17.w,fontWeight: FontWeight.bold,),),
                                  Container(
                                    height: 35.h,
                                    width: 190.w,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding:EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              onTap: (){
                                                setState(() {
                                                });
                                              },
                                              controller: city_contoller,
                                              style: TextStyle(color: Colors.black),
                                              keyboardType: TextInputType.text,
                                              decoration:
                                              InputDecoration(
                                                suffixIcon: citytextAlert?  Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ) : null,
                                                //hintText: '  city',
                                                // contentPadding: EdgeInsets.symmetric(vertical: 5),enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.w)
                                                ),
                                              ),
                                            ),

                                          ),
                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("Your Gender",style: TextStyle(color: Colors.black,fontSize: 17.w,fontWeight: FontWeight.bold,),),
                                  Padding(
                                    padding:EdgeInsets.fromLTRB(0, 5.w, 0, 0),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value:1,
                                            groupValue:gendervalue,
                                            onChanged: (value){
                                              setState(() {
                                                gendervalue=value!;
                                                gender="Female";
                                              });
                                            }
                                        ),
                                        Text("Female"),
                                        Radio(
                                            value: 2,
                                            groupValue:gendervalue,
                                            onChanged: (value){
                                              setState((){
                                                gendervalue=value!;
                                                gender="Male";
                                              });
                                            }
                                        ),
                                        Text("Male"),
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),

                          Padding(
                              padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("Your Age",style: TextStyle(color: Colors.black,fontSize: 17.w,fontWeight: FontWeight.bold,),),
                                 Container(
                                   height: 35.h,
                                   width: 60.w,
                                   margin: EdgeInsets.fromLTRB(0,0,0,0),
                                   decoration: BoxDecoration(

                                   ),
                                   child: Padding(
                                     padding:EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                                     child: Flex(
                                       direction: Axis.horizontal,
                                       children: [
                                         Expanded(
                                           child: TextField(
                                             onTap: (){
                                               setState(() {
                                               });
                                             },
                                             controller: age_controller,
                                             style: TextStyle(color: Colors.black),
                                             keyboardType: TextInputType.number,
                                             decoration:
                                             InputDecoration(
                                               suffixIcon: agetextAlert?  Icon(
                                                 Icons.error,
                                                 color: Colors.red,
                                               ) : null,
                                                 //errorStyle: TextStyle(),
                                                 //errorText:agetextAlert?"Enter valid input" : null,
                                                 //hintText: ' Your Age',  contentPadding: EdgeInsets.symmetric(vertical: 5),enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                               border: OutlineInputBorder(
                                                   borderRadius: BorderRadius.circular(10.w)
                                               ),
                                             ),
                                           ),

                                         ),
                                       ],
                                     ),
                                   ),
                                 )

                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("Your Qualification",style: TextStyle(color: Colors.black,fontSize: 17.w,fontWeight: FontWeight.bold,),),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10.w, 5.h, 0, 0),
                                    child:DropdownButton(

                                      // Initial Value
                                      value: dropdownvalue,

                                      // Down Arrow Icon
                                      icon: const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              )
                          ),

                          Padding(
                              padding:EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                              child:(
                                  Row(
                                    children: [
                                      Checkbox(
                                        value:conditionagreed,
                                        onChanged: (bool ?value)
                                        {
                                          setState((){
                                            conditionagreed = value!;
                                          });

                                        },
                                        activeColor: Colors.green,
                                      ),
                                      Text("I agree to the"),
                                      Text("Terms and Conditions",style:TextStyle(color: Colors.red))

                                    ],
                                  )
                              )
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DataClass.uiColor,
                              ),
                              onPressed: (){
                                setState(() {
                                  name=name_controller.text;
                                  mobile=mobile_contoller.text;
                                  email=email_controller.text;
                                  city=city_contoller.text;
                                  age=age_controller.text;
                                });
                                if(name.isNotEmpty && mobile.isNotEmpty && email.isNotEmpty && city.isNotEmpty && age.isNotEmpty && gender.isNotEmpty){
                                  formdataCapture();
                                  onTrackEventwithData();

                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => const MyAppp1()));
                                }
                                else
                                {
                                  setState((){
                                    nametextAlert=true;
                                    mobiletextAlert=true;
                                    emailtextAlert=true;
                                    citytextAlert=true;
                                    agetextAlert=true;
                                  });
                                }
                              },
                              child: Text("Submit",style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      )
                  ),
                ),
              ),


            ),
          ),
        ),
        endDrawer: MyNavigator1(),
      ),
    );
  }

  onTrackEventwithData() {
    var data = {
      "name": "payment",
      "data": {"id": "6744", "price": "477"}
    };
    String eventData = jsonEncode(data);
    _refluttersdkPlugin.customEvent(eventData);
  }

}
