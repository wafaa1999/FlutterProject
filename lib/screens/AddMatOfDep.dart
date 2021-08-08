import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddNewRoom extends StatefulWidget {
  final String idDep;
    final String depName;
  final String instName;
   
  

  const AddNewRoom({Key key, this.idDep, this.depName, this.instName}) : super(key: key);
   

  @override
  _AddNewMatState createState() => _AddNewMatState();
}

class _AddNewMatState extends State<AddNewRoom> {
    
    final _number = TextEditingController();
    int _value1 =0;
    int _value2 =0;
     List<String> roomsnames = [];
     List<String> roomstype= [];
    List<String> roomscamp =[];

    @override
    void initState() { 
      super.initState();
      
      
    }
 Future getroomsall() async {
   roomscamp.clear();
   roomsnames.clear();
   roomstype.clear();

    //final String apiUrl = "http://192.168.1.7:3002/getRoomsofDep?idDep=60ddc9735b4d43f8eaaabf83";
    // https://virtual-grad.herokuapp.com/getRoomsofDep?idDep=60ddc9735b4d43f8eaaabf83
    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getRoomsofDep?idDep=${widget.idDep}";
    final response =
        await http.get(Uri.parse(apiUrl));
        print("w");
    if (response.statusCode == 200) {
      print("re");
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       roomsnames.add(decoded['response'][i]['number']);  
       roomstype.add(decoded['response'][i]['type']);
       roomscamp.add(decoded['response'][i]['campous']);


       }
      //  print("roomanme");
      //  print(roomsnames.length);
      // //  for(int i =0 ; i<roomsnames.length;i++){
      //   // roomm.add(Room(roomsnames[i],roomstype[i],roomscamp[i]));
      //   print("'yes'");
      //   print("main");
        
      //  }
      //  rooms.toList();
      //  for(int i =0;i<rooms.length;i++){
      //    print(rooms[i].number);
      //  }
      //  print("room lenght");
      //  print(rooms.length);
    
      return 1;
    

      }

    
     
    
    }


    



  Future addRoomNew (String id) async {
    String type;
    String camp;

    print(_number.text);
    if(_value1 == 1)
      camp = "الحرم القديم";
      else camp = "الحرم الجديد";

       if(_value2 == 3)
      type = "قاعة تدريس";
      else type = "مختبر";
    final String apiUrl = "https://core-graduation.herokuapp.com/addRoomToDepartment?idDep=$id&number=${_number.text}&type=$type&campous=$camp";
    print(apiUrl);
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        print(decoded['response'][0]);
        return decoded['response'][0]['stat'];
        
        
       
   
      }
    }


  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
     return Scaffold(
        drawer: AppDrawer(
             idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
      appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Text(
                              "اضافة قاعة جديدة",
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

       body: SingleChildScrollView(
        child:Column(children:<Widget> [
           Row(
            children: [
              Container(
                
                width: width,
                height: height * 0.05,
                  decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [Color.fromRGBO(206, 222, 222, 1), Color.fromRGBO(206, 222, 222, 1)]),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        
                          
                          child: IconButton(icon: Icon(Icons.close),color: Color.fromRGBO(64, 128, 128, 1),
                          alignment: Alignment.bottomLeft, 
                          onPressed:()async{
                            int responce = await getroomsall();
                           if(responce == 1){
                             Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         ShowRoom(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                        roomsnames:roomsnames,
                                          roomscamp:roomscamp,
                                          roomstype:roomstype
                                      ),
                                    ),
                                  ); 
                           }

                           }),
                        
                

              ),
            ],

          ),
          SizedBox(height :height *0.03),

           Row(
            children: [
              SizedBox(height :height *0.03),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
           
                  child: Text("رقم القاعة",style: GoogleFonts.amiri(
                                      fontSize: 18,
                                      color:Colors.grey[600],
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),),
                ),
              ),




                  Container(
                    width: width * 0.6,
                    height: height * 0.06,
                   
                    child: TextField(
                      
                       controller: _number,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                         
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1.8),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                        ),
                     
                        ),
                        
                  ),
            ],

          ),
          
        Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
             child: Row(children: [
               Text("مكان القاعة",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7)
),
               
               Radio(
                 

                 
                 value: 1,
                  groupValue:_value1, 
                  
                  onChanged: (value){
                    setState(() {
                      _value1 = value;
                    });
                  }),
                  Text("الحرم القديم", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
               

              Radio(
                 value: 2,
                  groupValue: _value1, 
                   onChanged: (value){
                    setState(() {
                      _value1 = value;
                    });
                  }),
                Text("الحرم الجديد", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
             
             
             
             ],),
           ),
        
        Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
             child: Row(children: [
               Text("نوع القاعة",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7)
),
               
               Radio(
                 

                 
                 value: 3,
                  groupValue:_value2, 
                  
                  onChanged: (value){
                    setState(() {
                      _value2 = value;
                    });
                  }),
                  Text("قاعة تدريس", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
               

              Radio(
                 value: 4,
                  groupValue: _value2, 
                   onChanged: (value){
                    setState(() {
                      _value2 = value;
                    });
                  }),
                Text("مختبر", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
             
             
             
             ],),
           ),
        
         Row(children: [
          SizedBox(height: height * 0.1,),
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 0, 125, 0),
           child: Container(
              width: width * 0.3,
                        height: height *0.055,
                        
                         decoration: BoxDecoration(
                           
                            gradient: new LinearGradient(
                                colors: [Color.fromRGBO(206, 222, 223, 1), Color.fromRGBO(207, 222, 222, 1)]),
                            borderRadius: BorderRadius.circular(20),
                          ),
             child: InkWell(
                        onTap: ()async {
                          if (_number.text.isEmpty || _value1 ==0 || _value2 ==0){
                            Dialog alert = showAlert(context,'يجب ادخال جميع البيانات المطلوبة',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

                          }
                          else{

                          
                          String response = await addRoomNew(widget.idDep);
                           if (response == 'Done'){
                             Dialog alert = showAlert(context,'تم اضافة القاعة',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                           }

                          
                          else {
                             Dialog alert = showAlert(context,'القاعة موجودة مسبقا',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                           _number.clear();

                          }

                          }
                      
                        },
                         


                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              "حفظ",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color: Colors.black,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        
                      ),
           ),
         ),
        ],),


           
          




        ],
        ),
       ),
     );
      
 
  }


  


}