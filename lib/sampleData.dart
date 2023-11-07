//jsonLoader

// import 'const_variable/constVaribales.dart';
// import 'cutom_Widgets/dashboard_widget.dart';
//
// class JsonLoader{
//
//   static loadJson(data){
//     // var data = {
//     //   "student": {
//     //     "userData": [
//     //       {
//     //         "name": "Ram",
//     //         "accountNumber": "2212",
//     //         "amountInAccount": "5,470",
//     //         "userProfile":"user1"
//     //       }
//     //     ],
//     //     "appThemes": [
//     //       {
//     //         "themeName": "Theme 1",
//     //         "subThemeName": "Theme 2",
//     //         "themePreviewImage": "ImagePath"
//     //       }
//     //     ],
//     //     "menus": [
//     //       "Deposit",
//     //       "Cards",
//     //       "Loan",
//     //       "Insurance",
//     //       "Account",
//     //       "E-Shop"
//     //     ],
//     //     "banner": "",
//     //     "quickAccess": [
//     //       "Acc overview",
//     //       "Scan and pay",
//     //       "Recharge"
//     //     ],
//     //     "pages": [
//     //       {
//     //         "pageName": "Deposit",
//     //         "components": [
//     //           "RD"
//     //         ]
//     //       },
//     //       {
//     //         "pageName": "Cards",
//     //         "components": [
//     //           "Debitcard"
//     //         ]
//     //       },
//     //       {
//     //         "pageName": "Loan",
//     //         "components": [
//     //           "Educationalloan"
//     //         ]
//     //       },
//     //       {
//     //         "pageName": "Insurance",
//     //         "components": [
//     //           "Healthinsurance",
//     //           "Travelinsurance"
//     //         ]
//     //       },
//     //       {
//     //         "pageName": "Account",
//     //         "components": [
//     //           "Savingsaccount"
//     //         ]
//     //       },
//     //       {
//     //         "pageName": "E-Shop",
//     //         "components": [
//     //           "Shop"
//     //         ]
//     //       }
//     //     ]
//     //   }
//     // };
// //<----------------------------------------------------------------------->
//     // Assign themeName and themePreviewImage from Data
//     dynamic appThemes = data['student']?['appThemes'];
//     if (appThemes is List && appThemes.isNotEmpty) {
//       ModalClass.themeName = appThemes[0]?['themeName'];
//       ModalClass.subThemeName = appThemes[0]?['subThemeName'];
//       ModalClass.themePrviewImage = appThemes[0]?['themePreviewImage'];
//     }
// //<----------------------------------------------------------------------->
//     //accessing userData
//     dynamic userData = data['student']?['userData'];
//     if (userData is List && userData.isNotEmpty) {
//       ModalClass.userName = userData[0]?['name'];
//       ModalClass.accNumber = userData[0]?['accountNumber'];
//       ModalClass.amountInAccount=userData[0]?['amountInAccount'];
//       ModalClass.userProfile=userData[0]?['userProfile'];
//     }
//     // Assign banner from Data
//     ModalClass.banner = data['student']?['banner'];
// //<----------------------------------------------------------------------->
//     // Assign quickAccessData from Data and ConstData
//     List<dynamic>? quickAccessKeys = data['student']?['quickAccess'] as List<
//         dynamic>?;
//     for (var key in quickAccessKeys!) {
//       if (ConstData.quickAccess.containsKey(key)) {
//         var quickAccessValue = ConstData.quickAccess[key];
//         if (!ModalClass.quickAccessData.contains(quickAccessValue)) {
//           ModalClass.quickAccessData.add(quickAccessValue);
//         }
//       }
//     }
//     print("Modal class data: ${ModalClass.userName},${ModalClass
//         .quickAccessData}");
//     print("----------");
//     //<----------------------------------------------------------------------->
//     //for fetching menu data && navigation Menu data
//     List<dynamic>? menuData = data['student']?['menus'] as List<
//         dynamic>?;
//
//     for (var key in menuData!) {
//       if (ConstData.menus.containsKey(key)) {
//         var menuValue = ConstData.menus[key];
//         var navMenuValue = ConstData.navigationMenuData[key];
//         if (!ModalClass.dashboardButtons.contains(menuValue)) {
//           ModalClass.dashboardButtons.add(menuValue);
//           ModalClass.navigationMenuData.add(navMenuValue);
//         }
//       }
//     }
//     print("MenuData:: ${ModalClass.dashboardButtons}");    print("----------");
//     print("navMenuData:: ${ModalClass.navigationMenuData}");    print("----------");
//
//
//
//     // <----------------------------------------------------------------------->
//     var pages = data['student']!['pages'] as List<
//         dynamic>?;
//     var pageName;
//     // Check if pages is not null and is a List
//     if (pages is List) {
//       // Iterate over each page
//       for (var page in pages) {
//         // Check if the page contains the 'pageName' key
//         if (page.containsKey('pageName')) {
//           pageName = page['pageName'];
//           // Check if the pageName matches a key in the 'menus' map of ConstData
//           if (ConstData.menus.containsKey(pageName)) {
//             // Get the menu item for the matching pageName
//             var menuItem = ConstData.menus[pageName];
//             // Add the menuItem to the dashboardButtons list in ModalClass
//             ModalClass.dashboardButtons.add(menuItem);
//           }
//         }
//
//         // Check if the page contains the 'components' key
//         if (page.containsKey('components')) {
//           // Get the components list
//           var componentsList = page['components'];
//
//           // Iterate over each component
//           for (var component in componentsList) {
//             // Check if the component exists in the 'components' map of ConstData
//             if (ConstData.components.containsKey(component)) {
//               // Get the component data for the matching component key
//               var componentData = ConstData.components[component];
//
//               // Determine the target list based on the pageName
//               List targetList = [];
//               if (pageName == 'Deposit') {
//                 targetList = ModalClass.depositPageData;
//               } else if (pageName == 'Cards') {
//                 targetList = ModalClass.cardPageData;
//               } else if (pageName == 'Insurance') {
//                 targetList = ModalClass.insurancePageData;
//               } else if (pageName == 'E-Shop') {
//                 targetList = ModalClass.eShopPageData;
//               } else if (pageName == 'Account') {
//                 targetList = ModalClass.accountPageData;
//               }
//               else if (pageName == 'Loan') {
//                 targetList = ModalClass.loanPageData;
//               }
//               else if (pageName == 'Demat account') {
//                 targetList = ModalClass.dematPageData;
//               }
//               else if (pageName == 'Loan') {
//                 targetList = ModalClass.loanPageData;
//               }
//               // Add the componentData to the targetList in ModalClass
//               if(!targetList.contains(componentData))
//                 targetList.add(componentData);
//             }
//           }
//         }
//       }
//     }
//     print("Loans :: ${ModalClass.loanPageData}");    print("----------");
//   }
//
// }