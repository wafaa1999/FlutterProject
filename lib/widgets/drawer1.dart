import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/AddNewMaterial.dart';
import 'package:graduationproject/screens/HeadOfDepMain.dart';
import 'package:graduationproject/screens/Login.dart';
import 'package:graduationproject/screens/planOfMaterials.dart';
import 'package:graduationproject/screens/showRooms.dart';

class AppDrawer extends StatefulWidget {
  // AppDrawer(String idDep);
 final String idDep;
 final String depName;
 final String instName;
    const AppDrawer({Key key, this.idDep, this.depName, this.instName}) : super(key: key);
 

  @override
  _AppDrawerState createState() => _AppDrawerState();
}
// Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute<void>(
//                                       builder: (BuildContext context) =>
//                                          AddNewMat(
                                        
//                                       ),
//                                     ),
//                                   ); 

class _AppDrawerState extends State<AppDrawer> {
  @override

  Widget build(BuildContext context) {
        var height = MediaQuery.of(context).size.height;

    return Drawer(
      child: ListView(
        children: <Widget>[
           DrawerHeader(
              decoration: BoxDecoration(
                          //  border: Border.all(color: Colors.white,width: 2),
                            gradient: new LinearGradient(
                                colors: [Color.fromRGBO(55, 71, 79, 1),
                               Color.fromRGBO(55, 71, 79, 1)] ),
                            //  borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.grey[200],
                                  offset: Offset(2, 2))
                            ],
                            ),
             
              child:  Container(
              
                
                
                child: Column(
                children: [
                  SizedBox(height: height * 0.04),
                  
                  Text(" قسم "+widget.depName+" ",style: GoogleFonts.amiri(
                              fontSize: 20,
                              color:  Color.fromRGBO(212, 172, 13,1,),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7),
                          textAlign: TextAlign.center, ),
                  // SizedBox(height: height * 0.01,),
                  Divider(height: height*0.02,thickness: 2,),
                  Text("رئيس القسم : "+widget.instName+" ",style: GoogleFonts.amiri(
                              fontSize: 20,
                              color:  Color.fromRGBO(212, 172, 13,1,),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7),
                          textAlign: TextAlign.center,),


                ],
              )),
          ),
             InkWell(

               onTap:() =>{
                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         HeadOfDepMain(
                                        idDep:widget.idDep ,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        
                                      ),
                                    ),
                                  ) 

               },
                            child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("الصفحة الرئيسية",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),
             
           InkWell(

               onTap:() =>{
                //  Navigator.pushReplacement(
                //                     context,
                //                     MaterialPageRoute<void>(
                //                       builder: (BuildContext context) =>
                //                          HeadOfDepMain(
                //                         idDep:widget.idDep ,
                //                         instName: widget.instName,
                //                         depName: widget.depName,
                                        
                //                       ),
                //                     ),
                //                   )

               },
                            child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("المدرسين",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),
             
                InkWell(

               onTap:() =>{
                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         ShowRoom(
                                        idDep:widget.idDep ,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        
                                      ),
                                    ),
                                  )

               },
                            child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("القاعات",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),
                InkWell(

               onTap:() =>{
                //  Navigator.pushReplacement(
                //                     context,
                //                     MaterialPageRoute<void>(
                //                       builder: (BuildContext context) =>
                //                          HeadOfDepMain(
                //                         idDep:widget.idDep ,
                //                         instName: widget.instName,
                //                         depName: widget.depName,
                                        
                //                       ),
                //                     ),
                //                   )

               },
                            child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("الجدول الدراسي",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),
             
                InkWell(

               onTap:() =>{
                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         PlanOfMaterials(
                                        idDep:widget.idDep ,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        
                                      ),
                                    ),
                                  )

               },
                            child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("المساقات",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),

                InkWell(

               onTap:() =>{
                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         Login(
                                      
                                      ),
                                    ),
                                  )

               },
                            child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("تسجيل الخروج",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),
             
             

        ],
      ),
    );
  }
} 