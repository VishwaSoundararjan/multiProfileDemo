import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart' show ByteData, Uint8List, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visioneducation/AccountPage.dart';
import 'package:visioneducation/DepositPage.dart';
import 'package:visioneducation/EShop.dart';
import 'package:visioneducation/FdPage.dart';
import 'package:visioneducation/InsurancePage.dart';
import 'package:visioneducation/Loan.dart';
import 'package:visioneducation/cutom_Widgets/dashboard_userInfo_widget.dart';
import 'package:visioneducation/mynavigator.dart';
import 'package:visioneducation/recharge.dart';
import 'package:visioneducation/sampleforms.dart';
import 'package:visioneducation/subScreens/AccountOverview.dart';
import 'package:visioneducation/subScreens/BookTickets.dart';
import 'package:visioneducation/subScreens/BusinessLoan.dart';
import 'package:visioneducation/subScreens/CorporateAccount.dart';
import 'package:visioneducation/subScreens/CurrentAccount.dart';
import 'package:visioneducation/subScreens/DebitCard.dart';
import 'package:visioneducation/subScreens/EducationalLoan.dart';
import 'package:visioneducation/subScreens/GoldLoan.dart';
import 'package:visioneducation/subScreens/HealthInsurance.dart';
import 'package:visioneducation/subScreens/MutualFunds.dart';
import 'package:visioneducation/subScreens/PropertyInsurance.dart';
import 'package:visioneducation/subScreens/RechargePage.dart';
import 'package:visioneducation/subScreens/SavingsAccount.dart';
import 'package:visioneducation/subScreens/TermInsurance.dart';
import 'package:visioneducation/subScreens/TravelInsurance.dart';
import 'package:visioneducation/subScreens/VehicleLoan.dart';
import 'package:visioneducation/user_ram/postgraduaction1.dart';
import '../AccountStatementPage.dart';
import '../CardPage.dart';
import '../Demat.dart';
import '../PersonalLoan.dart';
import '../addPayee.dart';
import '../billPay.dart';
import '../certification.dart';
import '../const_variable/constVaribales.dart';
import '../cutom_Widgets/dashboard_menu_widget.dart';
import '../cutom_Widgets/dashboard_widget.dart';
import '../money_Transfer.dart';
import '../subScreens/BankAccounts.dart';
import '../subScreens/CardlessCash.dart';
import '../subScreens/CreditCard.dart';
import '../subScreens/RdPage.dart';
import '../subScreens/ScanToPay.dart';
import '../subScreens/Shop.dart';
import 'carrier1.dart';
import 'certification1.dart';
import 'mynavigator1.dart';
import 'notification1.dart';
import 'package:refluttersdk/refluttersdk.dart';

import 'dart:io' as ioFile;

import 'dart:ui';
final _refluttersdkPlugin = Refluttersdk();

class MyAppp1 extends StatefulWidget {
  const MyAppp1({Key? key}) : super(key: key);

  @override
  State<MyAppp1> createState() => _MyAppp1State();
}

class _MyAppp1State extends State<MyAppp1> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Carrier?resulid=OCtMHxLM218V058UF9ENEMyOTY5QXwxSg==&utm_source=SmartDx&utm_medium=wp&utm_campaign=RH_WEB_ET_CHECK_K3m': (BuildContext ctx) => const Carrier1(),
        "/Certification1": (BuildContext ctx) => const Certification1(),
        "/Certification": (BuildContext ctx) => const Certification(),
        "/carrier":(BuildContext ctx) => const Carrier1(),
        "/Graduation" : (BuildContext ctx) => const PostGraduation1(),
        "/Dashboard" : (BuildContext ctx) => const MyAppp1(),
        "/AddPayee" : (BuildContext ctx) => const AddPayee(),
        "/BillPay" : (BuildContext ctx) => const BillPay(),
        "/MoneyTransfer" : (BuildContext ctx) => const MoneyTransfer(),
        "/ScanToPay" : (BuildContext ctx) => const ScanToPay(),
        "/Recharge" : (BuildContext ctx) => const Recharge(),
        "/Sampleform" : (BuildContext ctx) => const Sampleform(),
        "/BankAccounts"  : (BuildContext ctx) => const BankAccount(),
        "/CardlessCash"  : (BuildContext ctx) => const CardlessCash(),
        "/CreditCard"  : (BuildContext ctx) => const CreditCard(),
        "/CardPage"  : (BuildContext ctx) => const CardPage(),
        "/LoanPage": (BuildContext ctx) => const LoanPage(),
        "/PersonalLoan": (BuildContext ctx) => const PersonalLoan(),
        "/DematAccount": (BuildContext ctx) => const DematAccount(),
        "/DepositPage": (BuildContext ctx) => const DepositPage(),
        "/InsurancePage": (BuildContext ctx) => const InsurancePage(),
        "/HealthInsurance": (BuildContext ctx) => const HealthInsurance(),
        "/EShopPage": (BuildContext ctx) => const EShopPage(),
        "/ShopPage": (BuildContext ctx) => const ShopPage(),
        "/CurrentAccount": (BuildContext ctx) => const CurrentAccount(),
        "/AccountPage": (BuildContext ctx) => const AccountPage(),
        "/AccountStatementPage": (BuildContext ctx) => const AccountStatementPage(),
        "/GoldLoanPage": (BuildContext ctx) => const GoldLoanPage(),
        "/DebitCard": (BuildContext ctx) => const DebitCard(),
        "/SavingsAccount": (BuildContext ctx) => const SavingsAccount(),
        "/MutualFundsPage": (BuildContext ctx) => const MutualFundsPage(),
        "/FdPage": (BuildContext ctx) => const FdPage(),
        "/TermInsurance": (BuildContext ctx) => const TermInsurance(),
        "/BookTickets": (BuildContext ctx) => const BookTickets(),
        "/BusinessLoan": (BuildContext ctx) => const BusinessLoan(),
        "/VehicleLoan": (BuildContext ctx) => const VehicleLoan(),
        "/CorporateAccount": (BuildContext ctx) => const CorporateAccount(),
        "/BookTickets": (BuildContext ctx) => const BookTickets(),
        "/TravelInsurance": (BuildContext ctx) => const TravelInsurance(),
        "/PropertyInsurance": (BuildContext ctx) => const PropertyInsurance(),
        "/RdPage": (BuildContext ctx) => const RdPage(),
        "/AccountOverview": (BuildContext ctx) => const AccountOverview(),
        "/EducationalLoan": (BuildContext ctx) => const EducationalLoan(),
        "/RechargePage": (BuildContext ctx) => const RechargePage(),
      },

      debugShowCheckedModeBanner: false,
      title: 'Vision Education',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:DashboardPage1(title: "vision Education"),
    );
  }
}

class DashboardPage1 extends StatefulWidget {
   DashboardPage1({Key? key, required String title}) : super(key: key);

  @override
  State<DashboardPage1> createState() => DashboardPage1State();
}


class DashboardPage1State extends State<DashboardPage1> {
  var array = DataClass.dashboardButtons;
  var ads_array = DataClass.dashboardAdsData;
  late var navigationParameter;
  late var screenName;
  late var receivedData;
  late SharedPreferences shared;
  late var userName;
  var quickAccessData = DataClass.quickAccessData;
  Widget? _imgHolder;
  deeplinkHandler() {

    /*
    * App screen Navigations via link and notifications
    */
    _refluttersdkPlugin.listener((data) {
      print("Deeplink Data :: $data");
      var deeplinkData = jsonDecode(data);
      var customParams = deeplinkData['customParams'];
      setState(() {
        screenName = jsonDecode(customParams)['screenName'];
        receivedData = jsonDecode(customParams)['data'];
      });
      screenNavigator(screenName, receivedData);
    });
  }


  /**
   * APP SCREEN NAVIGATER
   */
  screenNavigator(var screenName, var data) {
    switch (screenName) {
      case "Carrier":
        {
          if (data != null) {
            Navigator.pushNamed(context, '/Carrier', arguments: data);
          }
          else
            Navigator.pushNamed(context, '/Carrier');
          break;
        }
      case "Certification":
        {
          if (data != null) {
            Navigator.pushNamed(context, '/Certification', arguments: data);
          }
          else
            Navigator.pushNamed(context, '/Certification');
          break;
        }

      default:
        {
          print("ScreenName is not defined!!!");
        }
    }
  }


  initializeSharedPreference() async {
    shared = await SharedPreferences.getInstance();
    deeplinkHandler();
  }


  @override
  initState() {
    super.initState();
    initializeSharedPreference();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Refluttersdk().screentracking("AccountPage", context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return true;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) =>
              (
                  Row(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) =>
                                        NotificationPage1()));
                              },
                              child: Icon(
                                Icons.notifications, color: Colors.white,)
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      ),
                    ],
                  )
              ),
            ),
          ],
          title: Row(
            children: [
              Image.asset(DataClass.visionLogo, height: 150.h, width: 150.w,),
            ],),
          backgroundColor: DataClass.uiColor, //
          automaticallyImplyLeading: false,

        ),
        body:
        Container(
          child: (
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        UserInfoWidget(user_Name: DataClass.userName,
                            user_AccountNo: DataClass.user_acc,
                            user_Logo: "l",
                            user_amount: DataClass.cash,
                            id: "32",
                            background_Color: "blue"),
                        QuickAccessWidget(ads_list: this.quickAccessData),
                        Container(
                          height: 110.h,
                          width: 340.h,
                          padding: EdgeInsets.fromLTRB(5.h, 10.h, 5.h, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.h),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(DataClass.banner)
                            ),
                          ),

                        ),
                        //Sized Box
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(0,7.h,0,0),
                        //   color: Colors.black12,
                        //   child:SizedBox(width: 330.h,height: 2.5.h,),
                        // ),
                        SizedBox(
                          height: 20.h,
                        ),
                        array.length > 4 ?
                        Container(
                          //color: Colors.black,
                          width: 335.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.h),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: DataClass.uiColor,
                                blurRadius: 0.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child:
                          GridView.count(
                            primary: false,
                            padding: EdgeInsets.fromLTRB(12.w, 15.h, 0, 0),
                            crossAxisCount: 3,
                            crossAxisSpacing: 0.h,
                            mainAxisSpacing: 0.0,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            children: List.generate(array.length, (index) {
                              return Wrap(
                                // alignment: WrapAlignment.center,
                                // crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  ButtonWidget(
                                    widget_Image: array[index]['image'],
                                    widget_Title: array[index]['title']
                                        .toString(),
                                    widget_Type: "button",
                                    routing_Path: array[index]['path'],
                                    id: array[index]['id'].toString(),
                                  ),
                                ],
                              );
                            }
                            ),
                          ),

                        ) :
                        Container(
                          // width: 360,
                          // height: 250,
                          margin: EdgeInsets.fromLTRB(0, 7.h, 0, 0),
                          padding: EdgeInsets.fromLTRB(20.h, 0, 0, 0),
                          child:
                          GridView.count(
                            primary: false,
                            padding: EdgeInsets.fromLTRB(40.w, 13.h, 30.h, 0),
                            crossAxisCount: 2,
                            crossAxisSpacing: 0.h,
                            mainAxisSpacing: 0.w,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            children: List.generate(array.length, (index) {
                              return
                                Center(
                                  child: ButtonWidget(
                                    widget_Image: array[index]['image'],
                                    widget_Title: array[index]['title']
                                        .toString(),
                                    widget_Type: "button",
                                    routing_Path: array[index]['path'],
                                    id: array[index]['id'].toString(),
                                  ),
                                );
                            }
                            ),
                          ),

                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //SizedBox
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(0,7.h,0,0),
                        //   color: Colors.black12,
                        //   child:SizedBox(width: 330.h,height: 2.h,),
                        // ),
                        Container(
                          child: AdsWidget(ads_list: this.ads_array,),
                        ),

                        // ElevatedButton(onPressed: () {
                        //_refluttersdkPlugin.startTimer();
                        //   _captureScreenshot(context);
                        // }, child: Text("Start Timer")),
                        ElevatedButton(onPressed: () {
                         _doTakeScreenShot();
                        }, child: Text("Take ScreenShot")),
                        // Container(
                        //   height: 50,width: 50,
                        //   constraints: BoxConstraints.expand(),
                        //   child: _imgHolder,
                        // ),
                        // Container(
                        //   child: SvgPicture.asset("assets/svg_icons/creditcard.svg",),
                        // ),
                      ],
                    ),
                  ),
                ),
              )
          ),
        ),
        endDrawer: MyNavigator1(),

      ),
    );
  }
  _doTakeScreenShot() async {
    String? path = await _refluttersdkPlugin.takeScreenshot();
    debugPrint('Screenshot taken, path: $path');
    if (path == null || path.isEmpty) {
      print('Error taking the screenshot :(');
      return;
    } // if error
    print('The screenshot has been saved to: $path');
    ioFile.File imgFile = ioFile.File(path);
    _imgHolder = Image.file(imgFile);
  }
  // Future<void> _captureScreenshot(currentContext) async {
  //   try {
  //     RenderRepaintBoundary boundary =
  //     currentContext.findRenderObject();
  //     ui.Image image = await boundary.toImage(pixelRatio: 1.0);
  //     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //     Uint8List pngBytes = byteData.buffer.asUint8List();
  //     // You can now save or use the 'pngBytes' as needed
  //     // e.g., save it to the device's storage or upload it somewhere.
  //     print('Screenshot taken!');
  //   } catch (e) {
  //     print('Failed to capture screenshot: $e');
  //   }
  // }

  // void _captureScreenshot(BuildContext context) async {
  //   try {
  //     // Take the screenshot and get the file path
  //     final imagePath = await ScreenshotController().capture();
  //     print('Screenshot taken at: $imagePath');
  //   } catch (e) {
  //     print('Error taking screenshot: $e');
  //   }
  // }

  void loadValueFromJson() {
    var data = {
      "student": {
        "userData": [
          {
            "name": "Ram",
            "accountNumber": "2212",
            "amountInAccount": "5,470",
            "userProfile":"user1"
          }
        ],
        "appThemes": [
          {
            "themeName": "Theme 1",
            "subThemeName": "Theme 2",
            "themePreviewImage": "ImagePath"
          }
        ],
        "menus": [
          "Deposit",
          "Cards",
          "Loan",
          "Insurance",
          "Account",
          "E-Shop"
        ],
        "banner": "",
        "quickAccess": [
          "Acc overview",
          "Scan and pay",
          "Recharge"
        ],
        "pages": [
          {
            "pageName": "Deposit",
            "components": [
              "RD"
            ]
          },
          {
            "pageName": "Cards",
            "components": [
              "Debitcard"
            ]
          },
          {
            "pageName": "Loan",
            "components": [
              "Educationalloan"
            ]
          },
          {
            "pageName": "Insurance",
            "components": [
              "Healthinsurance",
              "Travelinsurance"
            ]
          },
          {
            "pageName": "Account",
            "components": [
              "Savingsaccount"
            ]
          },
          {
            "pageName": "E-Shop",
            "components": [
              "Shop"
            ]
          }
        ]
      }
    };
//<----------------------------------------------------------------------->
    // Assign themeName and themePreviewImage from Data
    dynamic appThemes = data['student']?['appThemes'];
    if (appThemes is List && appThemes.isNotEmpty) {
      ModalClass.themeName = appThemes[0]?['themeName'];
      ModalClass.subThemeName = appThemes[0]?['subThemeName'];
      ModalClass.themePrviewImage = appThemes[0]?['themePreviewImage'];
    }
//<----------------------------------------------------------------------->
    //accessing userData
    dynamic userData = data['student']?['userData'];
    if (userData is List && userData.isNotEmpty) {
      ModalClass.userName = userData[0]?['name'];
      ModalClass.accNumber = userData[0]?['accountNumber'];
      ModalClass.amountInAccount=userData[0]?['amountInAccount'];
      ModalClass.userProfile=userData[0]?['userProfile'];
    }
    // Assign banner from Data
    ModalClass.banner = data['student']?['banner'];
//<----------------------------------------------------------------------->
    // Assign quickAccessData from Data and ConstData
    List<dynamic>? quickAccessKeys = data['student']?['quickAccess'] as List<
        dynamic>?;
    for (var key in quickAccessKeys!) {
      if (ConstData.quickAccess.containsKey(key)) {
        var quickAccessValue = ConstData.quickAccess[key];
        if (!ModalClass.quickAccessData.contains(quickAccessValue)) {
          ModalClass.quickAccessData.add(quickAccessValue);
        }
      }
    }
    print("Modal class data: ${ModalClass.userName},${ModalClass
        .quickAccessData}");
    print("----------");
  //<----------------------------------------------------------------------->
    //for fetching menu data && navigation Menu data
    List<dynamic>? menuData = data['student']?['menus'] as List<
        dynamic>?;

    for (var key in menuData!) {
      if (ConstData.menus.containsKey(key)) {
        var menuValue = ConstData.menus[key];
        var navMenuValue = ConstData.navigationMenuData[key];
        if (!ModalClass.dashboardButtons.contains(menuValue)) {
          ModalClass.dashboardButtons.add(menuValue);
          ModalClass.navigationMenuData.add(navMenuValue);
        }
      }
    }
    print("MenuData:: ${ModalClass.dashboardButtons}");    print("----------");
    print("navMenuData:: ${ModalClass.navigationMenuData}");    print("----------");



    // <----------------------------------------------------------------------->
      var pages = data['student']!['pages'] as List<
          dynamic>?;
      var pageName;
      // Check if pages is not null and is a List
      if (pages is List) {
        // Iterate over each page
        for (var page in pages) {
          // Check if the page contains the 'pageName' key
          if (page.containsKey('pageName')) {
            pageName = page['pageName'];
            // Check if the pageName matches a key in the 'menus' map of ConstData
            if (ConstData.menus.containsKey(pageName)) {
              // Get the menu item for the matching pageName
              var menuItem = ConstData.menus[pageName];
              // Add the menuItem to the dashboardButtons list in ModalClass
              ModalClass.dashboardButtons.add(menuItem);
            }
          }

          // Check if the page contains the 'components' key
          if (page.containsKey('components')) {
            // Get the components list
            var componentsList = page['components'];

            // Iterate over each component
            for (var component in componentsList) {
              // Check if the component exists in the 'components' map of ConstData
              if (ConstData.components.containsKey(component)) {
                // Get the component data for the matching component key
                var componentData = ConstData.components[component];

                // Determine the target list based on the pageName
                List targetList = [];
                if (pageName == 'Deposit') {
                  targetList = ModalClass.depositPageData;
                } else if (pageName == 'Cards') {
                  targetList = ModalClass.cardPageData;
                } else if (pageName == 'Insurance') {
                  targetList = ModalClass.insurancePageData;
                } else if (pageName == 'E-Shop') {
                  targetList = ModalClass.eShopPageData;
                } else if (pageName == 'Account') {
                  targetList = ModalClass.accountPageData;
                }
                else if (pageName == 'Loan') {
                  targetList = ModalClass.loanPageData;
                }
                else if (pageName == 'Demat account') {
                  targetList = ModalClass.dematPageData;
                }
                else if (pageName == 'Loan') {
                  targetList = ModalClass.loanPageData;
                }
                // Add the componentData to the targetList in ModalClass
                if(!targetList.contains(componentData))
                targetList.add(componentData);
              }
            }
          }
        }
      }
   print("Loans :: ${ModalClass.loanPageData}");    print("----------");
  }
}








