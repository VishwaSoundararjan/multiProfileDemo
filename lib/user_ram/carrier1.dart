import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:visioneducation/dashboard.dart';
import '../cutom_Widgets/dashboard_widget.dart';
import 'dashboard1.dart';
import 'mynavigator1.dart';
import 'notification1.dart';

class Carrier1 extends StatefulWidget {
  const Carrier1({Key? key}) : super(key: key);

  @override
  State<Carrier1> createState() => _Carrier1State();
}

final _refluttersdkPlugin=Refluttersdk();

class _Carrier1State extends State<Carrier1> {

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

  var name_key=GlobalKey();
  var mobileNO_key=GlobalKey();

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
    //   _refluttersdkPlugin.screentracking("Carrier1Page");
    // });_refluttersdkPlugin.screentracking("Carrier1Page");
    setUnreadNotificationCount();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Call the system service here
      _refluttersdkPlugin.screentracking("DashboardPage",context);
    });
}


  @override
  Widget build(BuildContext context) {
    print("Name Key: ${name_key}");
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
          title:  Row(children: [
            Image.asset(DataClass.visionLogo,height: 150,width: 150,),
            Container(
              child:  SizedBox(
                height: 20,
                  width: 138,
              ),
            ),
            Stack(
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => NotificationPage1()));
                    },
                    child:Icon(Icons.notifications)
                ),
                // unreadNotificationcount>0? Positioned(
                //   top: 1,
                //   right: 2,
                //   left: 9,
                //   child: Container(
                //     height: 13,
                //     width: 20,
                //     decoration: BoxDecoration(color: unreadNotificationcount>0 ? Colors.redAccent : Colors.transparent,
                //         borderRadius: BorderRadius.circular(12.0)
                //     ),
                //
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children:  <Widget>[
                //         Text("${unreadNotificationcount}",style: TextStyle(fontSize: 10.0),),
                //       ],
                //     ),
                //   ),
                // ):Container(),
              ],
            )
          ],),
          backgroundColor: DataClass.uiColor,

        ),

        body: Scaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 2,),
                ),
                margin: EdgeInsets.fromLTRB(10,50,10,0),
                height: 700,
                width:double.infinity,
               child:(
               Column(
                 children: [
                   Center(
                       child: (
                           Text("Apply Now",style: TextStyle(color: Colors.black,fontSize: 26.0,fontWeight: FontWeight.bold,),)
                       ),
                   ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child:Row(
                          children: [
                            Text("Name : ",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold,),),
                            Padding(
                              padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                              child:SizedBox(
                                width: 175,
                                child:  Expanded(
                                  child: TextField(
                                    key:name_key,
                                    onTap: (){
                                      setState(() {
                                      });
                                    },
                                    controller: name_controller,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.name,
                                    decoration:
                                    InputDecoration(
                                        errorStyle: TextStyle(),
                                      errorText:nametextAlert?"Enter valid input" : null,
                                        hintText: '  Your Name',  contentPadding: EdgeInsets.symmetric(vertical: 5),enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                      hintStyle: TextStyle(color: Colors.black26,fontSize: 16.0),),
                                  ),

                                ),)
                            )
                          ],
                        )
                      ),
                   Padding(
                       padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                       child:Row(
                         children: [
                           Text("Mobile : ",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold,),),
                           Padding(
                             padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                             child:   SizedBox(
                               width: 175,
                               child:  Expanded(
                                 child: TextField(
                                   key:mobileNO_key,
                                   onTap: (){
                                     setState(() {
                                     });
                                   },
                                   controller: mobile_contoller,
                                   style: TextStyle(color: Colors.black),
                                   keyboardType: TextInputType.phone,
                                   decoration:
                                   InputDecoration(
                                       errorStyle: TextStyle(),
                                       errorText:mobiletextAlert?"Enter valid number" : null,
                                       hintText: '  Mobile number',  contentPadding: EdgeInsets.symmetric(vertical: 5),enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                       hintStyle: TextStyle(color: Colors.black26,fontSize: 16.0)),
                                 ),

                               ),),
                           )

                         ],
                       )
                   ),
                   Padding(
                       padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                       child:Row(
                         children: [
                           Text("Email : ",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold,),),
                           Padding(
                               padding: EdgeInsets.fromLTRB(62, 0, 0, 0),
                             child:  SizedBox(
                               width: 175,
                               child:  Expanded(
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
                                       errorStyle: TextStyle(),
                                       errorText:emailtextAlert?"Enter valid mail" : null,
                                       hintText: '  Your mail id',  contentPadding: EdgeInsets.symmetric(vertical: 5),enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                       hintStyle: TextStyle(color: Colors.black26,fontSize: 16.0)),
                                 ),
                               ),),
                           )

                         ],
                       )
                   ),
                   Padding(
                       padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                       child:Row(
                         children: [
                           Text("Gender :",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold,),),
                      Padding(
                        padding:EdgeInsets.fromLTRB(40, 5, 0, 0),
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
                       padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                       child:Row(
                         children: [
                           Text("city : ",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold,),),
                           Padding(
                               padding: EdgeInsets.fromLTRB(75, 0, 0, 0),
                             child:  SizedBox(
                               width: 175,
                               child:  Expanded(
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
                                       errorStyle: TextStyle(),
                                       errorText:citytextAlert?"Enter valid input" : null,
                                       hintText: '  city',  contentPadding: EdgeInsets.symmetric(vertical: 5),enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                       hintStyle: TextStyle(color: Colors.black26,fontSize: 16.0)),
                                 ),

                               ),),
                           )

                         ],
                       )
                   ),
                   Padding(
                       padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                       child:Row(
                         children: [
                           Text("Age :",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold,),),
                           Padding(
                               padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                             child:  SizedBox(
                               width: 75,
                               child:  Expanded(
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
                                       errorStyle: TextStyle(),
                                       errorText:agetextAlert?"Enter valid input" : null,
                                       hintText: ' Your Age',  contentPadding: EdgeInsets.symmetric(vertical: 5),enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                       hintStyle: TextStyle(color: Colors.black26,fontSize: 16.0)),
                                 ),

                               ),),
                           )

                         ],
                       )
                   ),
                   Padding(
                       padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                       child:Row(
                         children: [
                           Text("Qualification :",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold,),),
                           Padding(
                             padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: DropdownButton(

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
                     padding:EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                               MaterialPageRoute(builder: (context) => const MyAppp()));
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
                   ElevatedButton(onPressed: () {
                     _refluttersdkPlugin.startTimer();
                   }, child: Text("Start Timer")),
                   ElevatedButton(onPressed: () {
                     _refluttersdkPlugin.stopTimer();
                   }, child: Text("Stop Timer"))
                 ],
               )
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
