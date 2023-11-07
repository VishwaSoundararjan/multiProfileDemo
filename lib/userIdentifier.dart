import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visioneducation/user_ram/dashboard1.dart';

import 'cutom_Widgets/dashboard_widget.dart';
import 'main.dart';

class UserIdentifier{
  static userIdentifier(bool navFlag) async {

    final SharedPreferences shared = await SharedPreferences.getInstance();
    User.isLogin = (shared.getBool('login') ?? false);
    if (User.isLogin) {
      User.user = shared.getString("userId").toString();

      switch (User.user) {
        case "student@gmail.com":
          {
            DataClass.receivedData = UserRam.rechargeData;
            DataClass.dashboardButtons = UserRam.dashboardButtons;
            DataClass.dashboardAdsData = UserRam.dashboardAdsData;
            DataClass.navigationMenuData = UserRam.navigationMenuData;
            DataClass.addPayeeData = UserRam.addPayeeData;
            DataClass.billPayData = UserRam.billPayData;
            DataClass.rechargeData = UserRam.rechargeData;
            DataClass.userName = UserRam.userName;
            DataClass.cash=UserRam.cash;
            DataClass.user_acc=UserRam.user_acc;
            DataClass.uiColor = UserRam.uiColor;
            DataClass.navMenuColor = UserRam.navMenuColor;
            DataClass.banner = UserRam.banner;

            DataClass.loanPageData = UserRam.loanPageData;
            DataClass.depositPageData = UserRam.depositPageData;
            DataClass.cardPageData = UserRam.cardPageData;
            DataClass.eShopPageData = UserRam.eShopPageData;
            DataClass.accountPageData = UserRam.accountPageData;
            DataClass.insurancePageData = UserRam.insurancePageData;
            DataClass.quickAccessData = UserRam.quickAccessData;

            if(navFlag){
              Navigator.pushReplacement(User.context,
                  MaterialPageRoute(builder: (context) => const MyAppp1()));
            }

            break;
          }

        case "homemaker@gmail.com":
          {
            DataClass.receivedData = Userfarook.rechargeData;
            DataClass.dashboardButtons = Userfarook.dashboardButtons;
            DataClass.dashboardAdsData = Userfarook.dashboardAdsData;
            DataClass.navigationMenuData = Userfarook.navigationMenuData;
            DataClass.addPayeeData = Userfarook.addPayeeData;
            DataClass.billPayData = Userfarook.billPayData;
            DataClass.rechargeData = Userfarook.rechargeData;
            DataClass.userName = Userfarook.userName;
            DataClass.cash=Userfarook.cash;
            DataClass.user_acc=Userfarook.user_acc;
            DataClass.uiColor = Userfarook.uiColor;
            DataClass.navMenuColor = Userfarook.navMenuColor;
            DataClass.banner = Userfarook.banner;
            DataClass.loanPageData = Userfarook.loanPageData;
            DataClass.depositPageData = Userfarook.depositPageData;
            DataClass.cardPageData = Userfarook.cardPageData;
            DataClass.eShopPageData = Userfarook.eShopPageData;
            DataClass.accountPageData = Userfarook.accountPageData;
            DataClass.insurancePageData = Userfarook.insurancePageData;
            DataClass.quickAccessData = Userfarook.quickAccessData;

            if(navFlag){
              Navigator.pushReplacement(User.context,
                  MaterialPageRoute(builder: (context) => const MyAppp1()));
            }
            break;
          }
        case "corporate@gmail.com":
          {
            DataClass.receivedData = Corporate.rechargeData;
            DataClass.dashboardButtons = Corporate.dashboardButtons;
            DataClass.dashboardAdsData = Corporate.dashboardAdsData;
            DataClass.navigationMenuData = Corporate.navigationMenuData;
            DataClass.addPayeeData = Corporate.addPayeeData;
            DataClass.billPayData = Corporate.billPayData;
            DataClass.rechargeData = Corporate.rechargeData;
            DataClass.userName = Corporate.userName;
            DataClass.cash=Corporate.cash;
            DataClass.user_acc=Corporate.user_acc;
            DataClass.uiColor = Corporate.uiColor;
            DataClass.navMenuColor = Corporate.navMenuColor;
            DataClass.banner = Corporate.banner;
            DataClass.quickAccessData=Corporate.quickAccessData;
            DataClass.cardPageData=Corporate.cardsPageDatas;
            DataClass.loanPageData=Corporate.loanPageData;
            DataClass.insurancePageData=Corporate.insurancePageData;
            DataClass.accountPageData=Corporate.accountPageData;
            DataClass.eShopPageData=Corporate.eShopPageData;


            if(navFlag){
              Navigator.pushReplacement(User.context,
                  MaterialPageRoute(builder: (context) => const MyAppp1()));
            }
            break;
          }
        case "professional@gmail.com":
          {
            DataClass.receivedData = Professional.rechargeData;
            DataClass.dashboardButtons = Professional.dashboardButtons;
            DataClass.dashboardAdsData = Professional.dashboardAdsData;
            DataClass.navigationMenuData = Professional.navigationMenuData;
            DataClass.addPayeeData = Professional.addPayeeData;
            DataClass.billPayData = Professional.billPayData;
            DataClass.rechargeData = Professional.rechargeData;
            DataClass.userName = Professional.userName;
            DataClass.cash=Professional.cash;
            DataClass.user_acc=Professional.user_acc;
            DataClass.uiColor = Professional.uiColor;
            DataClass.navMenuColor = Professional.navMenuColor;
            DataClass.banner =  Professional.banner;
            DataClass.quickAccessData=Professional.quickAccessData;
            DataClass.loanPageData=Professional.loanPageData;
            DataClass.depositPageData=Professional.depositPageData;
            DataClass.cardPageData=Professional.cardPageData;
            DataClass.insurancePageData=Professional.insurancePageData;
            DataClass.eShopPageData=Professional.eShopPageData;
            DataClass.accountPageData=Professional.accountPageData;
            DataClass.dematPageData=Professional.dematPageData;
            if(navFlag){
              Navigator.pushReplacement(User.context,
                  MaterialPageRoute(builder: (context) => const MyAppp1()));
            }
            break;
          }
        case "seniorcitizen@gmail.com":
          {
            DataClass.receivedData = SeniorCitizen.rechargeData;
            DataClass.dashboardButtons = SeniorCitizen.dashboardButtons;
            DataClass.dashboardAdsData = SeniorCitizen.dashboardAdsData;
            DataClass.navigationMenuData = SeniorCitizen.navigationMenuData;
            DataClass.addPayeeData = SeniorCitizen.addPayeeData;
            DataClass.billPayData = SeniorCitizen.billPayData;
            DataClass.rechargeData = SeniorCitizen.rechargeData;
            DataClass.userName = SeniorCitizen.userName;
            DataClass.cash=SeniorCitizen.cash;
            DataClass.user_acc=SeniorCitizen.user_acc;
            DataClass.uiColor = SeniorCitizen.uiColor;
            DataClass.navMenuColor = SeniorCitizen.navMenuColor;
            DataClass.banner = SeniorCitizen.banner;
            DataClass.depositPageData =SeniorCitizen.depositPageData;
            DataClass.loanPageData =SeniorCitizen.loanPageData;
            DataClass.cardPageData =SeniorCitizen.cardPageData;
            DataClass.insurancePageData =SeniorCitizen.insurancePageData;
            DataClass.quickAccessData =SeniorCitizen.quickAccessData;
            DataClass.dematPageData=SeniorCitizen.dematPageData;
            DataClass.eShopPageData =SeniorCitizen.eShopPageData;
            DataClass.accountPageData =SeniorCitizen.accountPageData;
            if(navFlag){
              Navigator.pushReplacement(User.context,
                  MaterialPageRoute(builder: (context) => const MyAppp1()));
            }
            break;
          }
        case "sme@gmail.com":
          {
            DataClass.receivedData = SME.rechargeData;
            DataClass.dashboardButtons = SME.dashboardButtons;
            DataClass.dashboardAdsData = SME.dashboardAdsData;
            DataClass.navigationMenuData = SME.navigationMenuData;
            DataClass.addPayeeData = SME.addPayeeData;
            DataClass.billPayData = SME.billPayData;
            DataClass.rechargeData = SME.rechargeData;
            DataClass.userName = SME.userName;
            DataClass.cash=SME.cash;
            DataClass.user_acc=SME.user_acc;
            DataClass.uiColor = SME.uiColor;
            DataClass.navMenuColor = SME.navMenuColor;
            DataClass.banner = SME.banner;

            DataClass.loanPageData = SME.loanPageData;
            DataClass.depositPageData = SME.depositPageData;
            DataClass.cardPageData = SME.cardPageData;
            DataClass.eShopPageData = SME.eShopPageData;
            DataClass.accountPageData = SME.accountPageData;
            DataClass.insurancePageData = SME.insurancePageData;
            DataClass.quickAccessData = SME.quickAccessData;

            if(navFlag){
              Navigator.pushReplacement(User.context,
                  MaterialPageRoute(builder: (context) => const MyAppp1()));
            }

            break;
          }
        default:
          {
            print("User not recognised!!!");
          }
      }
    }

  }
  static loadUserData(){

    print("user data loader called!!!");
    DataClass.dashboardButtons = ModalClass.dashboardButtons;
    DataClass.dashboardAdsData = ModalClass.dashboardAdsData;
    DataClass.navigationMenuData = ModalClass.navigationMenuData;
    DataClass.userName = ModalClass.userName;
    DataClass.cash=ModalClass.amountInAccount;
    DataClass.user_acc=ModalClass.accNumber;
    DataClass.uiColor = ModalClass.themeName;
    DataClass.navMenuColor = ModalClass.subThemeName;
    DataClass.banner = ModalClass.banner;

    DataClass.loanPageData = ModalClass.loanPageData;
    DataClass.depositPageData = ModalClass.depositPageData;
    DataClass.cardPageData = ModalClass.cardPageData;
    DataClass.eShopPageData = ModalClass.eShopPageData;
    DataClass.accountPageData = ModalClass.accountPageData;
    DataClass.insurancePageData = ModalClass.insurancePageData;
    DataClass.quickAccessData = ModalClass.quickAccessData;


    // print("UserName: ${DataClass.userName}");
    // print("useracc: ${DataClass.user_acc}");
    // print("userAmount: ${DataClass.cash}");
    // print("Banner: ${DataClass.banner}");
    // print("quickAccess: ${DataClass.quickAccessData}");
    // print("Menu: ${DataClass.dashboardButtons}");
    // print("deposit: ${DataClass.depositPageData}");
    // print("cards: ${DataClass.cardPageData}");
    // print("loan: ${DataClass.loanPageData}");
    // print("eshop: ${DataClass.eShopPageData}");
    // print("account: ${DataClass.accountPageData}");
    // print("insurance: ${DataClass.insurancePageData}");
    // print("Navigation: ${DataClass.navigationMenuData}");

    if(User.navFlag){
      Navigator.pushReplacement(User.context,
          MaterialPageRoute(builder: (context) => const MyAppp1()));
    }

  }
  static clearUserData(){
    DataClass.dashboardButtons = EmptyClass.dashboardButtons;
    DataClass.dashboardAdsData = EmptyClass.dashboardAdsData;
    DataClass.navigationMenuData = EmptyClass.navigationMenuData;
    DataClass.userName = EmptyClass.userName;
    DataClass.cash=EmptyClass.cash;
    DataClass.user_acc=EmptyClass.user_acc;
    DataClass.uiColor = EmptyClass.uiColor;
    DataClass.navMenuColor = EmptyClass.navMenuColor;
    DataClass.banner = EmptyClass.banner;

    DataClass.loanPageData = EmptyClass.loanPageData;
    DataClass.depositPageData = EmptyClass.depositPageData;
    DataClass.cardPageData = EmptyClass.cardPageData;
    DataClass.eShopPageData = EmptyClass.eShopPageData;
    DataClass.accountPageData = EmptyClass.accountPageData;
    DataClass.insurancePageData = EmptyClass.insurancePageData;
    DataClass.quickAccessData = EmptyClass.quickAccessData;

  }

}