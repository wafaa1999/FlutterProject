import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<T> showTextDialog2<T>(
  BuildContext context, {
  String title ,
  String value,
  List<String> room,
  List<String> labs,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => RoomDialogWidget(
        title: title,
        room:room,
        labs: labs,
      
      ),
    );

class RoomDialogWidget extends StatefulWidget {
  final String title;
  final List<String> room;
  final List<String> labs;


  const RoomDialogWidget({
    Key key,
    this.title, this.room, this.labs,

   
  }) : super(key: key);

  @override
  _RoomDialogWidgetState createState() => _RoomDialogWidgetState();
}

class _RoomDialogWidgetState extends State<RoomDialogWidget> {
  

  @override
  void initState() {
    super.initState();

   
  }
      int _value =0;
      String roomSelected;
      String labSelected;
      bool without = true;
      bool wafaa = false;


  @override
  Widget build(BuildContext context) => AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      
        title:Text(""),
         content: 
        Stack(
          overflow: Overflow.visible,
        alignment: Alignment.topCenter,
          children:[
        Container(

          height: without ? MediaQuery.of(context).size.height *0.2:
          MediaQuery.of(context).size.height *0.28,
                  child: Column(
                    
            children: [
               Text(widget.title,style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.grey[700],
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),),

       

              Row(children: [

               Radio(
                   value: 1,
                    groupValue:_value, 
                    
                    onChanged: (value){
                      setState(() {
                        _value = value;
                        without = false;
                      });
                    }),
                    Text('قاعة  تدريس', style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:Colors.grey,
                                      
                                     fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),
                Radio(
                   value: 2,
                    groupValue: _value, 
                     onChanged: (value){
                      setState(() {
                        _value = value;
                         without = false;

                      });
                    }),
                  Text('مختبر', style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:Colors.grey,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),
               


            ],)
            ,
            without ?SizedBox(height: 0,):SizedBox(height: 10,),
            _value == 1?
 Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                child: Container(
                  // width:width *0.1,
                  child: DropdownButton<String>(
                    
                     value: roomSelected,
                     hint: Text("اختر رقم القاعة"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: widget.room.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        roomSelected = value;
                      });
                    } ,

                   

                  ),
                ),
                
              ):_value ==2 ?
               Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                child: Container(
                  // width:width *0.1,
                  child: DropdownButton<String>(
                    
                     value: labSelected,
                     hint: Text("اختر نوع المختبر"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: widget.labs.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        labSelected = value;
                      });
                    } ,

                   

                  ),
                ),
              ):
              SizedBox(height: 0,),
        
                Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                 width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.06,
                
                 decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: [Color.fromRGBO(64, 128, 128, 1),Color.fromRGBO(64, 128, 128, 1)]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                
                                  child: InkWell(
                    child: Center(
                      child: Text('حفظ',style: GoogleFonts.amiri(
                                            fontSize: 16,
                                            color:Colors.white,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),),
                    ),
                    onTap: (){

                      
                       if( _value == 1){
                         String val = "قاعة تدريس"+","+roomSelected;
                         Navigator.of(context).pop(val);
                        }
                        else {
                        String val2 = "مختبر"+","+ labSelected;
                         Navigator.of(context).pop(val2);}


                        

                      }

                      
                    
                    
                  ),
                  
                  
                                 
              ),
            ),
          ),
            ],
          ),
        ),
         Positioned(
            top: -108,
            child: CircleAvatar(
              backgroundColor:Color.fromRGBO(64, 128, 128, 1),
              radius: 39,
              child: 
                    Icon(Icons.mode_edit, color: Colors.white, size: 30,),
            )
          ),
          ]),
        actions: [
         

           
        ],
      );
}