import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/AddNewRoom.dart';
import 'package:graduationproject/widgets/TimeDialog.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:graduationproject/widgets/instDialog.dart';
import 'package:graduationproject/widgets/roomDialog.dart';
import 'package:graduationproject/widgets/textDialog.dart';
import 'package:graduationproject/widgets/textEdit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ShowFinalTable extends StatefulWidget {

final String idDep;
final String depName;
final String instName;
final String tableName;
final String year;
final List<String> courseNumbers;
final List<String> courseNames;
final List<String> insts;
final List<String> room;
final List<String> roomtype;
final List<String> fromTime;
final List<String> toTime;
final List<String> days;






  const ShowFinalTable({Key key, this.idDep, this.depName, this.instName, this.courseNumbers, this.courseNames, this.insts, this.room, this.roomtype, this.fromTime, this.toTime, this.days, this.tableName, this.year}) : super(key: key);
  @override
  _ShowFinalTableState createState() => _ShowFinalTableState();
}

class _ShowFinalTableState extends State<ShowFinalTable> {
    //  List<String> roomsnames1=[];
    //  List<String> roomstype1=[];
    //  List<String> roomscamp1=[];
     List<TableF> tables = [];
    //  List<String> roomnum1 = [];
     List<TableF> selected = [];
     bool wafaa = false;
     bool edit = false;
    //  bool isPresed = false;
     bool delete = false;
     bool flag = false;
     var t = 0;
     List<String> insts =['لم يحدد'];
     List<String> room = ['لم يحدد'];
     List<String> labsname = ['لم يحدد'];
     List<String> labsnumber = ['لم يحدد'];

 
     final columns = ['رقم المساق','اسم المساق','المدرس','القاعة','الوقت'];

     @override
     void initState() { 
       super.initState();
       getInst();
       getRooms();
       for(int i =0 ; i<widget.courseNames.length;i++){
        tables.add(TableF(widget.courseNumbers[i],widget.courseNames[i],widget.insts[i],widget.room[i],widget.roomtype[i],widget.days[i]+'\n'+widget.fromTime[i]+" - "+widget.toTime[i],
      widget.fromTime[i],widget.toTime[i],widget.days[i]  ));
        print("'yes'");
     }

     }

  @override
  Widget build(BuildContext context) {
    t = 0;
    return Scaffold(
       drawer: AppDrawer(
             idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
            appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Text(
                              widget.tableName,
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
      
          actions: [
            Container(
      
              child: PopupMenuButton<MenuItem>(
                onSelected:(item)=>onSelected(context,item) ,
                itemBuilder: (context)=>[
                  ...MenuItem.itemsOne.map(bulideritem).toList(),
                  PopupMenuDivider(),
                  ...MenuItem.itemsTwo.map(bulideritem).toList(),

                ]
              ),
            ),

          ],


          
      ),
      body:
         Column(children: [

               
               
           Padding(
              padding: const EdgeInsets.fromLTRB(100, 25, 100, 25),
              
              
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [ Color.fromRGBO(212, 172, 13,1,),  Color.fromRGBO(212, 172, 13,1,)]),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              // BoxShadow(
                              //     blurRadius: 4,
                              //     color:Color.fromRGBO(64, 128, 128, 1),
                              //     offset: Offset(1,1))
                            ]),
                child: ListTile(
                

                  title: Text(
                                "أضف مساق ",
                                style: GoogleFonts.amiri(
                                    fontSize: 20,
                                    color:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),

                  trailing: Icon(Icons.add,color: Colors.white,),
                  
                  

                  
                    onTap:(){
                      
                      Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                           AddNewRoom(
                                             instName: widget.instName,
                                        depName: widget.depName,
                                          idDep:widget.idDep,
                                          

                                        ),
                                      ),
                                    ); 
                      },
                   
                    
                  ),

                     


               
              ),
            ),
              
           
                      Container(
                        child: edit?   
                  
           
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.07,
                    // width:MediaQuery.of(context).size.width ,
                    // color: Color.fromRGBO(206, 222, 222, 1),
                    child: Center(
                        child: IconButton(
              icon: Icon(Icons.done),
              iconSize: 30,
              color: Colors.black,
              onPressed:() {
                setState(() {
                  edit = false;
                        
                });

              },

            ),
                    ),
                  ):
            SizedBox(height: 0,),
                      ),



              Container(
                child: delete?
                     Center(
                       child: IconButton(
              icon: Icon(Icons.delete_outline,color: Colors.black),
              onPressed:()async {
                
                     setState(() {
                          for(int i =0 ;i<selected.length;i++){
                       for(int j =0 ;j<tables.length; j++){
                          if (tables[j].courseName == selected[i].courseName && tables[j].courseNumber == selected[i].courseNumber
                          && tables[j].courseRoom == selected[i].courseRoom && tables[j].time == selected[i].time
                          && tables[j].courseName == selected[i].courseName){
                                 tables.removeAt(j);
                                      }
                                          }
                     }
                         delete =!delete;
                  wafaa= !wafaa;
                  
                     });
                 deleteFunction();
   
                
              },

            ),
                     ):
                     SizedBox(height: 0,),
                    
                    
                ),
       
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
           
              
              wafaa?
              buildDataTable():buildDataTable(),



            ]),
        ),
      ),
                                  
              ),
           
              

         ],),
       
             );

 
      

  }

  void onSelected(BuildContext context,MenuItem item){
    switch(item){
      case MenuItem.itemEdit:
      setState(() {
        edit=true;
        wafaa =!wafaa;
      });
      break;

      case MenuItem.itemDelete:
      setState(() {
        delete=!delete;
        wafaa =!wafaa;
      });
      break;

    }

  
  }
 
  PopupMenuItem<MenuItem> bulideritem(MenuItem item)=>PopupMenuItem<MenuItem>(
    value: item,
    child: Row(children:[ 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(item.icon,color:Colors.grey[400],size:20),
      ),
      // SizedBox(height: 10,),
      Divider(height: 20, thickness: 500,color:Colors.black ,),
      Text(item.text,style: GoogleFonts.amiri(
                                    fontSize: 15,
                                    color:Color.fromRGBO(64, 128, 128, 1),
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),

      ]),);


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
        final cells = [table.courseNumber,table.courseName,table.courseInst,table.courseRoom,table.time];



        return DataRow(
          
          
          
          
           color: MaterialStateColor.resolveWith((states) {
             t += 1;
             return t % 2 == 0 ? Colors.white : Colors.grey[200]; //make tha magic!
              }),


          
          selected: delete?selected.contains(table):false,
          
          onSelectChanged:delete?(isSelect){
             setState(() {
               final isAdding = isSelect != null && isSelect;

                isAdding
                  ? selected.add(table)
                  : selected.remove(table);
             });

          }:null,
           
          
            
         
          cells: Utils.modelBuilder(cells, (index, cell) {
            
            final showEditIcon =( index == 2 || index == 3 || index == 4 ) && edit;
            
            
            

            return DataCell(
              
              
              Container(
                width: index ==0?MediaQuery.of(context).size.width /4:index ==4?MediaQuery.of(context).size.width /4:MediaQuery.of(context).size.width /5,
                child: Padding(
                  padding: index ==0?const EdgeInsets.fromLTRB(2, 0, 5, 0):index ==4?const EdgeInsets.fromLTRB(2, 0, 5, 0):const EdgeInsets.all(3.0),
                  child: Center(
                    child: Text('$cell',style: GoogleFonts.amiri(
                                        fontSize: 15,
                                        color:Color.fromRGBO(64, 128, 128, 1),
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),
                                    textAlign: TextAlign.center,),
                  ),
                ),
              ),
              
              // showEditIcon: true,
              showEditIcon: showEditIcon,
              
              
              onTap: ()async {
                if(edit){
                switch (index) {
                  case 2:
                  // int inst = await getInst();
                  // if (inst == 1){
                     print(index);
                   editinst(table);
                     break;


                  // }
                   break;

                  
                  case 3:
                  editRoom(table);
                  // editName(room);
                  break;

                  case 4:
                  editTime(table);
                  break;
                }
                }
              },
            );
          }
          
          ),
        );
      }).toList();

List<DataColumn> getColumns(List<String> columns) {
  
    return columns.map((String column) {

      return DataColumn(
        
        label: Padding(
            padding: column =='رقم المساق'?const EdgeInsets.fromLTRB(0, 0, 3, 0):const EdgeInsets.all(2.0),
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
  Future editinst(TableF editedTable) async {
    bool visit = false;
    final editedValue = await showTextDialog1(
      context,
      title: 'تغيير نوع المدرس',
      inst:insts,

    );

    setState(() => tables = tables.map((table) {
      
          final isEditedTable=  table == editedTable;
          print(editedValue);
          if(editedValue != 'false'){
          isEditedTable? 
          editTableInBack(table,editedValue,0):SizedBox(height: 0,);
          visit =true;
          }
          if(editedValue != 'false' && isEditedTable ){
          return table.copyinst(editedValue);
          }
          else{

          return table;
          }
      
        }).toList());
        
          //  Dialog alert = showAlert(context,'تم التعديل',0);
          //                 showDialog(
          //                   context: context,
          //                  child:alert,
          //                  barrierDismissible: false, );

    
  }

  Future editRoom(TableF editedTable) async {
    bool visit = false;
    final editedValue = await showTextDialog2(
      context,
      title: 'تغيير نوع القاعة',
      room:room,
      labs:labsname,

    );

    setState(() => tables = tables.map((table) {
      
          final isEditedTable=  table == editedTable;
          if(editedValue != 'false'){
          isEditedTable? 
          editTableInBack(table,editedValue,1):SizedBox(height: 0,);
          visit =true;
          }
         
            if(editedValue != 'false' && isEditedTable ){
             List <String> edited = editedValue.split(',');
     String roomtype = "";
     String roomnumber = "";
     if(edited[0] == 'قاعة تدريس'){
     roomtype  = 'قاعة تدريس';
     roomnumber = edited[1];}
     else 
     {
        roomtype  = edited[1];
        for (int i =0; i<labsname.length ;i++){
          if (labsname[i] == edited[1]){
            roomnumber = labsnumber[i];
            break;
          }
        }
     }
            

          return table.copyRoom(roomnumber,roomtype);
          }
          else{

          return table;
          }
         
        }).toList());
        
          //  Dialog alert = showAlert(context,'تم التعديل',0);
          //                 showDialog(
          //                   context: context,
          //                  child:alert,
          //                  barrierDismissible: false, );

    
  }

  Future editTime(TableF editedTable) async {
    bool visit = false;
    final editedValue = await showTextDialog3(
      context,
      title: 'تعديل الوقت',
    

    );

    setState(() => tables = tables.map((table) {
      
          final isEditedTable=  table == editedTable;
          if(editedValue != 'false'){
          isEditedTable? 
          editTableInBack(table,editedValue,2):SizedBox(height: 0,);
          visit =true;
          }
         
            if(editedValue != 'false' && isEditedTable ){
             List <String> edited = editedValue.split('/');
            

          return table.copyTime(edited[2]+'\n' +edited[0]+" - "+edited[1],edited[0],edited[1],edited[2]);
          }
          else{

          return table;
          }
         
        }).toList());
        
          //  Dialog alert = showAlert(context,'تم التعديل',0);
          //                 showDialog(
          //                   context: context,
          //                  child:alert,
          //                  barrierDismissible: false, );

    
  }

Future editTableInBack(TableF table,editedValue,flag)async{
   String apiUrl;

  if(flag == 0){
    // (idDep, tableName, courseNumber, startHour, endHour, roomNumber, roomType, days, instName)
      apiUrl = "https://core-graduation.herokuapp.com/editFinalTable?idDep=${widget.idDep}&tableName=${widget.tableName}&courseNumber=${table.courseNumber}&startHour=${table.fromTime}&endHour=${table.toTime}&roomNumber=${table.courseRoom}&roomType=${table.courseType}&days=${table.days}&instName=$editedValue";
      print(apiUrl);
  }
 else if(flag == 1){
   print(editedValue);
   

     List <String> edited = editedValue.split(',');
     print(edited[0]);
   print(edited[1]);
     String roomtype1 = "";
     String roomnumber1 = "";
     if(edited[0] == 'قاعة تدريس'){
       print(";lkjhgfddfghjk");
     roomtype1  = 'قاعة تدريس';
     roomnumber1 = edited[1];
     print(roomtype1);}
     else 
     {
       print(";0000000000000000");
        roomtype1  = edited[1];
        for (int i =0; i<labsname.length ;i++){
          if (labsname[i] == edited[1]){
            roomnumber1 = labsnumber[i];
            break;
          }
        }
        
     }

     print(roomnumber1);
     print(roomtype1);
    // (idDep, tableName, courseNumber, startHour, endHour, roomNumber, roomType, days, instName)
      apiUrl = "https://core-graduation.herokuapp.com/editFinalTable?idDep=${widget.idDep}&tableName=${widget.tableName}&courseNumber=${table.courseNumber}&startHour=${table.fromTime}&endHour=${table.toTime}&roomNumber=$roomnumber1&roomType=$roomtype1&days=${table.days}&instName=${table.courseInst}";

  }
  else if(flag == 2){
   List <String> edited = editedValue.split('/');
   String allTime = edited[2]+'\n' +edited[0]+" - "+edited[1];
      
    // (idDep, tableName, courseNumber, startHour, endHour, roomNumber, roomType, days, instName)
      apiUrl = "https://core-graduation.herokuapp.com/editFinalTable?idDep=${widget.idDep}&tableName=${widget.tableName}&courseNumber=${table.courseNumber}&startHour=${edited[0]}&endHour=${edited[1]}&roomNumber=${table.courseRoom}&roomType=${table.courseType}&days=${edited[2]}&instName=${table.courseInst}";

  }
  
  final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map decoded = json.decode(response.body) ; 
      print(decoded['response'][0]);
      
    
    }




}


Future deleteFunction()async{

  
  for(int i=0;i< selected.length;i++){
   String apiUrl = "https://core-graduation.herokuapp.com/deleteFromFinalTable?courseName=${selected[i].courseName}&courseNumber=${selected[i].courseNumber}&idDep=${widget.idDep}&tableName=${widget.tableName}";
   print("delete");
  final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map decoded = json.decode(response.body) ; 
      print("-************");
      // print(decoded['response'][0]['state']);
      print("////////////////");
      
    
    }
  

}
selected.clear();


}
Future getInst()async{

 String apiUrl2 = "https://core-graduation.herokuapp.com/getAllIsn?idDep=${widget.idDep}";

 final response1 =
        await http.get(Uri.parse(apiUrl2));
        
    if (response1.statusCode == 200) {
  
        Map decoded = json.decode(response1.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       insts.add(decoded['response'][i]['name']); 
      
       }
    }
    print(insts);
    return 1;
}

Future getRooms()async{

 String apiUrl2 = "https://core-graduation.herokuapp.com/getRoomsofDep?idDep=${widget.idDep}";

 final response1 =
        await http.get(Uri.parse(apiUrl2));
        
    if (response1.statusCode == 200) {
  
        Map decoded = json.decode(response1.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       if (decoded['response'][i]['name'] =='قاعة تدريس'){
       room.add(decoded['response'][i]['number']); }
       else{
       labsname.add(decoded['response'][i]['name'] ); 
       labsnumber.add(decoded['response'][i]['number'] ); 
       }
      
       }
    }
    print(insts);
    return 1;
}



}

class TableF{
  final String courseNumber;
  final String courseName;
  final String courseInst;
  final String courseRoom;
  final String courseType;
  final String time;
  final String fromTime;
  final String toTime;
  final String days;
  

  TableF(this.courseNumber, this.courseName, this.courseInst, this.courseRoom, this.courseType, this.time, this.fromTime, this.toTime, this.days);



  TableF copyinst(
    String courseInst,
 
  ) =>
      TableF(
        this.courseNumber, this.courseName,courseInst, this.courseRoom, this.courseType, this.time, this.fromTime, this.toTime, this.days
        
      );

      
  TableF copyRoom(
    String courseRoom,
    String courseType,
 
  ) =>
      TableF(

        this.courseNumber, this.courseName,this.courseInst, courseRoom, courseType, this.time, this.fromTime, this.toTime, this.days
        
      );

      TableF copyTime(
        String time,
    String toTime,
    String fromTime,
    String alldays,

 
  ) =>
      TableF(

        this.courseNumber, this.courseName,this.courseInst, this.courseRoom, this.courseType, time,fromTime, toTime, days
        
      );



  //     Room copy2(
  //   String camp,
 
  // ) =>
  //     Room(
  //       this.number,
  //       this.type,
  //       camp,
  //       this.name
  //     );

  //      Room copy3(
  //   String name,
 
  // ) =>
  //     Room(
  //       this.number,
  //       this.type,
  //       this.camp,
  //        name
  //     );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableF &&
          runtimeType == other.runtimeType &&
          courseInst == other.courseInst &&
          courseName == other.courseName &&
          time == other.time &&
          courseNumber == other.courseNumber &&
          courseRoom == other.courseRoom;

  @override
  int get hashCode => courseInst.hashCode ^ courseInst.hashCode ^ time.hashCode ^time.hashCode;
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


class MenuItem{
  final String text;
  final IconData icon;
  static  List<MenuItem> itemsOne = [
    itemEdit
  ];
  static  List<MenuItem> itemsTwo = [
    itemDelete
  ];

  const MenuItem(this.text, this.icon);

  static const MenuItem itemEdit = MenuItem('تعديل',
  Icons.edit);
    static const MenuItem itemDelete = MenuItem('حذف',
    Icons.delete_outline);

  
}



