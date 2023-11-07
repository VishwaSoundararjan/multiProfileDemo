

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refluttersdk/refluttersdk.dart';

import '../cutom_Widgets/dashboard_menu_widget.dart';
import '../cutom_Widgets/dashboard_widget.dart';
import '../user_ram/dashboard1.dart';
import '../user_ram/mynavigator1.dart';
import '../user_ram/notification1.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  var ads_array=DataClass.dashboardAdsData;
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
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                AdsWidget(ads_list:this.ads_array,),
              ],
            ),
          ),
        ),
        endDrawer: MyNavigator1(),
      ),
    );
  }
}


class UserRam{

  static Color uiColor =  Color(0xFF009bdf);
  static Color navMenuColor = Colors.lightBlue.shade200;
  static List receivedData=[];
  static var userName="Mr. Ram";
  static var cash="\$2,478.00";
  static var user_acc="Savings *******2212";

  static var userAccountNumber;
  static var savingsAmount;
  static var userProfilePic;


  static List loanPageData=[
    {
      "id": 345343,
      "title": "Educational Loan",
      "image": "assets/VB_Educational loan.png",
      "path": "/EducationalLoan",
      "type": "button"
    },
  ];
  static List depositPageData=[
    {
      "id": 345343,
      "title": "RD",
      "image": "assets/VB_Recurring Deposit(RD).png",
      "path": "/RdPage",
      "type": "button"
    },

  ];
  static List cardPageData=[

    {
      "id": 345343,
      "title": "Debit Card",
      "image": "assets/debitCard.png",
      "path": "/DebitCard",
      "type": "button"
    },

  ];
  static List eShopPageData=[

    {
      "id": 345343,
      "title": "Shop",
      "image": "assets/shop.png",
      "path": "/ShopPage",
      "type": "button"
    },

  ];
  static List accountPageData=[

    {
      "id": 345343,
      "title": "Savings Account",
      "image": "assets/savingsAccount.png",
      "path": "/SavingsAccount",
      "type": "button"
    },

  ];
  static List insurancePageData=[
    {
      "id": 345343,
      "title": "Health Insurance",
      "image": "assets/VB_Health Insurance.png",
      "path": "/HealthInsurance",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Travel Insurance",
      "image": "assets/VB_Travel Insurance.png",
      "path": "/TravelInsurance",
      "type": "button"
    },

  ];
  static List quickAccessData=[
    {
      "id": 345343,
      "title": "Scan & pay",
      "image": "assets/Scanpay.png",
      "path": "/ScanToPay",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Account Overview",
      "image": "assets/loan.png",
      "path": "/AccountOverview",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Shop",
      "image": "assets/shop.png",
      "path": "/ShopPage",
      "type": "button"
    },
  ];

  static List dashboardButtons=[
    {
      "id": 234232,
      "title": "Deposit",
      "image": "assets/bank_deposit.png",
      "path": "/DepositPage",
      "type": "banner"
    },

    {
      "id": 234232,
      "title": "Cards",
      "image": "assets/credit_Cards.png",
      "path": "/CardPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Loan",
      "image": "assets/loan.png",
      "path": "/LoanPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Insurance",
      "image": "assets/insurance-policy.png",
      "path": "/InsurancePage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Account",
      "image": "assets/account.png",
      "path": "/AccountPage",
      "type": "banner"
    },
//    {
//   "id": 234232,
//   "title": "E-Shop",
//   "image": "assets/UPI.png",
//   "path": "/MoneyTransfer",
//   "type": "banner"
// },
  ];
  static List dashboardAdsData=[
    {
      "ads_image":"assets/flipkartLogo.png",
      "ads_title":"Flipkart",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/amazonLogo.png",
      "ads_title":"Amazon",
      "ads_id": "24"
    },
    {
      "ads_image":"assets/myntra.png",
      "ads_title":"Myntra",
      "ads_id": "25"
    },
    // {
    //   "ads_image":"assets/redbus.png",
    //   "ads_title":"Redbus",
    //   "ads_id": "26"
    // },
    // {
    //   "ads_image":"assets/AJIO.png",
    //   "ads_title":"AJIO",
    //   "ads_id": "27"
    // },
    // {
    //   "ads_image":"assets/irctc.png",
    //   "ads_title":"IRCTC",
    //   "ads_id": "28"
    // },
  ];
  static var navigationMenuData=[
    {
      "drawerList_image":"assets/Home.png",
      "drawerList_text":"Dashboard",
      "drawerList_navigation":"/Dashboard",
      "drawerList_id": "23"
    },

    {
      "drawerList_image":"assets/bank_deposit.png",
      "drawerList_text":"Deposit",
      "drawerList_navigation":"/DepositPage",
      "drawerList_id": "23"
    },

    {
      "drawerList_image":"assets/credit_Cards.png",
      "drawerList_text":"Cards",
      "drawerList_navigation":"/CardPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/loan.png",
      "drawerList_text":"Loan",
      "drawerList_navigation":"/LoanPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/insurance-policy.png",
      "drawerList_text":"Insurance",
      "drawerList_navigation":"/InsurancePage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/account.png",
      "drawerList_text":"Account",
      "drawerList_navigation":"/AccountPage",
      "drawerList_id": "23"
    },

    {
      "drawerList_image":"assets/forms.png",
      "drawerList_text":"Form",
      "drawerList_navigation":"/Sampleform",
      "drawerList_id": "23"
    },
    // {
    //   "drawerList_image":"assets/about.png",
    //   "drawerList_text":"About",
    //   "drawerList_navigation":"/Certification1",
    //   "drawerList_id": "23"
    // },
  ];
  static List addPayeeData=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Bank Accounts",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/creditcard.png",
      "ads_title":"Credit Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Cardless Cash.png",
      "ads_title":"Cardless Cash",
      "ads_id": "23"
    },

  ];
  static List billPayData=[
    {
      "ads_image":"assets/Electricity.png",
      "ads_title":"Electricity",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Gas.png",
      "ads_title":"Gas",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Water.png",
      "ads_title":"Water",
      "ads_id": "23"
    },
    // {
    //   "ads_image":"assets/location.png",
    //   "ads_title":"Insurance",
    //   "ads_id": "23"
    // },
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/creditcard.png",
      "ads_title":"Credit Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Donation.png",
      "ads_title":"Donation",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Fees.png",
      "ads_title":"Fees",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Shopping.png",
      "ads_title":"Shopping",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Other Bills.png",
      "ads_title":"Other Bills",
      "ads_id": "23"
    },

  ];
  static List rechargeData=[
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Data Card.png",
      "ads_title":"Data Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },

  ];

}

class Userfarook{
  static List receivedData=[];
  static var userName="Ms. Swetha";
  static var cash="\$14,236.50";
  static var user_acc="Savings *******2213";
//Color(0xFFfc6a00)
  static Color uiColor = Color(0xFFc2392c);
  static Color navMenuColor = Colors.red.shade200;
  static var userAccountNumber;
  static var savingsAmount;
  static var userProfilePic;

  static List loanPageData=[
    {
      "id": 345343,
      "title": "Gold Loan",
      "image": "assets/goldLoan.png",
      "path": "/GoldLoanPage",
      "type": "button"
    },
  ];
  static List depositPageData=[
    {
      "id": 345343,
      "title": "FD",
      "image": "assets/Add Money.png",
      "path": "/FdPage",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "RD",
      "image": "assets/VB_Recurring Deposit(RD).png",
      "path": "/RdPage",
      "type": "button"
    },
  ];
  static List cardPageData=[

    {
      "id": 345343,
      "title": "Debit Card",
      "image": "assets/debitCard.png",
      "path": "/DebitCard",
      "type": "button"
    },

  ];
  static List eShopPageData=[

    {
      "id": 345343,
      "title": "Shop",
      "image": "assets/shop.png",
      "path": "/ShopPage",
      "type": "button"
    },

  ];
  static List accountPageData=[

    {
      "id": 345343,
      "title": "Savings Account",
      "image": "assets/savingsAccount.png",
      "path": "/SavingsAccount",
      "type": "button"
    },

  ];
  static List insurancePageData=[
    {
      "id": 345343,
      "title": "Term Insurance",
      "image": "assets/VB_Term Insurance.png",
      "path": "/TermInsurance",
      "type": "button"
    },

  ];
  static List quickAccessData=[
    {
      "id": 345343,
      "title": "Scan & pay",
      "image": "assets/Scanpay.png",
      "path": "/ScanToPay",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Account Overview",
      "image": "assets/loan.png",
      "path": "/AccountOverview",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Shop",
      "image": "assets/shop.png",
      "path": "/ShopPage",
      "type": "button"
    },
  ];
  static List dashboardButtons=[
    {
      "id": 234232,
      "title": "Deposit",
      "image": "assets/bank_deposit.png",
      "path": "/DepositPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Cards",
      "image": "assets/credit_Cards.png",
      "path": "/CardPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Loan",
      "image": "assets/loan.png",
      "path": "/LoanPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Insurance",
      "image": "assets/insurance-policy.png",
      "path": "/InsurancePage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Account",
      "image": "assets/account.png",
      "path": "/AccountPage",
      "type": "banner"
    },
    // {
    //   "id": 234232,
    //   "title": "E-Shop",
    //   "image": "assets/ecommerce.png",
    //   "path": "/EShopPage",
    //   "type": "banner"
    // },

  ];



  static List dashboardAdsData=[
    // {
    //   "ads_image":"assets/flipkartLogo.png",
    //   "ads_title":"Flipkart",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/amazonLogo.png",
    //   "ads_title":"Amazon",
    //   "ads_id": "24"
    // },
    // {
    //   "ads_image":"assets/myntra.png",
    //   "ads_title":"Myntra",
    //   "ads_id": "25"
    // },
    {
      "ads_image":"assets/redbus.png",
      "ads_title":"Redbus",
      "ads_id": "26"
    },
    {
      "ads_image":"assets/AJIO.png",
      "ads_title":"AJIO",
      "ads_id": "27"
    },
    {
      "ads_image":"assets/irctc.png",
      "ads_title":"IRCTC",
      "ads_id": "28"
    },
  ];
  static var navigationMenuData=[
    {
      "drawerList_image":"assets/Home.png",
      "drawerList_text":"Dashboard",
      "drawerList_navigation":"/Dashboard",
      "drawerList_id": "23"
    },

    {
      "drawerList_image":"assets/bank_deposit.png",
      "drawerList_text":"Deposit",
      "drawerList_navigation":"/DepositPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/credit_Cards.png",
      "drawerList_text":"Cards",
      "drawerList_navigation":"/CardPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/loan.png",
      "drawerList_text":"Loan",
      "drawerList_navigation":"/LoanPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/insurance-policy.png",
      "drawerList_text":"Insurance",
      "drawerList_navigation":"/InsurancePage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/account.png",
      "drawerList_text":"Account",
      "drawerList_navigation":"/AccountPage",
      "drawerList_id": "23"
    },
    // {
    //   "drawerList_image":"assets/ecommerce.png",
    //   "drawerList_text":"E-Shop",
    //   "drawerList_navigation":"/EShopPage",
    //   "drawerList_id": "23"
    // },
    {
      "drawerList_image":"assets/forms.png",
      "drawerList_text":"Form",
      "drawerList_navigation":"/Sampleform",
      "drawerList_id": "23"
    },
    // {
    //   "drawerList_image":"assets/about.png",
    //   "drawerList_text":"About",
    //   "drawerList_navigation":"/Certification",
    //   "drawerList_id": "23"
    // },

  ];
  static List addPayeeData=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Bank Accounts",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/creditcard.png",
      "ads_title":"Credit Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Cardless Cash.png",
      "ads_title":"Cardless Cash",
      "ads_id": "23"
    },

  ];
  static List billPayData=[
    {
      "ads_image":"assets/Electricity.png",
      "ads_title":"Electricity",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Gas.png",
      "ads_title":"Gas",
      "ads_id": "23"
    },
    // {
    //   "ads_image":"assets/Water.png",
    //   "ads_title":"Water",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/location.png",
    //   "ads_title":"Insurance",
    //   "ads_id": "23"
    // },
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },
    // {
    //   "ads_image":"assets/creditcard.png",
    //   "ads_title":"Credit Card",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/Donation.png",
    //   "ads_title":"Donation",
    //   "ads_id": "23"
    // },
    {
      "ads_image":"assets/Fees.png",
      "ads_title":"Fees",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Shopping.png",
      "ads_title":"Shopping",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Other Bills.png",
      "ads_title":"Other Bills",
      "ads_id": "23"
    },

  ];
  static List rechargeData=[
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Data Card.png",
      "ads_title":"Data Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },

  ];

}

class Professional{

  static List receivedData=[];
  static var userName="Mr. Farook";
  static var cash="\$35,236.75";
  static var user_acc="Savings *******2214";
  static Color uiColor = Colors.deepPurple;
  static Color navMenuColor = Colors.deepPurple.shade200;
  static var userAccountNumber;
  static var savingsAmount;
  static var userProfilePic;

  static var banner="assets/banners/professional.png";


  static List loanPageData=[
    {
      "id": 345343,
      "title": "Personal Loan",
      "image": "assets/personalLoan.png",
      "path": "/PersonalLoan",
      "type": "button"
    },
  ];
  static List depositPageData=[
    {
      "id": 345343,
      "title": "FD",
      "image": "assets/Add Money.png",
      "path": "/FdPage",
      "type": "button"
    },
  ];
  static List cardPageData=[

    {
      "id": 345343,
      "title": "CardlessCash",
      "image": "assets/cardlessCash.png",
      "path": "/CardlessCash",
      "type": "button"
    },

  ];
  static List eShopPageData=[

    {
      "id": 345343,
      "title": "Shop",
      "image": "assets/shop.png",
      "path": "/ShopPage",
      "type": "button"
    },

  ];
  static List accountPageData=[

    {
      "id": 345343,
      "title": "Current Account",
      "image": "assets/VB_Current account.png",
      "path": "/CurrentAccount",
      "type": "button"
    },

  ];
  static List insurancePageData=[

    {
      "id": 345343,
      "title": "Health Insurance",
      "image": "assets/healthInsurance.png",
      "path": "/HealthInsurance",
      "type": "button"
    },

  ];
  static List quickAccessData=[
    {
      "id": 345343,
      "title": "Scan & pay",
      "image": "assets/Scanpay.png",
      "path": "/ScanToPay",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Loan and Card Offers",
      "image": "assets/loan.png",
      "path": "/LoanPage",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Demat",
      "image": "assets/joint-account.png",
      "path": "/DematAccount",
      "type": "button"
    },
  ];
  static List dashboardButtons=[
    {
      "id": 234232,
      "title": "Deposit",
      "image": "assets/bank_deposit.png",
      "path": "/DepositPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Cards",
      "image": "assets/credit_Cards.png",
      "path": "/CardPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Loan",
      "image": "assets/loan.png",
      "path": "/LoanPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Insurance",
      "image": "assets/insurance-policy.png",
      "path": "/InsurancePage",
      "type": "banner"
    },
    {
      "id": 345343,
      "title": "Demat Account",
      "image": "assets/joint-account.png",
      "path": "/DematAccount",
      "type": "button"
    },
    {
      "id": 234232,
      "title": "Account",
      "image": "assets/account.png",
      "path": "/AccountPage",
      "type": "banner"
    },
    //   {
    // "id": 234232,
    // "title": "E-Shop",
    // "image": "assets/ecommerce.png",
    // "path": "/EShopPage",
    // "type": "banner"
    //   },

  ];
  static List dashboardAdsData=[
    // {
    //   "ads_image":"assets/flipkartLogo.png",
    //   "ads_title":"Flipkart",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/amazonLogo.png",
    //   "ads_title":"Amazon",
    //   "ads_id": "24"
    // },
    // {
    //   "ads_image":"assets/myntra.png",
    //   "ads_title":"Myntra",
    //   "ads_id": "25"
    // },
    {
      "ads_image":"assets/redbus.png",
      "ads_title":"Redbus",
      "ads_id": "26"
    },
    {
      "ads_image":"assets/AJIO.png",
      "ads_title":"AJIO",
      "ads_id": "27"
    },
    {
      "ads_image":"assets/irctc.png",
      "ads_title":"IRCTC",
      "ads_id": "28"
    },
  ];
  static var navigationMenuData=[
    {
      "drawerList_image":"assets/Home.png",
      "drawerList_text":"Dashboard",
      "drawerList_navigation":"/Dashboard",
      "drawerList_id": "23"
    },

    {
      "drawerList_image":"assets/bank_deposit.png",
      "drawerList_text":"Deposit",
      "drawerList_navigation":"/DepositPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/credit_Cards.png",
      "drawerList_text":"Cards",
      "drawerList_navigation":"/CardPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/loan.png",
      "drawerList_text":"Loan",
      "drawerList_navigation":"/LoanPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/insurance-policy.png",
      "drawerList_text":"Insurance",
      "drawerList_navigation":"/InsurancePage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/joint-account.png",
      "drawerList_text":"Demat Account",
      "drawerList_navigation":"/DematAccount",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/account.png",
      "drawerList_text":"Account",
      "drawerList_navigation":"/AccountPage",
      "drawerList_id": "23"
    },
    // {
    //   "drawerList_image":"assets/ecommerce.png",
    //   "drawerList_text":"E-Shop",
    //   "drawerList_navigation":"/EShopPage",
    //   "drawerList_id": "23"
    // },
    {
      "drawerList_image":"assets/forms.png",
      "drawerList_text":"Form",
      "drawerList_navigation":"/Sampleform",
      "drawerList_id": "23"
    },
    // {
    //   "drawerList_image":"assets/about.png",
    //   "drawerList_text":"About",
    //   "drawerList_navigation":"/Certification",
    //   "drawerList_id": "23"
    // },

  ];
  static List addPayeeData=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Bank Accounts",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/creditcard.png",
      "ads_title":"Credit Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Cardless Cash.png",
      "ads_title":"Cardless Cash",
      "ads_id": "23"
    },

  ];
  static List deposit_subPages=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"FD",
      "ads_id": "23"
    },
  ];
  static List cards_subPages=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Credit Card",
      "ads_id": "23"
    },
  ];
  static List loan_subPages=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Personal Loan",
      "ads_id": "23"
    },
  ];
  static List insurance_subPages=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Health Insurance",
      "ads_id": "23"
    },
  ];
  static List dematPageData=[
    {
      "id": 234232,
      "title": "Mutual fund",
      "image": "assets/mutualFunds.png",
      "path": "/MutualFundsPage",
      "type": "banner"
    },
  ];
  static List account_subPages=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Current Account",
      "ads_id": "23"
    },
  ];
  static List eshop_subPages=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Shop",
      "ads_id": "23"
    },
  ];
  static List billPayData=[
    {
      "ads_image":"assets/Electricity.png",
      "ads_title":"Electricity",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Gas.png",
      "ads_title":"Gas",
      "ads_id": "23"
    },
    // {
    //   "ads_image":"assets/Water.png",
    //   "ads_title":"Water",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/location.png",
    //   "ads_title":"Insurance",
    //   "ads_id": "23"
    // },
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },
    // {
    //   "ads_image":"assets/creditcard.png",
    //   "ads_title":"Credit Card",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/Donation.png",
    //   "ads_title":"Donation",
    //   "ads_id": "23"
    // },
    {
      "ads_image":"assets/Fees.png",
      "ads_title":"Fees",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Shopping.png",
      "ads_title":"Shopping",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Other Bills.png",
      "ads_title":"Other Bills",
      "ads_id": "23"
    },

  ];
  static List rechargeData=[
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Data Card.png",
      "ads_title":"Data Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },

  ];
}

class Corporate{
  static List receivedData=[];
  static var userName="Mr. Mani";
  static var cash="\$1,33,236.35";
  static var user_acc="Savings *******2215";
  static var banner="assets/banners/corporate.png";
  static Color uiColor = Color(0xFF0f1d8d);
  static Color navMenuColor = Colors.deepPurple.shade200;
  static var userAccountNumber;
  static var savingsAmount;
  static var userProfilePic;

  static List eShopPageData=[

    {
      "id": 345343,
      "title": "Shop",
      "image": "assets/shop.png",
      "path": "/ShopPage",
      "type": "button"
    },

  ];
  static List quickAccessData=[
    {
      "id": 345343,
      "title": "Fund Transfer",
      "image": "assets/Money-Transfer.png",
      "path": "/MoneyTransfer",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Loan and Card Offers",
      "image": "assets/loan.png",
      "path": "/LoanPage",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Book tickets",
      "image": "assets/booking.png",
      "path": "/BookTickets",
      "type": "button"
    },
  ];
  static List dashboardButtons=[
    {
      "id": 234232,
      "title": "Cards",
      "image": "assets/credit_Cards.png",
      "path": "/CardPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Loan",
      "image": "assets/loan.png",
      "path": "/LoanPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Insurance",
      "image": "assets/insurance-policy.png",
      "path": "/InsurancePage",
      "type": "banner"
    },
    {
      "id": 345343,
      "title": "Account",
      "image": "assets/account.png",
      "path": "/AccountPage",
      "type": "banner"
    },
    // {
    //   "id": 234232,
    //   "title": "E-Shop",
    //   "image": "assets/ecommerce.png",
    //   "path": "/EShopPage",
    //   "type": "banner"
    // },
  ];
  static List cardsPageDatas=[
    {
      "id": 345343,
      "title": "Credit Card",
      "image": "assets/debitCard.png",
      "path": "/CreditCard",
      "type": "button"
    },
  ];
  static List loanPageData=[

    {
      "id": 345343,
      "title": "Business Loan",
      "image": "assets/VB_Business loan.png",
      "path": "/BusinessLoan",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Vehicle Loan",
      "image": "assets/VB_Vehicle loan.png",
      "path": "/VehicleLoan",
      "type": "button"
    },
  ];
  static List insurancePageData=[
    {
      "id": 345343,
      "title": "Travel Insurance",
      "image": "assets/VB_Travel Insurance.png",
      "path": "/TravelInsurance",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Property Insurance",
      "image": "assets/VB_Property Insurance.png",
      "path": "/PropertyInsurance",
      "type": "button"
    },
  ];
  static List accountPageData=[
    {
      "id": 345343,
      "title": "Corporate Account",
      "image": "assets/VB_Corporate account.png",
      "path": "/CorporateAccount",
      "type": "button"
    },
  ];
  static List dashboardAdsData=[
    // {
    //   "ads_image":"assets/flipkartLogo.png",
    //   "ads_title":"Flipkart",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/amazonLogo.png",
    //   "ads_title":"Amazon",
    //   "ads_id": "24"
    // },
    // {
    //   "ads_image":"assets/myntra.png",
    //   "ads_title":"Myntra",
    //   "ads_id": "25"
    // },
    {
      "ads_image":"assets/redbus.png",
      "ads_title":"Redbus",
      "ads_id": "26"
    },
    {
      "ads_image":"assets/AJIO.png",
      "ads_title":"AJIO",
      "ads_id": "27"
    },
    {
      "ads_image":"assets/irctc.png",
      "ads_title":"IRCTC",
      "ads_id": "28"
    },
  ];
  static var navigationMenuData=[
    {
      "drawerList_image":"assets/Home.png",
      "drawerList_text":"Dashboard",
      "drawerList_navigation":"/Dashboard",
      "drawerList_id": "23"
    },

    {
      "drawerList_image":"assets/credit_Cards.png",
      "drawerList_text":"Cards",
      "drawerList_navigation":"/CardPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/loan.png",
      "drawerList_text":"Loan",
      "drawerList_navigation":"/LoanPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/insurance-policy.png",
      "drawerList_text":"Insurance",
      "drawerList_navigation":"/InsurancePage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/account.png",
      "drawerList_text":"Account",
      "drawerList_navigation":"/AccountPage",
      "drawerList_id": "23"
    },
    // {
    //   "drawerList_image":"assets/ecommerce.png",
    //   "drawerList_text":"E-Shop",
    //   "drawerList_navigation":"/EShopPage",
    //   "drawerList_id": "23"
    // },
    {
      "drawerList_image":"assets/forms.png",
      "drawerList_text":"Form",
      "drawerList_navigation":"/Sampleform",
      "drawerList_id": "23"
    },
    // {
    //   "drawerList_image":"assets/about.png",
    //   "drawerList_text":"About",
    //   "drawerList_navigation":"/Certification",
    //   "drawerList_id": "23"
    // },

  ];
  static List addPayeeData=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Bank Accounts",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/creditcard.png",
      "ads_title":"Credit Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Cardless Cash.png",
      "ads_title":"Cardless Cash",
      "ads_id": "23"
    },

  ];
  static List billPayData=[
    {
      "ads_image":"assets/Electricity.png",
      "ads_title":"Electricity",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Gas.png",
      "ads_title":"Gas",
      "ads_id": "23"
    },
    // {
    //   "ads_image":"assets/Water.png",
    //   "ads_title":"Water",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/location.png",
    //   "ads_title":"Insurance",
    //   "ads_id": "23"
    // },
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },
    // {
    //   "ads_image":"assets/creditcard.png",
    //   "ads_title":"Credit Card",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/Donation.png",
    //   "ads_title":"Donation",
    //   "ads_id": "23"
    // },
    {
      "ads_image":"assets/Fees.png",
      "ads_title":"Fees",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Shopping.png",
      "ads_title":"Shopping",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Other Bills.png",
      "ads_title":"Other Bills",
      "ads_id": "23"
    },

  ];
  static List rechargeData=[
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Data Card.png",
      "ads_title":"Data Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },

  ];

}

class SeniorCitizen{
  static List receivedData=[];
  static var userName="Mr. Gopal";
  static var cash="\$65,236.75";
  static var user_acc="Savings *******2217";
  static var banner="assets/banners/seniorCitizen.png";
  static Color uiColor = Color(0xFFfc6a00);
  static Color navMenuColor = Colors.orange.shade200;
  static var userAccountNumber;
  static var savingsAmount;
  static var userProfilePic;

  static List depositPageData=[

    {
      "id": 345343,
      "title": "FD",
      "image": "assets/Add Money.png",
      "path": "/FdPage",
      "type": "button"
    },

  ];
  static List loanPageData=[
    {
      "id": 345343,
      "title": "Gold Loan",
      "image": "assets/goldLoan.png",
      "path": "/GoldLoanPage",
      "type": "button"
    },
  ];
  static List cardPageData=[

    {
      "id": 345343,
      "title": "Debit Card",
      "image": "assets/debitCard.png",
      "path": "/DebitCard",
      "type": "button"
    },

  ];
  static List accountPageData=[
    {
      "id": 345343,
      "title": "Savings Account",
      "image": "assets/savingsAccount.png",
      "path": "/SavingsAccount",
      "type": "button"
    },

  ];
  static List insurancePageData=[

    {
      "id": 345343,
      "title": "Term Insurance",
      "image": "assets/VB_Term Insurance.png",
      "path": "/TermInsurance",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Health Insurance",
      "image": "assets/healthInsurance.png",
      "path": "/HealthInsurance",
      "type": "button"
    },

  ];

  static List quickAccessData=[
    {
      "id": 345343,
      "title": "Fund Transfer",
      "image": "assets/Money-Transfer.png",
      "path": "/MoneyTransfer",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "Account Statement",
      "image": "assets/accountStatement.png",
      "path": "/AccountStatementPage",
      "type": "button"
    },
    {
      "id": 345343,
      "title": "FD/RD",
      "image": "assets/Add Money.png",
      "path": "/FdPage",
      "type": "button"
    },
  ];
  static List dematPageData=[
    {
      "id": 345343,
      "title": "Mutual Fund",
      "image": "assets/mutualFunds.png",
      "path": "/MutualFundsPage",
      "type": "button"
    },
  ];
  static List eShopPageData=[

    {
      "id": 345343,
      "title": "Shop",
      "image": "assets/shop.png",
      "path": "/ShopPage",
      "type": "button"
    },

  ];

  static List dashboardButtons=[
    {
      "id": 234232,
      "title": "Deposit",
      "image": "assets/bank_deposit.png",
      "path": "/DepositPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Cards",
      "image": "assets/credit_Cards.png",
      "path": "/CardPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Loan",
      "image": "assets/loan.png",
      "path": "/LoanPage",
      "type": "banner"
    },
    {
      "id": 234232,
      "title": "Insurance",
      "image": "assets/insurance-policy.png",
      "path": "/InsurancePage",
      "type": "banner"
    },
    {
      "id": 345343,
      "title": "Demat Account",
      "image": "assets/joint-account.png",
      "path": "/DematAccount",
      "type": "button"
    },
    {
      "id": 234232,
      "title": "Account",
      "image": "assets/account.png",
      "path": "/AccountPage",
      "type": "banner"
    },
    // {
    //   "id": 234232,
    //   "title": "E-Shop",
    //   "image": "assets/ecommerce.png",
    //   "path": "/EShopPage",
    //   "type": "banner"
    // },
  ];
  static List dashboardAdsData=[
    // {
    //   "ads_image":"assets/flipkartLogo.png",
    //   "ads_title":"Flipkart",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/amazonLogo.png",
    //   "ads_title":"Amazon",
    //   "ads_id": "24"
    // },
    // {
    //   "ads_image":"assets/myntra.png",
    //   "ads_title":"Myntra",
    //   "ads_id": "25"
    // },
    {
      "ads_image":"assets/redbus.png",
      "ads_title":"Redbus",
      "ads_id": "26"
    },
    {
      "ads_image":"assets/AJIO.png",
      "ads_title":"AJIO",
      "ads_id": "27"
    },
    {
      "ads_image":"assets/irctc.png",
      "ads_title":"IRCTC",
      "ads_id": "28"
    },
  ];
  static var navigationMenuData=[
    {
      "drawerList_image":"assets/Home.png",
      "drawerList_text":"Dashboard",
      "drawerList_navigation":"/Dashboard",
      "drawerList_id": "23"
    },

    {
      "drawerList_image":"assets/bank_deposit.png",
      "drawerList_text":"Deposit",
      "drawerList_navigation":"/DepositPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/credit_Cards.png",
      "drawerList_text":"Cards",
      "drawerList_navigation":"/CardPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/loan.png",
      "drawerList_text":"Loan",
      "drawerList_navigation":"/LoanPage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/insurance-policy.png",
      "drawerList_text":"Insurance",
      "drawerList_navigation":"/InsurancePage",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/investment.png",
      "drawerList_text":"Demat Account",
      "drawerList_navigation":"/DematAccount",
      "drawerList_id": "23"
    },
    {
      "drawerList_image":"assets/account.png",
      "drawerList_text":"Account",
      "drawerList_navigation":"/AccountPage",
      "drawerList_id": "23"
    },
    // {
    //   "drawerList_image":"assets/ecommerce.png",
    //   "drawerList_text":"E-Shop",
    //   "drawerList_navigation":"/EShopPage",
    //   "drawerList_id": "23"
    // },
    {
      "drawerList_image":"assets/forms.png",
      "drawerList_text":"Form",
      "drawerList_navigation":"/Sampleform",
      "drawerList_id": "23"
    },
    // {
    //   "drawerList_image":"assets/about.png",
    //   "drawerList_text":"About",
    //   "drawerList_navigation":"/Certification",
    //   "drawerList_id": "23"
    // },

  ];
  static List addPayeeData=[
    {
      "ads_image":"assets/bankaccount.png",
      "ads_title":"Bank Accounts",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/creditcard.png",
      "ads_title":"Credit Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Cardless Cash.png",
      "ads_title":"Cardless Cash",
      "ads_id": "23"
    },

  ];
  static List billPayData=[
    {
      "ads_image":"assets/Electricity.png",
      "ads_title":"Electricity",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Gas.png",
      "ads_title":"Gas",
      "ads_id": "23"
    },
    // {
    //   "ads_image":"assets/Water.png",
    //   "ads_title":"Water",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/location.png",
    //   "ads_title":"Insurance",
    //   "ads_id": "23"
    // },
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },
    // {
    //   "ads_image":"assets/creditcard.png",
    //   "ads_title":"Credit Card",
    //   "ads_id": "23"
    // },
    // {
    //   "ads_image":"assets/Donation.png",
    //   "ads_title":"Donation",
    //   "ads_id": "23"
    // },
    {
      "ads_image":"assets/Fees.png",
      "ads_title":"Fees",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Shopping.png",
      "ads_title":"Shopping",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Other Bills.png",
      "ads_title":"Other Bills",
      "ads_id": "23"
    },

  ];
  static List rechargeData=[
    {
      "ads_image":"assets/Mobile.png",
      "ads_title":"Mobile",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/Data Card.png",
      "ads_title":"Data Card",
      "ads_id": "23"
    },
    {
      "ads_image":"assets/DTH.png",
      "ads_title":"DTH",
      "ads_id": "23"
    },

  ];

}

