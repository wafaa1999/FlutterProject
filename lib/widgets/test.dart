import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/widgets/onHaver.dart';

class Testing extends StatefulWidget {

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  List<String> text = ["wafaa","sad"];
  @override
  Widget build(BuildContext context) {
return Scaffold(
  
  body: Center(
    // padding: EdgeInsets.all(100),
     child:ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      
      separatorBuilder: (context,index) =>Divider(),
      itemBuilder: (context, index){
      
        return
         OnHoverText(
           
                  child:
                 Container  (
            child: Center(
              child: Text(text[index],style:
               GoogleFonts.amiri(fontSize:30),),
            ),
          ),
        );

      },
      
    ),
  
   
  
  ),
);  }
}

