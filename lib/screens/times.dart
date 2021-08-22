
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/AddNewMaterial.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TimesOfSemester extends StatefulWidget {
  final String idDep;
final String depName;
final String instName;
final List<String> start;
final List<String> end;
final List<String> breakFlag;
final List<String> breakTimeStart;
final List<String> breakTimeEnd;
final List<String> duration;
final List<String> groupC;
final List<String> flahAllDay;

final List<String> startL;
final List<String> endL;
final List<String> flahAllDayL;

  const TimesOfSemester({Key key, this.idDep, this.depName, this.instName, this.start, this.end, this.breakFlag, this.breakTimeStart, this.breakTimeEnd, this.duration, this.groupC, this.flahAllDay, this.startL, this.endL, this.flahAllDayL}) : super(key: key);

  @override
  _TimesOfSemesterState createState() => _TimesOfSemesterState();
}

class _TimesOfSemesterState extends State<TimesOfSemester> {

  List<Days> days = [];
  List<Labs> labs = [];
  List<String> index = ['السبت','الأحد','الاثنين','الثلاثاء','الأربعاء','الخميس'];
  List<bool> clicked =[false,false,false,false,false,false];
 
  @override
  void initState() { 
    super.initState();
    for( int i = 0;i < widget.groupC.length;i++){
      days.add(Days(widget.start[i],widget.end[i], widget.breakFlag[i],
       widget.breakTimeStart[i],widget.breakTimeEnd[i], widget.duration[i],widget.groupC[i],widget.flahAllDay[i]));
    }
    for(int j =0; j <widget.flahAllDayL.length;j++){
      labs.add(Labs(widget.startL[j], widget.endL[j],widget.flahAllDayL[j]));

    }
  
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: AppDrawer(
             idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
       
      appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Text(
                              "الأوقات",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[Color.fromRGBO(64, 128, 128, 1),
                  Color.fromRGBO(64, 128, 128, 1),],
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft
                ),

              ),
            ),
            
        
          
      ),
      body:   
      Container(
        child: ListView(children: [
          for(int i =0 ;i<days.length ; i++)
            buildList(context , i)
          
        ])
        )
        );      
  }
  Widget buildList(BuildContext context ,int i){
    return     Column(children:[  
          Padding(
            padding: i ==0 ?const EdgeInsets.fromLTRB(10, 40, 10, 0):const EdgeInsets.fromLTRB(10, 0, 10, 0),
            
            child: Container(
              decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
              child: InkWell(
                onTap: (){
                  setState(() {
                    clicked[i] =!clicked[i];
                  });
                },
                              child: ListTile(
                

                  title: Text(
                                "${index[i]}",
                                style: GoogleFonts.amiri(
                                    fontSize: 20,
                                    color:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),

                  trailing: Icon(Icons.arrow_drop_down
                  ,color: Colors.white),
                  
                 
                ),
              ),
            ),
          ),

          clicked[i] == true?
           days[i].flahAllDay== '1'?
            Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Container( width: MediaQuery.of(context).size.width * 0.95,
                                height: MediaQuery.of(context).size.height * 0.07,
                                //  color: ,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  topLeft: Radius.circular(5),
      ),
                              gradient: new LinearGradient(
                                  colors: [Colors.grey[300],Colors.grey[300]]),
                                  
                              // borderRadius: BorderRadius.circular(5),
                              
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                                
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
                        child: Text(
                                    ' أوقات الدوام للمساقات الدراسية : ',
                                    style: GoogleFonts.amiri(
                                        fontSize: 17,
                                        color:Colors.black,
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),
                                    textAlign: TextAlign.center,
                                  ),
                      ),

                                Text(
                                  "${days[i].start} - ${days[i].end}",
                                  style: GoogleFonts.amiri(
                                      fontSize: 17,
                                      color:Colors.black,
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),
                                  textAlign: TextAlign.center,
                                ),

                      
                    ],),
                  ),
                )         
                 , Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container( width: MediaQuery.of(context).size.width * 0.95,
                                height: MediaQuery.of(context).size.height * 0.07,
                                //  color: ,
                                 decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: [Colors.grey[300],Colors.grey[300]]),
                                  
                              // borderRadius: BorderRadius.vertical(),
                          //      boxShadow: [
                          //   BoxShadow(
                          //       blurRadius: 4,
                          //       color:Colors.grey[200],
                          //       offset: Offset(1, 1))
                          // ]
                            ),
                                
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 25, 0),
                        child: Text(
                                    'أوقات الفراغ المحددة :',
                                    style: GoogleFonts.amiri(
                                        fontSize: 17,
                                        color:Colors.black,
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),
                                    textAlign: TextAlign.center,
                                  ),
                      ),

                              days[i].breakFlag =='1'?  Text(
                                  "${days[i].breakTimeStart} - ${days[i].breakTimeEnd}",
                                  style: GoogleFonts.amiri(
                                      fontSize: 17,
                                      color:Colors.black,
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),
                                  textAlign: TextAlign.center,
                                ):
                                Text(
                                  "لا يوجد فراغات ",
                                  style: GoogleFonts.amiri(
                                      fontSize: 17,
                                      color:Colors.black,
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),
                                  textAlign: TextAlign.center,
                                )


                      
                    ],),
                  ),
                )         
                  ,
                   Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container( width: MediaQuery.of(context).size.width * 0.95,
                                height: MediaQuery.of(context).size.height * 0.07,
                                //  color: ,
                                 decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: [Colors.grey[300],Colors.grey[300]]),
                                  
                              // borderRadius: BorderRadius.vertical(),
                          //      boxShadow: [
                          //   BoxShadow(
                          //       blurRadius: 4,
                          //       color:Colors.grey[200],
                          //       offset: Offset(1, 1))
                          // ]
                            ),
                                
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 25, 0),
                        child: Text(
                                    'مدة المحاضرة الواحدة :',
                                    style: GoogleFonts.amiri(
                                        fontSize: 17,
                                        color:Colors.black,
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),
                                    textAlign: TextAlign.center,
                                  ),
                      ),

                            Text(
                                  "${days[i].duration}",
                                  style: GoogleFonts.amiri(
                                      fontSize: 17,
                                      color:Colors.black,
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),
                                  textAlign: TextAlign.center,
                                )

                      
                    ],),
                  ),
                )         
                  ,
                   Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container( width: MediaQuery.of(context).size.width * 0.95,
                                height: MediaQuery.of(context).size.height * 0.07,
                                //  color: ,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
      ),
                              gradient: new LinearGradient(
                                  colors: [Colors.grey[300],Colors.grey[300]]),
                                  
                              // borderRadius: BorderRadius.circular(5),
                              
                          //      boxShadow: [
                          //   BoxShadow(
                          //       blurRadius: 4,
                          //       color:Colors.grey[200],
                          //       offset: Offset(1, 1))
                          // ]
                            ),
                                
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
                        child: Text(
                                    ' المجموعة: ',
                                    style: GoogleFonts.amiri(
                                        fontSize: 17,
                                        color:Colors.black,
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),
                                    textAlign: TextAlign.center,
                                  ),
                      ),

                                Text(
                                  " المجموعة${ days[i].groupC
                                  } ",
                                  style: GoogleFonts.amiri(
                                      fontSize: 17,
                                      color:Colors.black,
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),
                                  textAlign: TextAlign.center,
                                ),

                      
                    ],),
                  ),
                )         
                     
                          
                         
                         
                        
                           ],
                           )
                            :
                             Container(
                            
                      child: Row(
                          
                          children: [
                           
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 2, 10, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.07,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: [Colors.grey[300], Colors.grey[300]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                          //      boxShadow: [
                          //   BoxShadow(
                          //       blurRadius: 4,
                          //       color:Colors.grey[200],
                          //       offset: Offset(1, 1))
                          // ]
                            ),
                              
                              child: Center(
                                child: Text(
                              'لا يوجد دوام للمساقات بهذا اليوم',
                              style: GoogleFonts.amiri(
                                  fontSize: 17,
                                  color:Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ]),
                   
                      
               
                              
                            )

            
                          
                          
                           :SizedBox(height:1),
          clicked[i] == true?
           labs[i].flahAllDayL== '1'?
             Column(
                            children:[ Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Container( width: MediaQuery.of(context).size.width * 0.95,
                                  height: MediaQuery.of(context).size.height * 0.07,
                                  //  color: ,
                                   decoration: BoxDecoration(
      //                                borderRadius: BorderRadius.only(
      //                               topRight: Radius.circular(5),
      //                               topLeft: Radius.circular(5),
      // ),
                                gradient: new LinearGradient(
                                    colors: [Colors.white,Colors.white]),
                                    
                                borderRadius: BorderRadius.circular(5),
                                
                                 boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color:Colors.grey[200],
                                  offset: Offset(1, 1))
                            ]
                              ),
                                  
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
                          child: Text(
                                      ' أوقات الدوام للمساقات الدراسية : ',
                                      style: GoogleFonts.amiri(
                                          fontSize: 17,
                                          color:Colors.black,
                                            
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.7),
                                      textAlign: TextAlign.center,
                                    ),
                        ),

                                  Text(
                                    "${labs[i].startL} - ${labs[i].endL}",
                                    style: GoogleFonts.amiri(
                                        fontSize: 17,
                                        color:Colors.black,
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),
                                    textAlign: TextAlign.center,
                                  ),

                        
                      ],),
                    ),
                  ),
                            ])         
                
           :
           Container(
                            
                      child: Row(
                          
                          children: [
                           
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 2, 10, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.07,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: [Colors.white, Colors.white]),
                                  
                              borderRadius: BorderRadius.circular(5),
                          //      boxShadow: [
                          //   BoxShadow(
                          //       blurRadius: 4,
                          //       color:Colors.grey[200],
                          //       offset: Offset(1, 1))
                          // ]
                            ),
                              
                              child: Center(
                                child: Text(
                              'لا يوجد دوام للمختبرات بهذا اليوم',
                              style: GoogleFonts.amiri(
                                  fontSize: 17,
                                  color:Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ]),
                   
                      
               
                              
                            )

            

                :SizedBox(height:0)
        
        ]);
        
  }
}

     
class Days{

  final String start;
  final String end;
  final String breakFlag; // في بريك  بفصل ع الباك سلاش
  final String breakTimeStart;
   final String breakTimeEnd;
  final String duration;
  final String groupC;
  final String flahAllDay;
  

  Days(this.start, this.end, this.breakFlag, this.breakTimeStart, this.breakTimeEnd, this.duration, this.groupC, this.flahAllDay); // في دوام


}

class Labs{
  final String startL;
  final String endL;
  final String flahAllDayL;

  Labs(this.startL, this.endL, this.flahAllDayL);
  

}
