import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/AddInst.dart';
import 'package:graduationproject/screens/AddNewRoom.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:graduationproject/widgets/textDialog.dart';
import 'package:graduationproject/widgets/textEdit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ShowInst extends StatefulWidget {

final String idDep;
final String depName;
final String instName;
final List<String> instNames;

  const ShowInst({Key key, this.idDep, this.depName, this.instName, this.instNames}) : super(key: key);






  @override
  _ShowInstState createState() => _ShowInstState();
}

class _ShowInstState extends State<ShowInst> {
    //  List<String> roomsnames1=[];
    //  List<String> roomstype1=[];
    //  List<String> roomscamp1=[];
     List<Inst> insts = [];
    //  List<String> roomnum1 = [];
     List<Inst> selected = [];
     bool wafaa = false;
     bool edit = false;
    //  bool isPresed = false;
     bool delete = false;
     bool flag = false;
     var t = 0;

     final columns = ['اسم المدرس'];
     @override
     void initState() { 
       super.initState();
       for (int i = 0; i < widget.instNames.length; i++){
         insts.add(Inst(widget.instNames[i]));
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
                              "المدرسين",
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
            // child:
            //  SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            // scrollDirection: Axis.horizontal,
            child:
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
                              // BoxShadow(
                              //     blurRadius: 4,
                              //     color:Color.fromRGBO(64, 128, 128, 1),
                              //     offset: Offset(1,1))
                            ]),
                child: ListTile(
                

                  title: Text(
                                "أضف مدرس ",
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
                                           AddInst(
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
              
           

          
              wafaa?
              buildDataTable():buildDataTable(),



            ]),
        ),
      ),
                                  
              // ),
            );

 
      

  }

 

  Widget buildDataTable(){
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) {
  
             return Color.fromRGBO(79, 84, 103, 1); //make tha magic!
              }),
              
               horizontalMargin: 2,
            dividerThickness: 1,
            columnSpacing:edit?50:
            delete?48:55,
            
      
      // dataRowHeight: 50,
      // headingRowHeight: 60,
     
      dataRowHeight: 60,
      headingRowHeight: 60,
      
      columns: getColumns(columns),
     
      rows: getRows(insts)

      
    );
  
}

 List<DataRow> getRows(List<Inst> insts) => insts.map((Inst ins) {
        final cells = [ins.name];



        return DataRow(
          
          
          
          
           color: MaterialStateColor.resolveWith((states) {
             t += 1;
             return t % 2 == 0 ? Colors.white : Colors.grey[200]; //make tha magic!
              }),


            
         
          cells: Utils.modelBuilder(cells, (index, cell) {
            
            
            
            

            return DataCell(
              
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[ Container(
                  // width: MediaQuery.of(context).size.width * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: IconButton(
                    onPressed: ()async{
                      print(cell);
                      setState(() {
                        for (int i =0 ; i< insts.length;i++){
                          if (insts[i].name == cell){
                            insts.removeAt(i);
                            break;
                          }
                        }
                        
                      });
                      int res = await deleteFunction(cell);

                   

                    },
                    icon: Icon(Icons.delete_outlined),
                     color: Colors.redAccent,
                   ),
                ),
                              ]
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
 padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
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




Future deleteFunction(String name)async{

  
  
   String apiUrl = "https://core-graduation.herokuapp.com/deleteInsFromDep?idDep=${widget.idDep}&name=${name}";
  final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map decoded = json.decode(response.body) ; 
      return 1 ;

 
  

}

}





}

class Inst{

  final String name;

  Inst(this.name);

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







