import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/AddNewRoom.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:graduationproject/widgets/textDialog.dart';
import 'package:graduationproject/widgets/textEdit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ShowRoom extends StatefulWidget {

final String idDep;
final String depName;
final String instName;
final List<String> roomsnames;
final List<String> roomstype;
final List<String> roomnum;
final List<String> roomscamp;





  const ShowRoom({Key key, this.idDep, this.depName, this.instName, this.roomsnames, this.roomstype, this.roomscamp, this.roomnum}) : super(key: key);
  @override
  _ShowRoomState createState() => _ShowRoomState();
}

class _ShowRoomState extends State<ShowRoom> {
    //  List<String> roomsnames1=[];
    //  List<String> roomstype1=[];
    //  List<String> roomscamp1=[];
     List<Room> rooms = [];
    //  List<String> roomnum1 = [];
     List<Room> selected = [];
     bool wafaa = false;
     bool edit = false;
    //  bool isPresed = false;
     bool delete = false;
     bool flag = false;
     var t = 0;

     final columns = ['رقم القاعة','الحرم الجامعي','نوع القاعة'];

     @override
     void initState() { 
       super.initState();
       for(int i =0 ; i<widget.roomsnames.length;i++){
        rooms.add(Room(widget.roomsnames[i],widget.roomstype[i],widget.roomscamp[i],widget.roomnum[i]));
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
                              "القاعات",
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
                                "أضف قاعة ",
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
                       for(int j =0 ;j<rooms.length; j++){
                          if (rooms[j].number == selected[i].number){
                                 rooms.removeAt(j);
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
              
               horizontalMargin: 2,
            dividerThickness: 1,
            columnSpacing:edit?50:
            delete?48:55,
            
      
      // dataRowHeight: 50,
      // headingRowHeight: 60,
     
      dataRowHeight: 60,
      headingRowHeight: 60,
      
      columns: getColumns(columns),
     
      rows: getRows(rooms)

      
    );
  
}

 List<DataRow> getRows(List<Room> rooms) => rooms.map((Room room) {
        final cells = [room.number,room.camp, room.name];



        return DataRow(
          
          
          
          
           color: MaterialStateColor.resolveWith((states) {
             t += 1;
             return t % 2 == 0 ? Colors.white : Colors.grey[200]; //make tha magic!
              }),


          
          selected: delete?selected.contains(room):false,
          
          onSelectChanged:delete?(isSelect){
             setState(() {
               final isAdding = isSelect != null && isSelect;

                isAdding
                  ? selected.add(room)
                  : selected.remove(room);
             });

          }:null,
           
          
            
         
          cells: Utils.modelBuilder(cells, (index, cell) {
            
            final showEditIcon =( index == 2 || index == 1 ) && edit;
            
            
            

            return DataCell(
              
              
              Container(
                // width: MediaQuery.of(context).size.width * 0.05,
                child: Center(
                  child: Text('$cell',style: GoogleFonts.amiri(
                                      fontSize: 15,
                                      color:Color.fromRGBO(64, 128, 128, 1),
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),
                                  textAlign: TextAlign.center,),
                ),
              ),
              
              // showEditIcon: true,
              showEditIcon: showEditIcon,
              
              
              onTap: () {
                if(edit){
                switch (index) {
                  case 1:
                  //   editType(room);
                  //   break;
                  // case 2:
                    editCamp(room);
                    break;

                  case 2:
                  editName(room);
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
        
        label: Text(column, style: GoogleFonts.amiri(
                                  fontSize: 18,
                                  color:Colors.white,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
      );
    }).toList();
  }
  Future editType(Room editRoom) async {
    bool visit = false;
    final editedValue = await showTextDialog(
      context,
      title: 'تغيير نوع القاعة',
      one: 'قاعة تدريس',
      two: 'مختبر'

    );

    setState(() => rooms = rooms.map((room) {
      
          final isEditedRoom= room == editRoom;
          if(editedValue != 'false'){
          isEditedRoom? editRoomInBack(room,editedValue,0):SizedBox(height: 0,);
          visit =true;
          }
          if(editedValue != 'false' && isEditedRoom ){
          return room.copy1(editedValue);
          }
          else{

          return room;
          }
      
        }).toList());
        if(visit){
           Dialog alert = showAlert(context,'تم التعديل',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

        }else {
           Dialog alert = showAlert(context,'التعديل غير صحيح',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

        }
  }


  Future editCamp(Room editRoom) async {
    bool visited = false;
    final editedValue = await showTextDialog(
      context,
      title: 'تغيير نوع الحرم',
      value: editRoom.camp,
      one: 'الحرم القديم',
      two: 'الحرم الجديد'
    );

    setState(() => rooms = rooms.map((room) {
      final isEditedRoom= room == editRoom;
          if(editedValue != 'false'){
          isEditedRoom? editRoomInBack(room,editedValue,1):SizedBox(height: 0,);
          }
          if(editedValue != 'false' && isEditedRoom ){
            visited = true;
            
          return room.copy2(editedValue);
          }
          else{
             
          return room;
          }
     
        }).toList());
        if(visited){
           Dialog alert = showAlert(context,'تم التعديل',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

        }else {
           Dialog alert = showAlert(context,'التعديل غير صحيح',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

        }
  }

   Future editName(Room editRoom) async {
    bool visit = false;
    final editedValue = await showTextDialog22(
      context,
      title: 'تغيير اسم القاعة',
     

    );

    setState(() => rooms = rooms.map((room) {
      
          final isEditedRoom= room == editRoom;
         
          if(isEditedRoom){
            editRoomInBack(room,editedValue,2);
          visit =true;

          } 
        
          if(isEditedRoom ){
          return room.copy3(editedValue);
          }
          else{

          return room;
          }
      
        }).toList());
        if(visit){
           Dialog alert = showAlert(context,'تم التعديل',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

        }
  }




Future editRoomInBack(Room room,editedValue,flag)async{
   String apiUrl;
   String type = 'فاعة تدريس';
  if(flag == 0){
      apiUrl = "https://core-graduation.herokuapp.com/editRoom?idDep=${widget.idDep}&number=${room.number}&type=$editedValue&campous=${room.camp}&name=${room.name}";

  }
  else if(flag == 2){
    if(editedValue != 'قاعة تدريس')
    {
      type = 'مختبر';
    }
              apiUrl = "https://core-graduation.herokuapp.com/editRoom?idDep=${widget.idDep}&number=${room.number}&type=$type&campous=${room.camp}&name=${editedValue}";



  }
  else{
              apiUrl = "https://core-graduation.herokuapp.com/editRoom?idDep=${widget.idDep}&number=${room.number}&type=${room.type}&campous=$editedValue&name=${room.name}";


  }

  final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map decoded = json.decode(response.body) ; 
      print(decoded['response'][0]['state']);
      
    
    }




}


Future deleteFunction()async{

  
  for(int i=0;i< selected.length;i++){
   String apiUrl = "https://core-graduation.herokuapp.com/deleteRoomFromDep?idDep=${widget.idDep}&number=${selected[i].number}";
  final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map decoded = json.decode(response.body) ; 
      print("-************");
      // print(decoded['response'][0]['state']);
      print("////////////////");
      
    
    }
  

}

}





}

class Room{
  final String number;
  final String type;
  final String camp;
  final String name;

  const Room(this.number, this.type, this.camp, this.name);

  Room copy1(
    String type,
 
  ) =>
      Room(
        this.number,
        type,
        this.camp,
        this.name,
      );


      Room copy2(
    String camp,
 
  ) =>
      Room(
        this.number,
        this.type,
        camp,
        this.name
      );

       Room copy3(
    String name,
 
  ) =>
      Room(
        this.number,
        this.type,
        this.camp,
         name
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Room &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          type == other.type &&
          camp == other.camp &&
          name == other.name;

  @override
  int get hashCode => number.hashCode ^ type.hashCode ^ camp.hashCode ^name.hashCode;
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



