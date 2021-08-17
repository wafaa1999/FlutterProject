import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {


  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
      bool show = false;
       final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
     key: _scaffoldkey,
        body: Column(children: [
           InkWell(
             onTap: (){
               
              setState(() {
      show =!show;
    });
             },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Text("wafaa"),
            ),
           ),
        
         

      //        show?Flushbar(
    
      // message: "المواعيد المسموح بادخالها ساعة وساعة ونص فقط",
      // flushbarPosition: FlushbarPosition.TOP,
      // flushbarStyle: FlushbarStyle.FLOATING,
      // reverseAnimationCurve: Curves.easeInOut,
      // forwardAnimationCurve: Curves.elasticOut,
      // backgroundColor: Colors.red,
      // boxShadows: [BoxShadow(color: Colors.white)],
      // backgroundGradient: LinearGradient(colors: [Colors.grey[500],Colors.grey[500]]),
      // // isDismissible: false,
      // duration: Duration(seconds: 9),
      // icon: Icon(
      //   Icons.check,
      //   color:  Colors.amber[100],
      // ),
      // mainButton: FlatButton(
      //   onPressed: () {
      //     setState(() {
      //       show= !show;
      //     });
      //   },
      //   child: Text(
      //     "اغلاق",
      //     style: TextStyle(color: Colors.amber[100]),
      //   ),
      // ),
      // // showProgressIndicator: true,
      // // progressIndicatorBackgroundColor: Colors.blueGrey,
      
      // messageText: Text(
      //   "المواعيد المسموح بادخالها ساعة وساعة ونص فقط",
      //   style: TextStyle(fontSize: 18.0, color: Colors.amber[100]),
      // ),
    // )
    show? SnackBar(
    content: Text('Welcome to woolha.com'),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label:'Click',
      onPressed: () {
        print('Action is clicked');
      },
      textColor: Colors.white,
      disabledTextColor: Colors.grey,
    ),
  )
    :
    SizedBox(height:0),

     
         
        ],)  
      );

  }
}
  



    