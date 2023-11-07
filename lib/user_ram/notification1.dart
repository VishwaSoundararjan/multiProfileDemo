import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:refluttersdk/refluttersdk.dart';
import '../cutom_Widgets/dashboard_widget.dart';
import 'dashboard1.dart';
import 'mynavigator1.dart';

class NotificationPage1 extends StatefulWidget {
  const NotificationPage1({Key? key}) : super(key: key);

  @override
  State<NotificationPage1> createState() => _NotificationPage1State();
}
final _refluttersdkPlugin=Refluttersdk();

class _NotificationPage1State extends State<NotificationPage1> {
  

  List notifyList=[];
  int selectedIndex = -1;
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
    _refluttersdkPlugin.screentracking("Notification Page",context);
    NotificationDataClass.nCount=0;
    getNotificationList();
    setUnreadNotificationCount();
  }

  getNotificationList()  async {
    var nList=await _refluttersdkPlugin.getNotificationList();
    List<dynamic> jsonArray = json.decode(nList);
    notifyList = jsonArray;
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
          title:Row(
            children: [
            Image.asset(DataClass.visionLogo,height: 150,width: 150,),
          ],),
          backgroundColor: DataClass.uiColor,
        ),
      body: Scaffold(
        body: ListView.builder(
          itemCount: notifyList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index)=>Container(
            width: MediaQuery.of(context).size.width,
            margin:EdgeInsets.fromLTRB(5,5,5,5),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(8.0),
                //color: selectedIndex==index ? Colors.white70:Colors.white,
                color:DataClass.navMenuColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.indigo,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0,0.0), // shadow direction: bottom right
                  ),
                ],
              ),
            child:GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex=index;

                });
                _refluttersdkPlugin.readNotification(notifyList[index]["nameValuePairs"]["campaignId"]);
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5,5,5,5),
                    padding: EdgeInsets.fromLTRB(5,5,5,5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      //color: selectedIndex==index ? Colors.white70:Colors.white,
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.indigo,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(0.0,0.0), // shadow direction: bottom right
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Title :",style: TextStyle(fontWeight: FontWeight.bold,fontSize:18.0),),
                                Text(notifyList[index]['nameValuePairs']['title'],style:TextStyle(color: Colors.black,fontSize:16.0,)),
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,5,5,0),
                    padding: EdgeInsets.fromLTRB(5,5,5,5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      //color: selectedIndex==index ? Colors.white70:Colors.white,
                      color:Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.indigo,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(0.0,0.0), // shadow direction: bottom right
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Body :",style: TextStyle(fontWeight: FontWeight.bold,fontSize:18.0),),
                                Text(notifyList[index]['nameValuePairs']['body'],style:TextStyle(color: Colors.black,fontSize:16.0,),maxLines: 10,softWrap: true,),
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child:  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                _refluttersdkPlugin.readNotification(notifyList[index]["nameValuePairs"]["campaignId"]);
                                setUnreadNotificationCount();
                              }, child:Row(
                            children: [
                              Text("Read")
                            ],
                          )
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(onPressed: (){
                            _refluttersdkPlugin.readNotification(notifyList[index]["nameValuePairs"]["campaignId"]);
                            setUnreadNotificationCount();
                          }, child:Row(
                            children: [
                              Text("Un read")
                            ],
                          ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(onPressed: (){
                            _refluttersdkPlugin.deleteNotificationByCampaignId(notifyList[index]["nameValuePairs"]["campaignId"]);
                            setState(() {
                              notifyList.removeAt(index);
                            });
                            // getNotificationList();
                          }, child:Row(
                            children: [
                              Text("Delete")
                            ],
                          ),
                          ),
                        ],
                      ),
                    ) ,
                  )
                ],
              ),
            )
            ),
         ),
        ),
          endDrawer: MyNavigator1(),
      )
    );
  }
}


class NotificationDataClass {

  static List<NotificationDataClass> noficationData=[];
  static List campaignId=[],campaignTitle=[],campaignBody=[],customActionUrl=[],customActionPhone=[];
  static var nCount=0;
  late String notificationTitle;
  late String notificationBody;
  late String url;
  late String phone;
  NotificationDataClass({required this.notificationTitle,required this.notificationBody,required this.phone,required this.url});

  static Future<int> getNotificationCount() async {
    nCount=(await _refluttersdkPlugin.getUnReadNotificationCount())!;
    print("unReadNotificationCount :: $nCount");
    return nCount;
  }
  static setNotificationList()  async {
    var nList=await _refluttersdkPlugin.getNotificationList();

    List<dynamic> jsonArray = json.decode(nList);
    
    for (var jsonMap in jsonArray) {
      String campaignId = jsonMap['nameValuePairs']['campaignId'];
      if(NotificationDataClass.campaignId.length==0){
        NotificationDataClass.campaignId.add(campaignId);
      }
      else
      {

        if(!NotificationDataClass.campaignId.contains(campaignId)){
          NotificationDataClass.campaignId.add(campaignId);
        }
      }

      String title= jsonMap['nameValuePairs']['title'];
      if(NotificationDataClass.campaignTitle.length!=0){
        for (int i = 0; i <  NotificationDataClass.campaignTitle.length; i++) {
          if(NotificationDataClass.campaignId[i]!=campaignId){
            NotificationDataClass.campaignTitle.add(title);
          }
        }
      }
      else
        NotificationDataClass.campaignTitle.add(title);

      String body= jsonMap['nameValuePairs']['body'];
      if(NotificationDataClass.campaignBody.length!=0){
        for (int i = 0; i <   NotificationDataClass.campaignBody.length; i++) {
          if(NotificationDataClass.campaignBody[i]!=campaignId){
            NotificationDataClass.campaignBody.add(body);
          }
        }

      }
      else
        NotificationDataClass.campaignBody.add(body);

      String customActions = jsonArray[0]['nameValuePairs']['customActions'];
      List<dynamic> customActionsList = jsonDecode(customActions);
      for (var i = 0; i < customActionsList.length; i++) {
        if(i==0){
          String url = customActionsList[i]['url'];
          NotificationDataClass.customActionUrl.add(url);
        }
        else if(i==1){
          String phone = customActionsList[i]['url'];
          NotificationDataClass.customActionPhone.add(phone);
        }
        else
          break;
      }
    }
  }
}
