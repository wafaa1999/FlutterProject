import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/Add4.dart';
import 'package:graduationproject/widgets/TimeDialog.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:graduationproject/widgets/instDialog.dart';
import 'package:graduationproject/widgets/roomDialog.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class ShowFinalTableD extends StatefulWidget {

final String idDep;
final String depName;
final String instName;
final List<String> courseNumbers;
final List<String> courseNames;
final List<String> room;
final List<String> fromTime;
final List<String> toTime;
final List<String> days;

  const ShowFinalTableD({Key key, this.idDep, this.depName, this.instName, this.courseNumbers, this.courseNames, this.room, this.fromTime, this.toTime, this.days}) : super(key: key);







  @override
  _ShowFinalTableDState createState() => _ShowFinalTableDState();
}

class _ShowFinalTableDState extends State<ShowFinalTableD> {
   
     List<TableF> tables = [];

     final columns = ['رقم المساق','اسم المساق','القاعة','الوقت'];

     @override
     void initState() { 
       super.initState();
       
       for(int i =0 ; i<widget.courseNames.length;i++){
        tables.add(TableF(widget.courseNumbers[i],widget.courseNames[i],widget.room[i],widget.days[i]+'\n'+widget.fromTime[i]+" - "+widget.toTime[i],
      widget.fromTime[i],widget.toTime[i],widget.days[i]  ));
       
     }
   }
int t = -1;

  @override
  Widget build(BuildContext context) {
    t = -1;
    return Scaffold(
       drawer: AppDrawer(
             idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
            appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Text(
                              "الجدول الدراسي",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ],
                gradient: LinearGradient(
                  colors:[Color.fromRGBO(64, 128, 128, 1),
                  Color.fromRGBO(64, 128, 128, 1),],
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft
                ),

              ),

         
            ),
            
            elevation: 0,
      
      


          
      ),
      body:
        

               
               
          
         Padding(
                padding: const EdgeInsets.all(5),
                       
           child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child:
             SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child:
            Column(children:[
           
              
       
             
              buildDataTable(),



            ]),
        ),
      ),
                                  
              ),
           
              

       
             );

 
      

  }



  Widget buildDataTable(){
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) {
  
             return Color.fromRGBO(79, 84, 103, 1); //make tha magic!
              }),
              
              //  horizontalMargin: 2,
            dividerThickness: 1,
            columnSpacing:5,
            // delete?48:55,
            
      
      // dataRowHeight: 50,
      // headingRowHeight: 60,
     
      dataRowHeight: 75,
      headingRowHeight: 60,
      
      columns: getColumns(columns),
     
      rows: getRows(tables)

      
    );
  
}

 List<DataRow> getRows(List<TableF> tables) => tables.map((TableF table) {
        final cells = [table.courseNumber,table.courseName,table.courseRoom,table.time];



        return DataRow(
          
          
          
          
           color: MaterialStateColor.resolveWith((states) {
             t += 1;
        
             return t % 2 == 0 ? Colors.white : Colors.grey[200];
            //  return  classConflict1[t] == -1?Colors.white:colors[classConflict1[t]]; //make tha magic! //make tha magic!
              }),

          cells: Utils.modelBuilder(cells, (index, cell) {
            
            
            
            

            return DataCell(
              
              
              Container(
                width: index ==0?MediaQuery.of(context).size.width /5:index ==3?MediaQuery.of(context).size.width /4:MediaQuery.of(context).size.width /5,
                child: Padding(
                  padding: index ==0?const EdgeInsets.fromLTRB(2, 0, 0, 0):index ==3?const EdgeInsets.fromLTRB(2, 0, 5, 0):const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text('$cell',style: GoogleFonts.amiri(
                                        fontSize: 15,
                                        color:
                                        Color.fromRGBO(64, 128, 128, 1),
                                        // classConflict1[t] != -1?Colors.white:Color.fromRGBO(64, 128, 128, 1),
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),
                                    textAlign: TextAlign.center,),
                  ),
                ),
              ),
              
              // showEditIcon: true,
              showEditIcon: false,
              
         );
          }
          
          ),
        );
      }).toList();

List<DataColumn> getColumns(List<String> columns) {
  
    return columns.map((String column) {

      return DataColumn(
        
        label: Padding(
            padding: column =='رقم المساق'?const EdgeInsets.fromLTRB(0, 0, 0, 0):column == 'الوقت'?const EdgeInsets.fromLTRB(30, 0, 0, 0):const EdgeInsets.all(2.0),
                  child: Text(column, style: GoogleFonts.amiri(
                                    fontSize: 18,
                                    color:Colors.white,
                                      
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),
        ),
      );
    }).toList();
  }





}

class TableF{
  final String courseNumber;
  final String courseName;
  final String courseRoom;
  final String time;
  final String fromTime;
  final String toTime;
  final String days;

  TableF(this.courseNumber, this.courseName, this.courseRoom, this.time, this.fromTime, this.toTime, this.days);
  




  }

class Utils {
  static List<T> modelBuilder<M, T>(
          List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
