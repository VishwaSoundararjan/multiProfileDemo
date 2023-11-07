import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visioneducation/cutom_Widgets/dashboard_widget.dart';

class ButtonWidget extends StatefulWidget {

  final String widget_Type;
  final String widget_Title;
  final String widget_Image;
  final String routing_Path;
  final String id;

  ButtonWidget({
    required this.widget_Type,
    required this.widget_Title,
    required this.widget_Image,
    required this.routing_Path,
    required this.id,
  });

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height:100 ,
      child:Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(widget.routing_Path);
            },
            child: Container(
              //color: Colors.blue,
              decoration: DataClass.dashboardButtons.length == 4 ?
              BoxDecoration(
                  border: Border.all(
                    color: DataClass.uiColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16.h))
              ) : null,
              margin: EdgeInsets.fromLTRB(0,0,0,0),
              height: 69.h,
              width: 90.h,
              child:Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        widget.widget_Image,
                        height:39.h,
                        width: 39.h,
                      ),
                    ),
                    Text(widget.widget_Title,style: TextStyle(fontSize: 12.w)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class AdsWidget extends StatefulWidget {

  final List ads_list;
  late var  ads_image;
  late var ads_title;

  AdsWidget({
    required this.ads_list,
  });
  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.fromLTRB(0, 7.h,0,0,),
      child: Column(
        children: [
          Text("Shopping",style: TextStyle(fontWeight: FontWeight.bold),),
          Text("Get upto 10x rewards or 10% cashback"),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: List.generate(widget.ads_list.length, (index) {
              return Container(

                margin: EdgeInsets.fromLTRB(0,7.h,0,0),
                child: Column(
                    children:  [
                      Image.asset(widget.ads_list[index]['ads_image'],height:40.h,width:40.h,),
                      Text(widget.ads_list[index]['ads_title'])
                    ],
                  ),
              );
            }
            ),
          ),

        ],
      ),
    );
  }
}
//
// Wrap(
// runSpacing: runSpacing,
// spacing: spacing,
// alignment: WrapAlignment.center,
// children: List.generate(widget.ads_list.length, (index) {
// return Container(
// color: Colors.green[200],
// child:GridView.count(
// crossAxisCount: 3,
// crossAxisSpacing: 0.0,
// mainAxisSpacing: 0.0,
// shrinkWrap: true,
// children:  [
// Image.asset(widget.ads_list[index]['ads_image'],height:50,width:50,),
// Text(widget.ads_list[index]['ads_title'])
// ],
// ),);
// }),
// ),