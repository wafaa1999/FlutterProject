import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/widgets/Button3.dart';

Future<T> showTextDialog3<T>(
  BuildContext context, {
  String title ,
  String value,
 
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TimeDialogWidget(
        title: title,
 
      
      ),
    );

class TimeDialogWidget extends StatefulWidget {
  final String title;



  const TimeDialogWidget({
    Key key,
    this.title, 

   
  }) : super(key: key);

  @override
  _TimeDialogWidgetState createState() => _TimeDialogWidgetState();
}

class _TimeDialogWidgetState extends State<TimeDialogWidget> {
  

  @override
  void initState() {
    super.initState();

   
  }   TimeOfDay time;
      TimeOfDay time2;
      int _value =0;
      String roomSelected;
      String labSelected;
      bool without = true;
      bool wafaa = false;
      bool day1 =false;
     bool day2 =false;
     bool day3 =false;
     bool day4 =false;
     bool day5 =false;
     bool day6 =false;
     bool select = false;
     bool select2 = false;


  @override
  Widget build(BuildContext context) => AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      
        title: Text(widget.title,style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.grey[700],
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),),

        content: 
        Stack(
          overflow: Overflow.visible,
        alignment: Alignment.topCenter,
          children:[
        Container(
          height: 280,
                  child: Column(
            children: [
                  Padding(
             padding: const EdgeInsets.fromLTRB(1, 0, 15, 2),
             child: Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
             
                    child: Text("موعد بدء المحاضرة",style: GoogleFonts.amiri(
                                        fontSize: 16,
                                        color:Colors.black,
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(0),
                   child: Center(
                     child: Button3(title: "", 
                text: getText(), onClicked: ()=>pickTime(context)),
                   ),
                 ),

              //  select? Text(getText()):SizedBox(height :0),
         
         
             ],),
           ),
      
       Padding(
             padding: const EdgeInsets.fromLTRB(1, 0, 15, 2),
             child: Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
             
                    child: Text("موعد نهاية المحاضرة",style: GoogleFonts.amiri(
                                        fontSize: 16,
                                        color:Colors.black,
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(0),
                   child: Center(
                     child: Button3(title: "", 
                text: getText2(), onClicked: ()=>pickTime2(context)),
                   ),
                 ),

              //  select2? Text(getText2()):SizedBox(height :0),
         
         
             ],),
           ),
           SizedBox(height: 2,),
            Padding(
               padding: const EdgeInsets.fromLTRB(1, 2, 15, 0),
               child: Row(
                 children: [
                   Text("الايام:",style: GoogleFonts.amiri(
                                                  fontSize: 16,
                                                  color:Colors.black,
                                                    
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.7),),
                 ],
               ),
             ),
              Padding(
             padding: const EdgeInsets.fromLTRB(0, 2, 2, 0),
             child: Row(
             children:[

             Padding(
               padding: const EdgeInsets.all(0.0),
               child: Checkbox(value: day1, onChanged:(value,
    //                activeColor:Colors.red,
    // this.checkColor,
    // this.focusColor,
    // this.hoverColor,
    ){
                 setState(() {
                                day1 =value;
                 }); 
               }),
             ),
              Padding(
               padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
               child: Text("السبت",style: GoogleFonts.amiri(
                                              fontSize: 16,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7),),
             ),

             

             Checkbox(value: day2, onChanged:(value){
               setState(() {
                              day2 =value;
               }); 
             }),
             Padding(
               padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
               child: Text("الاحد",style: GoogleFonts.amiri(
                                              fontSize: 16,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7),),
             ),

             Checkbox(value: day3, onChanged:(value){
               setState(() {
                              day3 =value;
               }); 
             }),
             Padding(
               padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
               child: Text("الاثنين",style: GoogleFonts.amiri(
                                              fontSize: 16,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7),),
             ),



             
              ] ),
           ),
          Row(
           children:[ Padding(
             padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
             
           ),

           Padding(
             padding: const EdgeInsets.all(0.0),
             child: Checkbox(value: day4, onChanged:(value){
               setState(() {
                              day4 =value;
               }); 
             }),
           ),
            Padding(
             padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
             child: Text("الثلاثاء",style: GoogleFonts.amiri(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),),
           ),

           

           Checkbox(value: day5, onChanged:(value){
             setState(() {
                            day5 =value;
             }); 
           }),
           Padding(
             padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
             child: Text("الاربعاء",style: GoogleFonts.amiri(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),),
           ),

           Checkbox(value: day6, onChanged:(value){
             setState(() {
                            day6 =value;
             }); 
           }),
           Padding(
             padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
             child: Text("الخميس",style: GoogleFonts.amiri(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),),
           ),



           
            ] ),
         

             
            ],
          ),
        ),
         Positioned(
            top: -108,
            child: CircleAvatar(
              backgroundColor:Colors.redAccent,
              radius: 39,
              child: 
                    Icon(Icons.check, color: Colors.white, size: 30,),
            )
          ),
          ]),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                 decoration: BoxDecoration(
                              // gradient: new LinearGradient(
                              //     colors: [Color.fromRGBO(206, 222, 222, 1), Color.fromRGBO(206, 222, 222, 1)]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                child: Row(
                                  children:[ ElevatedButton(
                    child: Text('حفظ',style: GoogleFonts.amiri(
                                          fontSize: 16,
                                          color:Colors.white,
                                            
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.7),),
                    onPressed: (){

                      
                      String timeSlot = getText() +"/"+ getText2() +'/';
                       List<String> days = [];
         if(day1 == true){
           days.add( 'سبت');
         }
          if(day2 == true){
           
           days.add( 'احد');
         }
          if(day3 == true){
           
           days.add( 'اثنين');
         }
          if(day4 == true){
           
           days.add( 'ثلاثاء');
         }
          if(day5 == true){
           
           days.add( 'اربعاء');
         }
          if(day6 == true){
           days.add( 'خميس');
         } 
         for(int y =0; y<days.length;y++){
           timeSlot += days[y];
           if(y+1 ==days.length){
             continue;
           }
           timeSlot += ',';
         }


                         Navigator.of(context).pop(timeSlot);}


                        

                      

                      
                    
                    
                  ),
                  
                  
                                  ]),
              ),
            ),
          ),

           
        ],
      );

       String getText() {
    if (time == null) {
      return 'اختر الوقت';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');
     
    

      return '$hours:$minutes';
    }
  }

   String getText2() {
    if (time2 == null) {
      return 'اختر الوقت';
    } else {
      final hours = time2.hour.toString().padLeft(2, '0');
      final minutes = time2.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }
  
   Future pickTime(BuildContext context) async {
   
    final initialTime = TimeOfDay(hour: 8, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
    setState(() {
      select = true;
    });

  }

  Future pickTime2(BuildContext context) async {
   
    final initialTime = TimeOfDay(hour: 8, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time2 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time2 = newTime);
    setState(() {
      select2 = true;
    });

  }
 

}