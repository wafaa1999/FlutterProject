import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Gridwidget extends StatelessWidget {

  final String svgScr;
  final String title;
  


  const Gridwidget({
    Key key, this.svgScr, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(8) ,
      decoration: BoxDecoration(
           boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.grey[400],
                                  offset: Offset(2, 2))
                            ],

        color:Colors.white,
        borderRadius: BorderRadius.circular(13),

      ),
      child:Column(
        children:<Widget> [
          // Spacer(),
          SvgPicture.asset(svgScr,width: 120,height: 120,),
          Text(title,
          style: GoogleFonts.amiri(fontSize: 22, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
           ),
  
        ],

      ) ,
    );
  }
}