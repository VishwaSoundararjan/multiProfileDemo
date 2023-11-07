
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visioneducation/userIdentifier.dart';

import 'const_variable/constVaribales.dart';
import 'cutom_Widgets/dashboard_widget.dart';
import 'main.dart';

class JsonLoader{

  static loadJson(data){
    print("Json loader called!!!");
    print("Received json body: $data");
    // var data = {
    //   "student": {
    //     "userData": [
    //       {
    //         "name": "Ram",
    //         "accountNumber": "2212",
    //         "amountInAccount": "5,470",
    //         "userProfile":"user1"
    //       }
    //     ],
    //     "appThemes": [
    //       {
    //         "themeName": "Theme 1",
    //         "subThemeName": "Theme 2",
    //         "themePreviewImage": "ImagePath"
    //       }
    //     ],
    //     "menus": [
    //       "Deposit",
    //       "Cards",
    //       "Loan",
    //       "Insurance",
    //       "Account",
    //       "E-Shop"
    //     ],
    //     "banner": "",
    //     "quickAccess": [
    //       "Acc overview",
    //       "Scan and pay",
    //       "Recharge"
    //     ],
    //     "pages": [
    //       {
    //         "pageName": "Deposit",
    //         "components": [
    //           "RD"
    //         ]
    //       },
    //       {
    //         "pageName": "Cards",
    //         "components": [
    //           "Debitcard"
    //         ]
    //       },
    //       {
    //         "pageName": "Loan",
    //         "components": [
    //           "Educationalloan"
    //         ]
    //       },
    //       {
    //         "pageName": "Insurance",
    //         "components": [
    //           "Healthinsurance",
    //           "Travelinsurance"
    //         ]
    //       },
    //       {
    //         "pageName": "Account",
    //         "components": [
    //           "Savingsaccount"
    //         ]
    //       },
    //       {
    //         "pageName": "E-Shop",
    //         "components": [
    //           "Shop"
    //         ]
    //       }
    //     ]
    //   }
    // };
//<----------------------------------------------------------------------->
    // Assign themeName and themePreviewImage from Data
    dynamic appThemes = data['appThemes'];

    /**
        Assigning UI Themes
     */
    if (appThemes is List && appThemes.isNotEmpty) {
      var themeName = appThemes[0]['themeName'];
      ModalClass.themeName= ConstData.themeColors[themeName] ?? Color(0xFF0f1d8d);
       //ModalClass.themeName = appThemes[0]?['themeName'] as dynamic;
      var subthemeName = appThemes[0]['subThemeName'];
      ModalClass.subThemeName= ConstData.themeColors[subthemeName] ?? Colors.indigo.shade200;
      //ModalClass.subThemeName = appThemes[0]?['subThemeName'] as dynamic;
      print("Theme :: ${ModalClass.themeName},${ModalClass.subThemeName}");
      ModalClass.themePrviewImage = appThemes[0]?['themePreviewImage'];
    }
    /**
        Assigning UserData and Banner Data
     */
    dynamic userData = data['userData'];
    if (userData is List && userData.isNotEmpty) {
      ModalClass.userName = userData[0]?['name'];
      ModalClass.accNumber = userData[0]?['accountNumber'];
      ModalClass.amountInAccount=userData[0]?['amountInAccount'];
      ModalClass.userProfile=userData[0]?['userProfile'];
    }
   // ModalClass.banner = data['student']?['banner'];
    var banner = data['banner'];
    ModalClass.banner= ConstData.banners[banner] ?? "assets/banner03.jpeg";
    print("Banner :: ${ModalClass.banner}");
    /**
        Assigning QuickAccess Data
     */
    List<dynamic>? quickAccessKeys = data['quickAccess'] as List<
        dynamic>?;
    for (var key in quickAccessKeys!) {
      if (ConstData.quickAccess.containsKey(key)) {
        var quickAccessValue = ConstData.quickAccess[key];
        if (!ModalClass.quickAccessData.contains(quickAccessValue)) {
          ModalClass.quickAccessData.add(quickAccessValue);
        }
      }
    }
    /**
        Assigning Menu and Navigation Menu Data
     */
    List<dynamic>? menuData = data['menus'] as List<
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
    /**
        Assigning Components data
     */
    var pages = data['pages'] as List<
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
            //ModalClass.dashboardButtons.add(menuItem);
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
              // Add the componentData to the targetList in ModalClass
              if(!targetList.contains(componentData))
                targetList.add(componentData);
            }
          }
        }
      }
    }

    UserIdentifier.loadUserData();
  }

}