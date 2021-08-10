import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/Add1.dart';
import 'package:graduationproject/screens/Add2.dart';
import 'package:graduationproject/screens/AddNewRoom.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:graduationproject/widgets/textDialog.dart';
import 'package:graduationproject/widgets/textEdit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ShowTable4 extends StatefulWidget {

final String idDep;
final String depName;
final String instName;
final String tablename;
final String year;
final List<String> instNames;
final List<String> notes;
final List<String> fromTime;
final List<String> toTime;
final List<String> days;
final List<String> status; 



  const ShowTable4({Key key, this.idDep, this.depName, this.instName, this.tablename, this.year, this.instNames, this.notes, this.fromTime, this.toTime, this.days, this.status}) : super(key: key);





  @override
  _ShowTable4State createState() => _ShowTable4State();
}

class _ShowTable4State extends State<ShowTable4> {
  
     List<Table4> tables = [];
    //  List<String> roomnum1 = [];
     List<Table4> selected = [];
     bool wafaa = false;
    //  bool edit = false;
    //  bool isPresed = false;
     bool delete = false;
     bool flag = false;
     var t = 0;
   

     final columns =['المدرس','ملاحظة','الحالة','الوقت'];

     @override
     void initState() { 
       super.initState();
  //        final String course;
  // final String dep;
  // final String days;
  // final String fromTime;
  // final String toTime;
  // final String year;
       for(int i =0 ; i<widget.instNames.length;i++){
        tables.add(Table4(widget.instNames[i],widget.notes[i],widget.days[i]+'\n'+widget.fromTime[i]+" - "+widget.toTime[i],widget.status[i] == 'true'?'اريد':'لا اريد',widget.fromTime[i],widget.toTime
        [i],widget.days[i]));
        print("'yes'");
     }

     }
     
     Future deleteFunction()async{

 
     for(int i=0;i< selected.length;i++){
       print('len');
       print(selected.length);

       String time = selected[i].fromTime;
       String time1 = selected[i].toTime;
       String time2 = selected[i].daysName;
       print(time);
       print(time1);
       print(time2);
     String timeSlot="$time/$time1/$time2";
    //  selected[i].fromTime +"/"+selected[i].toTime+"/"+selected[i].daysName;
     print(timeSlot);

   String apiUrl = "https://core-graduation.herokuapp.com/deleteSoftConst?idDep=${widget.idDep}&note=${selected[i].note}&instName=${selected[i].inst}";
  print(apiUrl);
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

return 1 ;



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
                             'مواعيد المدرسين',
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
                  ...MenuItem.itemsTwo.map(bulideritem).toList(),
               

                ]
              ),
            ),

          ],


          
      ),
      body:
         
              Padding(
                padding: const EdgeInsets.all(5),
                       
           child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            
            child:
            //  SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            // scrollDirection: Axis.horizontal,
            // child:
            Column(children:[
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

           
              Container(
                child: delete?
                     Center(
                       child: IconButton(
              icon: Icon(Icons.delete_outline,color: Colors.black,),
              onPressed:()async {
                
                       setState(() {
                          for(int i =0 ;i<selected.length;i++){
                                for(int j =0 ;j<tables.length; j++){
                                   if (tables[j].inst == selected[i].inst  && tables[j].time == selected[i].time && tables[j].note == selected[i].note
                                         && tables[j].status == selected[i].status){
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
       
              

              
              wafaa?
              buildDataTable():buildDataTable(),



            ]),
        ),
      ),
                                  
              // ),
            );

 
      

  }

  void onSelected(BuildContext context,MenuItem item){
    switch(item){
    

      case MenuItem.itemDelete:
      setState(() {
        delete=!delete;
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
              

      
      dataRowHeight: 70,
      
      headingRowHeight: 60,
      horizontalMargin: 1,
       columnSpacing: delete?0:5,
      columns: getColumns(columns),
     
      rows: getRows(tables)

      
    );
  
}

 List<DataRow> getRows(List<Table4> tables) => tables.map((Table4 table) {
        final cells = [table.inst,table.note, table.status,table.time];



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
          
            return DataCell(
              
              
              Container(
                width:delete?index !=2?MediaQuery.of(context).size.width /3.6: 35:index !=2?index==3?MediaQuery.of(context).size.width /3.2:MediaQuery.of(context).size.width /4: 50,
                // width: MediaQuery.of(context).size.width * 0.05,
                child: Padding(
                  padding: index ==0?delete?const EdgeInsets.fromLTRB(0, 0, 15, 0):const EdgeInsets.fromLTRB(0, 0, 20, 0):delete?const EdgeInsets.fromLTRB(0, 0, 0, 0):const EdgeInsets.fromLTRB(0, 0, 2, 0),
                  child: Text('$cell',style: GoogleFonts.amiri(
                                      fontSize: 15,
                                      color:Color.fromRGBO(64, 128, 128, 1),
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),
                                  textAlign: TextAlign.center,),
                ),
              ),
              
              // showEditIcon: true,
           
            );
          }
          
          ),
        );
      }).toList();

List<DataColumn> getColumns(List<String> columns) {
  
    return columns.map((String column) {

      return DataColumn(
        
        label: Padding(
          padding:widget.notes.isEmpty?EdgeInsets.fromLTRB(25, 0, 30, 0)
          : column =='المدرس'?delete?const EdgeInsets.fromLTRB(0, 0, 30, 0):const EdgeInsets.fromLTRB(0, 0, 30, 0):column =='الوقت'?const EdgeInsets.fromLTRB(0, 0, 30, 0):const EdgeInsets.all(2.0),
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

class Table4{
  final String inst;
  final String note;
  
  final String time;
 
  final String status;
  
  final String fromTime;
  final String toTime;
  final String daysName;

  Table4(this.inst, this.note, this.time, this.status, this.fromTime, this.toTime, this.daysName);


 

  



  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Table4 &&
          runtimeType == other.runtimeType &&
          inst == other.inst &&
          note == other.note &&
          status == other.status &&
          time == other.time;
          //  &&
          // fromTime == other.fromTime &&
          // toTime == other.toTime;

  @override
  int get hashCode => inst.hashCode ^note.hashCode^status.hashCode^time.hashCode;
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

  static  List<MenuItem> itemsTwo = [
    itemDelete
  ];

  const MenuItem(this.text, this.icon);

 
    static const MenuItem itemDelete = MenuItem('حذف',
    Icons.delete_outline);

  
}



