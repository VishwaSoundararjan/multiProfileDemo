import 'package:flutter/material.dart';


class ConstData {

  /**
    Assigning UiTheme
   */
  static Map<String, Color> themeColors = {
    'theme1': Color(0xFF009bdf),//student
    'subTheme1': Colors.lightBlue.shade200,
    'theme2': Color(0xFFc2392c),//homemaker
    'subTheme2': Colors.red.shade200,
    'theme3': Colors.deepPurple,//Professional
    'subTheme3': Colors.deepPurple.shade200,
    'theme4':  Color(0xFF0f1d8d),//corporate
    'subTheme4':  Colors.indigo.shade200,
    'theme5':  Color(0xFFfc6a00),//seniorCitizen
    'subTheme5': Colors.orange.shade200,
    'theme6': Color(0xFFdfb82b),//sme
    'subTheme6': Colors.yellow.shade200,
    // Add more theme color mappings here if needed
  };



  static Color theme1= Color(0xFF009bdf);
  static Color subTheme1= Colors.lightBlue.shade200;
  static Color theme2= Color(0xFFc2392c);
  static Color subTheme2= Colors.red.shade200;
  static Color theme3= Colors.deepPurple;
  static Color subTheme3= Colors.deepPurple.shade200;
  static Color theme4= Color(0xFF0f1d8d);
  static Color subTheme4= Colors.deepPurple.shade200;
  static Color theme5= Color(0xFFfc6a00);
  static Color subTheme5= Colors.orange.shade200;
  static Color theme6= Color(0xFFdfb82b);
  static Color subTheme6= Colors.yellow.shade200;
  /**
     Assigning banner
   */
  static Map banners = {
    'banner1': "assets/banners/student.png",
    'banner2': "assets/banners/homemaker.png",
    'banner3': "assets/banners/professional.png",
    'banner4': "assets/banners/corporate.png",
    'banner5': "assets/banners/seniorCitizen.png",
    'banner6': "assets/SME-1.png",
    // Add more theme banner mappings here if needed
  };
  static var banner1="assets/banners/student.png";
  static var banner2="assets/banners/homemaker.png";
  static var banner3="assets/banners/professional.png";
  static var banner4="assets/banners/corporate.png";
  static var banner5="assets/banners/seniorCitizen.png";
  static var banner6="assets/SME-1.png";
  /**
      Assigning userProfile
   */
  static String userProfile1="assets/ram_profile.png";
  /**
     Assigning quickAccess data
   */
  static Map<String, Map<String, Object>> quickAccess= {
    "Scan and pay": {
      "id": 345343,
      "title": "Scan & pay",
      "image": "assets/Scanpay.png",
      "path": "/ScanToPay",
      "type": "button"
    },
    "Account overview":{
      "id": 345343,
      "title": "Account Overview",
      "image": "assets/loan.png",
      "path": "/AccountOverview",
      "type": "button"
    },
    "Recharge":{
      "id": 345343,
      "title": "Recharge",
      "image": "assets/shop.png",
      "path": "/RechargePage",
      "type": "button"
    },
    "Shop":{
      "id": 345343,
      "title": "Shop",
      "image": "assets/shop.png",
      "path": "/ShopPage",
      "type": "button"
    },
   "Loan and card offers":{
      "id": 345343,
      "title": "Offers",
      "image": "assets/loan.png",
      "path": "/LoanPage",
      "type": "button"
    },
   "Demat": {
      "id": 345343,
      "title": "Demat",
      "image": "assets/joint-account.png",
      "path": "/MutualFundsPage",
      "type": "button"
    },
    "Funds Transfer": {
      "id": 345343,
      "title": "Fund Transfer",
      "image": "assets/Money-Transfer.png",
      "path": "/MoneyTransfer",
      "type": "button"
    },
    "Book tickets": {
      "id": 345343,
      "title": "Book tickets",
      "image": "assets/booking.png",
      "path": "/BookTickets",
      "type": "button"
    },
    "Account Statement":  {
      "id": 345343,
      "title": "Account Statement",
      "image": "assets/accountStatement.png",
      "path": "/AccountStatementPage",
      "type": "button"
    },
    "FD/RD": {
      "id": 345343,
      "title": "FD/RD",
      "image": "assets/Add Money.png",
      "path": "/FdPage",
      "type": "button"
    },

  };
  /**
      Assigning menu data
   */
  static Map<String, Map<String, Object>> menus= {
  "Deposit":{
    "id": 234232,
    "title": "Deposit",
    "image": "assets/bank_deposit.png",
    "path": "/DepositPage",
    "type": "banner"
  },

  "Cards":{
    "id": 234232,
    "title": "Cards",
    "image": "assets/credit_Cards.png",
    "path": "/CardPage",
    "type": "banner"
  },
  "Loan": {
    "id": 234232,
    "title": "Loan",
    "image": "assets/loan.png",
    "path": "/LoanPage",
    "type": "banner"
  },
  "Insurance": {
    "id": 234232,
    "title": "Insurance",
    "image": "assets/insurance-policy.png",
    "path": "/InsurancePage",
    "type": "banner"
  },
  "Account": {
    "id": 234232,
    "title": "Account",
    "image": "assets/account.png",
    "path": "/AccountPage",
    "type": "banner"
  },
  "E-Shop":{
    "id": 234232,
    "title": "E-Shop",
    "image": "assets/shop.png",
    "path": "/ShopPage",
    "type": "banner"
  },
};
  /**
      Assigning component data
   */
  static var components= {

  "RD": {
    "id": 345343,
    "title": "RD",
    "image": "assets/VB_Recurring Deposit(RD).png",
    "path": "/RdPage",
    "type": "button"
  },
    "FD":  {
      "id": 345343,
      "title": "FD",
      "image": "assets/Add Money.png",
      "path": "/FdPage",
      "type": "button"
    },
    "Mutual fund":{
      "id": 234232,
      "title": "Mutual fund",
      "image": "assets/mutualFunds.png",
      "path": "/MutualFundsPage",
      "type": "banner"
    },
  "Debit Card": {
    "id": 345343,
    "title": "Debit Card",
    "image": "assets/debitCard.png",
    "path": "/DebitCard",
    "type": "button"
  },
    "Credit Card": {
      "id": 345343,
      "title": "Credit Card",
      "image": "assets/debitCard.png",
      "path": "/CreditCard",
      "type": "button"
    },
  "Shop": {
    "id": 345343,
    "title": "Shop",
    "image": "assets/shop.png",
    "path": "/ShopPage",
    "type": "button"
  },
  "Savings Account":  {
    "id": 345343,
    "title": "Savings Account",
    "image": "assets/savingsAccount.png",
    "path": "/SavingsAccount",
    "type": "button"
  },
    "Current Account": {
      "id": 345343,
      "title": "Current Account",
      "image": "assets/VB_Current account.png",
      "path": "/CurrentAccount",
      "type": "button"
    },
    "Corporate Account": {
      "id": 345343,
      "title": "Salary Account",
      "image": "assets/VB_Corporate account.png",
      "path": "/CorporateAccount",
      "type": "button"
    },
  "Health Insurance": {
    "id": 345343,
    "title": "Health Insurance",
    "image": "assets/VB_Health Insurance.png",
    "path": "/HealthInsurance",
    "type": "button"
    },
    "Term Insurance":  {
      "id": 345343,
      "title": "Term Insurance",
      "image": "assets/VB_Term Insurance.png",
      "path": "/TermInsurance",
      "type": "button"
    },
  "Travel Insurance":  {
    "id": 345343,
    "title": "Travel Insurance",
    "image": "assets/VB_Travel Insurance.png",
    "path": "/TravelInsurance",
    "type": "button"
  },
    "Property Insurance": {
      "id": 345343,
      "title": "Property Insurance",
      "image": "assets/VB_Property Insurance.png",
      "path": "/PropertyInsurance",
      "type": "button"
    },
    "Vehicle Insurance": {
      "id": 345343,
      "title": "Vehicle Insurance",
      "image": "assets/healthInsurance.png",
      "path": "/HealthInsurance",
      "type": "button"
    },
    "Educational Loan": {
      "id": 345343,
      "title": "Educational Loan",
      "image": "assets/VB_Educational loan.png",
      "path": "/EducationalLoan",
      "type": "button"
    },
    "Personal Loan": {
      "id": 345343,
      "title": "Personal Loan",
      "image": "assets/personalLoan.png",
      "path": "/PersonalLoan",
      "type": "button"
    },
    "Gold Loan": {
      "id": 345343,
      "title": "Gold Loan",
      "image": "assets/goldLoan.png",
      "path": "/GoldLoanPage",
      "type": "button"
    },
    "Business Loan": {
      "id": 345343,
      "title": "Business Loan",
      "image": "assets/VB_Business loan.png",
      "path": "/BusinessLoan",
      "type": "button"
    },
    "Vehicle Loan": {
      "id": 345343,
      "title": "Vehicle Loan",
      "image": "assets/VB_Vehicle loan.png",
      "path": "/VehicleLoan",
      "type": "button"
    },
    "Cardless Cash":  {
      "id": 345343,
      "title": "CardlessCash",
      "image": "assets/cardlessCash.png",
      "path": "/CardlessCash",
      "type": "button"
    },
};
  /**
      Assigning navigation Menu data
   */
  static var navigationMenuData={
   "Deposit": {
      "drawerList_image":"assets/bank_deposit.png",
      "drawerList_text":"Deposit",
      "drawerList_navigation":"/DepositPage",
      "drawerList_id": "23"
    },

    "Cards":{
      "drawerList_image":"assets/credit_Cards.png",
      "drawerList_text":"Cards",
      "drawerList_navigation":"/CardPage",
      "drawerList_id": "23"
    },
    "Loan": {
      "drawerList_image":"assets/loan.png",
      "drawerList_text":"Loan",
      "drawerList_navigation":"/LoanPage",
      "drawerList_id": "23"
    },
    "Insurance":  {
      "drawerList_image":"assets/insurance-policy.png",
      "drawerList_text":"Insurance",
      "drawerList_navigation":"/InsurancePage",
      "drawerList_id": "23"
    },
    "Account":{
      "drawerList_image":"assets/account.png",
      "drawerList_text":"Account",
      "drawerList_navigation":"/AccountPage",
      "drawerList_id": "23"
    },
    "Demat": {
      "drawerList_image":"assets/joint-account.png",
      "drawerList_text":"Demat Account",
      "drawerList_navigation":"/DematAccount",
      "drawerList_id": "23"
    },
    "E-Shop": {
      "drawerList_image":"assets/ecommerce.png",
      "drawerList_text":"E-Shop",
      "drawerList_navigation":"/EShopPage",
      "drawerList_id": "23"
    },

   };

}


Map<String, Map<String, Object>> Data={
  "student": {
    "personName": "Student",
    "appThemes": [
      {
        "themeName": "Theme 1",
        "themePreviewImage": "ImagePath"
      }
    ],
    "banner": "",
    "quickAccess": [
      "Acc overview",
      "Scan and pay",
      "Recharge"
    ],
  },
};



