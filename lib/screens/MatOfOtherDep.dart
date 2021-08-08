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


class ShowTable2 extends StatefulWidget {

final String idDep;
final String depName;
final String instName;
final String tablename;
final String year;
final List<String> deprtments;
final List<String> courses;
final List<String> yearOfStuding;
final List<String> days;
final List<String> fromTime;
final List<String> toTime;


  const ShowTable2({Key key, this.idDep, this.depName, this.instName, this.tablename, this.courses, this.yearOfStuding, this.year, this.days, this.fromTime, this.toTime, this.deprtments}) : super(key: key);





  @override
  _ShowTable2State createState() => _ShowTable2State();
}

class _ShowTable2State extends State<ShowTable2> {
    //  List<String> courses = ['برمجه الحاسوب','خوارزميتات'];
    //  List<String> inst = ['عماد النتشة','منى ضميدي'];
    //  List<String> rooms = ["مختبر البيك","مختبر متحكمات دقيقة "];
     List<Table1> tables = [];
    //  List<String> roomnum1 = [];
     List<Table1> selected = [];
     bool wafaa = false;
    //  bool edit = false;
    //  bool isPresed = false;
     bool delete = false;
     bool flag = false;
     var t = 0;
     List<String> allCourses = [];
     List<String> allInst = [];
     List<String> allRooms = [];
     List<String> depNames = [];
     List<String> idDep = [];

     final columns =['القسم',' المساق','السنة','الوقت'];

     @override
     void initState() { 
       super.initState();
  //        final String course;
  // final String dep;
  // final String days;
  // final String fromTime;
  // final String toTime;
  // final String year;
       for(int i =0 ; i<widget.courses.length;i++){
        tables.add(Table1(widget.courses[i],widget.deprtments[i],widget.days[i]+'\n'+widget.fromTime[i]+" - "+widget.toTime[i],widget.yearOfStuding[i]));
        print("'yes'");
     }

     }
     
     Future deleteFunction()async{
       

  
     for(int i=0;i< selected.length;i++){
       String timeSlot = "";
       timeSlot += selected[i].days;
      //  selected[i].fromTime +"/"+selected[i].toTime+"/"+selected[i].days;


   String apiUrl = "https://core-graduation.herokuapp.com/deleteFromSaveMatOfDraft?tableName=${widget.tablename}&depId=${widget.idDep}&courseIns=0&courseName=${selected[i].course}&flag=1&timeSlot=$timeSlot&roomType=0&date=${widget.year}";
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
    Future getdep() async {
    String id = '60ddc9735b4d43f8eaaabf83';
    String apiUrl = "https://core-graduation.herokuapp.com/getAllDep";
    final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       idDep.add(decoded['response'][i]['idDepartment']); 
       depNames.add(decoded['response'][i]['name']); 
       

      
       }
       idDep.add('0');
       depNames.add('لم يتم اختياره');
   print(idDep);
   print(depNames);
  
        
       
    }
    return 1;

   }
 
    


    


  @override
  Widget build(BuildContext context) {
    t = 0;
    return Scaffold(
       drawer: AppDrawer(
            //  idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
            appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Text(
                              "مساقات من قسم اخر",
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
               
               
           Padding(
              padding: const EdgeInsets.fromLTRB(100, 25, 100, 25),
              
              
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Colors.grey[700], Colors.grey[700]]),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color:Color.fromRGBO(64, 128, 128, 1),
                    offset: Offset(1,1))
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
                    
                    

                    
                      onTap:()async{
                       int responce = await getdep();
                        if(responce == 1){
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                             AddTable2(
                          instName: widget.instName,
                          depName: widget.depName,
                          idDep:widget.idDep,
                          year:widget.year,
                          tablename: widget.tablename,
                          depNames:depNames,
                          idDeps:idDep,
                          // inst:allInst

                            

                          ),
                        ),
                      ); 
                       
                        }
                        },
                     
                      
                    ),

                       


                 
                ),
            ),
              
       



              Container(
                child: delete?
                     Center(
                       child: IconButton(
              icon: Icon(Icons.delete_outline,color: Colors.black,),
              onPressed:()async {
                
                       setState(() {
                          for(int i =0 ;i<selected.length;i++){
                                for(int j =0 ;j<tables.length; j++){
                                   if (tables[j].course == selected[i].course  && tables[j].days == selected[i].days && tables[j].dep == selected[i].dep
                                         && tables[j].year == selected[i].year){
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

 List<DataRow> getRows(List<Table1> tables) => tables.map((Table1 table) {
        final cells = [table.dep,table.course,table.year, table.days];



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
                width:index !=2?MediaQuery.of(context).size.width /3.5: 25,
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
          padding: column =='القسم'?delete?const EdgeInsets.fromLTRB(0, 0, 30, 0):const EdgeInsets.fromLTRB(0, 0, 30, 0):column =='الوقت'?const EdgeInsets.fromLTRB(0, 0, 30, 0):const EdgeInsets.all(2.0),
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

class Table1{
  final String course;
  final String dep;
  final String days;
  // final String fromTime;
  // final String toTime;
  final String year;

  Table1(this.course,  this.dep, this.days, this.year);

 

  



  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Table1 &&
          runtimeType == other.runtimeType &&
          course == other.course &&
          year == other.year &&
          dep == other.dep &&
          days == other.days;
          //  &&
          // fromTime == other.fromTime &&
          // toTime == other.toTime;

  @override
  int get hashCode => course.hashCode ^dep.hashCode^days.hashCode^year.hashCode;
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



