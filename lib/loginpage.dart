import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart' if (dart.library.io) 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart' if (dart.library.io) 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visioneducation/userIdentifier.dart';
import 'package:visioneducation/user_ram/dashboard1.dart';
import 'cutom_Widgets/dashboard_widget.dart';
import 'dashboard.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'main.dart';


final _refluttersdkPlugin = Refluttersdk();

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  var fcmToken = null;
  late var navigationParameter;
  late String userId;
  late String userPassword;
  late SharedPreferences shared;
  late bool isLogin;

  bool userIDfieldSufixAlert = false;
  bool userpassfieldSufixAert = false;
  bool uIdfildAlertText = false;
  bool userpasswordfieldAlertText = false;

  final userId_controller = TextEditingController();

  final userPassword_contoller = TextEditingController();
  @override
  void initState() {

    super.initState();
    // FCM
    // Firebase.initializeApp();
    initializeSharedPreference();
    // Screen Tracking
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Refluttersdk().screentracking("AccountPage", context);
    });
  }
  initializeSharedPreference() async {
    shared = await SharedPreferences.getInstance();
    setState(() {
      userId = shared.getString("userId").toString();
    });
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS){
      // Getting FCM Token
      FirebaseMessaging.instance.getToken().then((newToken) {
        print("FCM token: $newToken ");
        shared.setString("fcmToken", newToken!);
        setState(() {
          fcmToken = newToken;
        });
      });

    }

    // User Login validations
    isLoggedIn();

  }
// Login Validations
  void isLoggedIn() async {
    isLogin = (shared.getBool('login') ?? false);

    if (isLogin) {
      /*
        * Post Login => User Register
        */
      setState(() {
        userId = shared.getString("userId").toString();
        fcmToken = shared.getString("fcmToken").toString();
      });
      onResulticksUserRegister();
      User.navFlag=true;
      UserIdentifier.loadUserData();

      // Navigate to Dashboard
      // if(userId == "ram@gmail.com")
      //   Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => const MyAppp1()));
      // else if(userId == "farook@gmail.com")
      //   Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => const MyAppp()));

    } else {
      /*
       * Pre Login => Update FCM token
       */
      updatePushToken();
    }
  }
  onResulticksUserRegister() {
    if (kIsWeb) {
      Map userData = {
        "userUniqueId":"visionuser@email.com",
        "name": "<name>",
        "age": "<age>",
        "email": "<email>",
        "phone": "<phone>",
        "gender": "<gender>",
        "profileUrl": "<profileUrl>",
        "dateOfBirth": "<dob>",
      };
      _refluttersdkPlugin.sdkRegisteration(userData);

    }else{
      Map userData = {
        "userUniqueId": userId,
        // * unique id could be email id, mobile no, or BrandID defined id like Customer hash, PAN number
        "name": "",
        "age": "",
        "email": "",
        "phone": "",
        "gender": "",
        "profileUrl": "",
        "dob": "",
        "education": "",
        "employed": true,
        "married": false,
        "deviceToken": fcmToken,
        // * FCM Token
      };
      _refluttersdkPlugin.sdkRegisteration(userData);
    }

  }
  updatePushToken() {

    if(fcmToken != null)
    {
      _refluttersdkPlugin.updatePushToken(fcmToken);
    } else {
      // Getting FCM Token
      if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS){
        FirebaseMessaging.instance.getToken().then((newToken) {
          print("FCM token: $newToken ");
          shared.setString("fcmToken", newToken!);
          setState(() {
            fcmToken = newToken;
          });
          _refluttersdkPlugin.updatePushToken(fcmToken);
        });

      }

    }

  }

  Widget getTextField({required String hint}){
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent,width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent,width: 0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
          filled: true,
          fillColor: Colors.black12,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,

          )
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    User.context=context;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/login_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                //  child:  SvgPicture.asset(
                //    'assets/login_bg-2.svg',
                //    fit: BoxFit.cover,
                //  ),
              ),
              // SvgPicture.asset(
              //   'assets/login_bg-2.svg',
              //   fit: BoxFit.cover,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 57.h,
                    ),
                    Center(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[ Image.asset(DataClass.visionLogo,height: 60.h,width: 230.w,)],
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Container(
                        color: Color(0xFF0f1d8d),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              TextField(
                                onTap: () {
                                  setState(() {
                                    userIDfieldSufixAlert = false;
                                    userIDfieldSufixAlert = false;
                                  });
                                },
                                controller: userId_controller,
                                style: TextStyle(color: Colors.white),
                                keyboardType:
                                TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(),
                                    errorText: userIDfieldSufixAlert
                                        ? "Enter valid input"
                                        : null,
                                    hintText: 'Email',
                                    prefixIcon: Icon(
                                        Icons.mail_outline_sharp,
                                        color: Colors.white),
                                    enabledBorder:
                                    UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white)),
                                    suffixIcon: userIDfieldSufixAlert
                                        ? Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    )
                                        : null,
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.h)),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextField(
                                onTap: () {
                                  setState(() {
                                    userpassfieldSufixAert = false;
                                    userpasswordfieldAlertText =
                                    false;
                                  });
                                },
                                controller: userPassword_contoller,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(),
                                  errorText: userpassfieldSufixAert
                                      ? "Enter valid password"
                                      : null,
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock_outline,
                                      color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  suffixIcon: userpassfieldSufixAert
                                      ? Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  )
                                      : null,
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.h),
                                ),
                                keyboardType:
                                TextInputType.visiblePassword,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text("Forgot password?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.h)),

                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 40.h,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        padding: EdgeInsets.all(
                                            10) //content padding inside button
                                    ),
                                    onPressed: () {
                                      Navigator.push( context, MaterialPageRoute( builder: (context) => const LoadingAnimation()));
                                      loginValidation();
                                      Navigator.pop(context);
                                    },
                                    child: Text("LOGIN",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.h))),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("SecureBanking & PrivacyPolicy",
                                      style: TextStyle(  decoration: TextDecoration.underline,color: Colors.white,fontSize: 12.h),),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 100.h,
                    ),

                    Center(
                      child: Wrap(
                        children: [
                          Text("Don`t have an account? ",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 12.h,
                              )),
                          GestureDetector(
                            child: Text("Create one",
                                style: TextStyle(
                                  color: Colors.white,fontSize: 12.h,)),
                          ),
                        ],
                      ),
                    )

                  ],

                ),



              )
            ],
          )
      ),
    );

  }
  Future<void>loginValidation () async
   {

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Alert'),
    //       content: Text('Login Details : $userId'),
    //       actions: <Widget>[
    //         TextButton(
    //           child: Text('OK'),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
    // Reading the values from the UI
    setState(() {
      userId =
          userId_controller.text;
      userPassword =
          userPassword_contoller
              .text;
    });
    // User Id Validation
    if (userId.length == 0 ) {
      setState(() {
        userIDfieldSufixAlert =  true;
      });
      return;
    }
    if (userId!="student@gmail.com" && userId!="professional@gmail.com" && userId!="sme@gmail.com"
        && userId!="seniorCitizen@gmail.com" && userId!="corporate@gmail.com" && userId!="homeMaker@gmail.com") {
      setState(() {
        userIDfieldSufixAlert =  true;
      });
      return;
    }

    // Password Validation
    if (userPassword.length == 0) {
      setState(() {
        userpassfieldSufixAert = true;
      });
      return ;
    }
    // Data stored
    shared.setString("userId", userId);
    shared.setBool("login", true);
    User.userEmail=userId;
    getApiData();
    // Resulticks User register
    onResulticksUserRegister();
     //UserIdentifier.userIdentifier(true);

     User.navFlag=true;
    // await Future.wait([loadAnimationWidget()]);

    UserIdentifier.loadUserData();

    // Navigate to Dashboard
    // if(userId == "ram@gmail.com")
    // {
    //   DataClass.receivedData=UserRam.rechargeData;
    //   DataClass.dashboardButtons=UserRam.dashboardButtons;
    //   DataClass.dashboardAdsData=UserRam.dashboardAdsData;
    //   DataClass.navigationMenuData=UserRam.navigationMenuData;
    //   DataClass.addPayeeData=UserRam.addPayeeData;
    //   DataClass.billPayData=UserRam.billPayData;
    //   DataClass.rechargeData=UserRam.rechargeData;
    //   DataClass.userName=UserRam.userName;
    //   DataClass.uiColor=UserRam.uiColor;
    //   DataClass.navMenuColor=UserRam.navMenuColor;
    //   DataClass.banner="assets/banner03.jpeg";
    //   Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => const MyAppp1()));
    // }
    //
    // else if(userId == "farook@gmail.com")
    // {
    //   DataClass.receivedData=Userfarook.rechargeData;
    //   DataClass.dashboardButtons=Userfarook.dashboardButtons;
    //   DataClass.dashboardAdsData=Userfarook.dashboardAdsData;
    //   DataClass.navigationMenuData=Userfarook.navigationMenuData;
    //   DataClass.addPayeeData=Userfarook.addPayeeData;
    //   DataClass.billPayData=Userfarook.billPayData;
    //   DataClass.rechargeData=Userfarook.rechargeData;
    //   DataClass.userName=Userfarook.userName;
    //   DataClass.uiColor=Userfarook.uiColor;
    //   DataClass.navMenuColor=Userfarook.navMenuColor;
    //   DataClass.banner="assets/banner05.jpeg";
    //   Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => const MyAppp1()));
    // }
    // else(){
    //     Fluttertoast.showToast(
    //         msg: "Enter Valid Data",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0
    //     );
    //   };

  }
  Future<void>loadAnimationWidget()async{
    User.navFlag?LoadingAnimation():null;
  }

}