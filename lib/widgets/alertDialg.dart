import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



Dialog showAlert( BuildContext context,String str ,int one) {
   var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
     final alert = 
     Dialog(
       backgroundColor: Colors.grey[300],
      //  insetPadding: EdgeInsets.symmetric(horizontal: 170),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: height * 0.2,
            // width: width * 0.1,
          
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
              
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(str, style: GoogleFonts.amiri(fontSize: 18),),
                  ),
                  SizedBox(height: 5,),
                  RaisedButton(onPressed: () {
                    Navigator.of(context).pop();
                  },
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30)),
                    color:one ==1?Colors.redAccent:Colors.greenAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('اغلاق', style: GoogleFonts.amiri(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -30,
            child: CircleAvatar(
              backgroundColor: one==1?Colors.redAccent:Colors.greenAccent,
              radius: 35,
              child: one == 1?Icon(Icons.close, color: Colors.white, size: 30,):
                    Icon(Icons.check, color: Colors.white, size: 30,),
            )
          ),
        ],
      )
    );
      return alert;


    
  }

// import 'package:flutter/material.dart';

// class AdvanceCustomAlert extends StatelessWidget {
//     final String str;
//     final Color color;


//   const AdvanceCustomAlert(String s, Color co,{Key key, this.str, this.color}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(4.0)
//       ),
//       child: Stack(
//         overflow: Overflow.visible,
//         alignment: Alignment.topCenter,
//         children: [
//           Container(
//             height: 200,
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
//               child: Column(
//                 children: [
//                   SizedBox(height: 5,),
//                   Text(this.str, style: TextStyle(fontSize: 20),),
//                   SizedBox(height: 20,),
//                   RaisedButton(onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                     color: this.color,
//                     child: Text('اوكي', style: TextStyle(color: Colors.white),),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: -60,
//             child: CircleAvatar(
//               backgroundColor: Colors.redAccent,
//               radius: 30,
//               child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
//             )
//           ),
//         ],
//       )
//     );
//   }
// }