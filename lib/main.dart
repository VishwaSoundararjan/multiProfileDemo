import 'dart:convert';
import 'package:firebase_core/firebase_core.dart' if (dart.library.io) 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:visioneducation/JsonLoader.dart';
import 'package:visioneducation/addPayee.dart';
import 'package:visioneducation/billPay.dart';
import 'package:visioneducation/certification.dart';
import 'package:visioneducation/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refluttersdk/refluttersdk.dart';
import 'package:visioneducation/money_Transfer.dart';
import 'package:visioneducation/recharge.dart';
import 'package:visioneducation/splashScreen.dart';
import 'package:visioneducation/userIdentifier.dart';
import 'package:visioneducation/user_ram/carrier1.dart';
import 'package:visioneducation/user_ram/certification1.dart';
import 'package:visioneducation/user_ram/dashboard1.dart';
import 'package:visioneducation/user_ram/screenShot.dart';
import 'cutom_Widgets/dashboard_widget.dart';
import 'dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
 checkPlatform();
  final SharedPreferences shared = await SharedPreferences.getInstance();
  User.isLogin = (shared.getBool('login') ?? false);
  // User.isLogin?{
  //   User.navFlag=true,
  //   getApiData()
  // }:getApiData();
  if(User.isLogin){
    User.userEmail= shared.getString("userId")!;
    User.navFlag=true;
  getApiData();
  }
  // else{
  //   getApiData();
  // }
 // UserIdentifier.userIdentifier(false);
  runApp(

    ScreenUtilInit(
      builder: (context, widget) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(title: "Vision Education")
          //home: MyApp2()
          //home: Carrier1()
      ),
    )
      );
}
checkPlatform() async {
  if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}

getApiData() async {
  //https://cat-fact.herokuapp.com/facts
  //https://karthikrathinavel.github.io/users.json
  //https://vishwasoundararajan.github.io/vision.json
  // var url=Uri.parse('https://vishwasoundararajan.github.io/vision.json');
  http.Response response =await http.post(
    Uri.parse('https://srs-json-test.onrender.com/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': User.userEmail,
    }),
  );;
  if(response.statusCode == 200){
    // var data=jsonDecode(response.body);
    // final text = data[0]['text'];
    // //final text = data[0]['status']['sentCount'];
    // print("Received data :: $text");
    print("response success!!! ${response.statusCode}");
    var data1= jsonDecode(response.body);
    JsonLoader.loadJson(data1);

    // var user1=data['user1']['name'];
    // var user2=data['user2']['name'];
    // var user3=data['user3']['name'];
  }
  else
    print("Oops something wrong");
}



final _refluttersdkPlugin = Refluttersdk();
class MyApp extends StatefulWidget {
  const MyApp({Key? key, required String title}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late SharedPreferences shared;
  late var fcmToken;
  late String userId;
  late bool isLogin;

  @override
  initState(){
    super.initState();
   // getApiData();
    _refluttersdkPlugin.initWebSDK("./sw.js");
  }


  @override
  Widget build(BuildContext context) {
   User.context=context;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          resizeToAvoidBottomInset: false,
          // body:User.isLogin ? UserNavigator(): MyLoginPage(),
          //body: MyLoginPage(),
           body:User.isLogin ? LoadingAnimation(): MyLoginPage(),
        ),
    );
  }
}

class UserNavigator extends StatefulWidget {
  const UserNavigator({Key? key}) : super(key: key);

  @override
  State<UserNavigator> createState() => _UserNavigatorState();
}

class _UserNavigatorState extends State<UserNavigator> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: User.user=="ram@gmail.com" ? MyAppp1(): MyAppp(),
         home: LoadingAnimation()
      ),
      designSize: Size(width,height),
    );
  }

}

class User{
  static String userEmail="";
  static String user="";
  static bool isLogin=false;
  static bool navFlag=false;
  static BuildContext context=User() as BuildContext;
}

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => LoadingAnimationState();
}

class LoadingAnimationState extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.blue, size: 50.w)
    ),
    );
  }

}

//
//
//
// void main() => runApp(new MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
// //1 wait
// //2 success
// //3 unauthorized access
// //4 server side
// class _HomeScreenState extends State<HomeScreen> {
//   getApiData() async {
//      var url=Uri.parse('https://cat-fact.herokuapp.com/facts');
//      http.Response response =await http.get(url);
//      print(response.statusCode);
//      if(response.statusCode == 200){
//        print("success");
//        var data=jsonDecode(response.body);
//        final text = data[0]['text'];
//        //final text = data[0]['status']['sentCount'];
//        print(text);
//      }
//      else
//        print("Oops something wrong");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//    body:Center(
//      child: Column(
//        children: [
//          Text('text'),
//          TextButton(
//            onPressed: (){
//              getApiData();
//            },
//            child:Text(
//              "Call Api"
//            )
//            ) ,
//
//        ],
//      ),
//    )
//     );
//   }
//
//   void fetchUsers(){
//     print('fetchUsers called');
//
//
//   }
//
//
// }
//
 class BlankScreen extends StatefulWidget {
   const BlankScreen({Key? key}) : super(key: key);

   @override
   State<BlankScreen> createState() => _BlankScreenState();
 }

 class _BlankScreenState extends State<BlankScreen> {
   @override
   Widget build(BuildContext context) {
     return Container(
     height: 800,
       width: 400,
         color: Colors.black,
     );
   }
 }
