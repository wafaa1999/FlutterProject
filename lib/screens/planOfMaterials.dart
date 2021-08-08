
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/AddNewMaterial.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlanOfMaterials extends StatefulWidget {
   final String idInst;
   final String idDep;
     final String depName;
  final String instName;

  const PlanOfMaterials({Key key, this.idInst, this.idDep, this.depName, this.instName}) : super(key: key);

  @override
  _PlanOfMaterialsState createState() => _PlanOfMaterialsState();
}

class _PlanOfMaterialsState extends State<PlanOfMaterials> {

  String idIstructor = "60ddd594f7368d0aaf470b60" ;
   Map decoded;
   bool clicked = false;
   bool clicked2 = false;
   bool clicked3 = false;
   bool clicked4 = false;
   bool clicked5 = false;
   bool clicked6 = false;
   bool clicked7 = false;
   bool clicked8 = false;
  bool clicked9 = false;
   bool clicked10 = false;
  bool clicked11 = false;
   
   int selected;
   List names=[];
   List numbers=[];


  @override
  void initState() { 
    super.initState();
    print(widget.idDep);
    //  getMat(idIstructor);
    
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
                              "الخطة الدراسية",
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
                
                

                
                  onTap:(){
                    
                    Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         AddNewMat(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                      ),
                                    ),
                                  ); 
                    },
                 
                  
                ),

                   


             
            ),
          ),

         
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            
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
              child: ExpansionTile(
              

                title: Text(
                              "السنة الأولى",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),

                trailing: Icon(clicked || clicked2?Icons.arrow_drop_up:Icons.arrow_drop_down
                ,color: clicked|| clicked2?Colors.white:Colors.white,),
                
                children:[

                InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,1,1);

                   setState(() {
                     clicked = !clicked;
                     clicked2 = false;
                     
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       

                       child: ListTile(
                        
                    title: Text(
                                "-الفصل الأول-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),

                      InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,1,2);

                   setState(() {
                     clicked2 = !clicked2;
                     clicked = false;
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked2?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       
                       child: ListTile(
                    title: Text(
                                "-الفصل الثاني-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked2?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),
                   


                ]
                
              ),
            ),
          ),

          clicked == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                           
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),

           clicked2 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),


                          ///// second
         Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            
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
              child: ExpansionTile(
              

                title: Text(
                              "السنة الثانية",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),

                trailing: Icon(clicked3 || clicked4?Icons.arrow_drop_up:Icons.arrow_drop_down
                ,color: clicked3|| clicked4?Colors.white:Colors.white,),
                
                children:[

                InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,2,1);

                   setState(() {
                     clicked3 = !clicked3;
                     clicked4 = false;
                     
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked3?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       

                       child: ListTile(
                        
                    title: Text(
                                "-الفصل الأول-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked3?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),

                      InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,2,2);

                   setState(() {
                     clicked4 = !clicked4;
                     clicked3 = false;
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked4?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       
                       child: ListTile(
                    title: Text(
                                "-الفصل الثاني-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked4?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),
                   


                ]
                
              ),
            ),
          ),

          clicked3 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                           
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),

           clicked4 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),

/// third
           Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            
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
              child: ExpansionTile(
              

                title: Text(
                              "السنة الثالثة",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),

                trailing: Icon(clicked5 || clicked6?Icons.arrow_drop_up:Icons.arrow_drop_down
                ,color: clicked5|| clicked6?Colors.white:Colors.white,),
                
                children:[

                InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,3,1);

                   setState(() {
                     clicked5 = !clicked5;
                     clicked6 = false;
                     
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked5?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       

                       child: ListTile(
                        
                    title: Text(
                                "-الفصل الأول-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked5?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),

                      InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,3,2);

                   setState(() {
                     clicked6 = !clicked6;
                     clicked5 = false;
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked6?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       
                       child: ListTile(
                    title: Text(
                                "-الفصل الثاني-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked6?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),
                   


                ]
                
              ),
            ),
          ),

          clicked5 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                           
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),

           clicked6 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),

                        /// fourth
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            
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
              child: ExpansionTile(
              

                title: Text(
                              "السنة الرابعة",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),

                trailing: Icon(clicked7 || clicked8?Icons.arrow_drop_up:Icons.arrow_drop_down
                ,color: clicked7|| clicked8?Colors.white:Colors.white,),
                
                children:[

                InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,4,1);

                   setState(() {
                     clicked7 = !clicked7;
                     clicked8 = false;
                     
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked7?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       

                       child: ListTile(
                        
                    title: Text(
                                "-الفصل الأول-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked7?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),

                      InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,4,2);

                   setState(() {
                     clicked8 = !clicked8;
                     clicked7 = false;
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked8?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       
                       child: ListTile(
                    title: Text(
                                "-الفصل الثاني-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked8?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),
                   


                ]
                
              ),
            ),
          ),

          clicked7 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                           
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),

           clicked8 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),

            Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            
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
              child: ExpansionTile(
              

                title: Text(
                              "السنة الخامسة",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),

                trailing: Icon(clicked9 || clicked10?Icons.arrow_drop_up:Icons.arrow_drop_down
                ,color: clicked9|| clicked10?Colors.white:Colors.white,),
                
                children:[

                InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,5,1);

                   setState(() {
                     clicked9 = !clicked9;
                     clicked10 = false;
                     
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked9?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       

                       child: ListTile(
                        
                    title: Text(
                                "-الفصل الأول-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked9?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),

                      InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,5,2);

                   setState(() {
                     clicked10 = !clicked10;
                     clicked9 = false;
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked10?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       
                       child: ListTile(
                    title: Text(
                                "-الفصل الثاني-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked10?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),
                   


                ]
                
              ),
            ),
          ),

          clicked9 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                           
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),

           clicked10 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1),


                          //
                Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            
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
              child: ExpansionTile(
              

                title: Text(
                              "المساقات الاختيارية",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),

                trailing: Icon(clicked11?Icons.arrow_drop_up:Icons.arrow_drop_down
                ,color: clicked11?Colors.white:Colors.white,),
                
                children:[

                InkWell(
                  onTap:()async{
                    await getMat(widget.idInst,-1,-1);

                   setState(() {
                     clicked11 = !clicked11;
                     
                     
                   });
                    },
                     child:Container(
                       decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors:clicked11?[Colors.grey[200], Colors.grey[200]] :
                              [Color.fromRGBO(79, 84, 103, 1), Color.fromRGBO(64, 128, 128, 1)]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ]),
                       

                       child: ListTile(
                        
                    title: Text(
                                "-الفصل الأول و الثاني-",
                                style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:clicked11?Colors.black:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                           trailing: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(79, 84, 103, 1),),

                    
                    

                  ),
                     ),
                ),

                
                   


                ]
                
              ),
            ),
          ),

          clicked11 == true?
            Column(children: [
               for(int i =0; i<numbers.length ;i++)
                        Center(
                          child: ListTile(
                            
                      title: Row(
                          
                          children: [
                           
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                                
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                                  
                              borderRadius: BorderRadius.circular(5),
                               boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:i%2==1?Colors.white:Colors.grey[200],
                                offset: Offset(1, 1))
                          ]
                            ),
                              
                              child: Center(
                                child: Text(
                              "${numbers[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),

                      Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              
                              decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: i%2==1?[Colors.white, Colors.white]:
                                  [Colors.grey[200], Colors.grey[200]]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              
                              child: Center(
                                child: Text(
                              "${names[i]}",
                              style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:i==0?Color.fromRGBO(64, 128, 128, 1):Colors.black,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),)),
                          ),
                      ],),
                   
                      
               
                              
                            ),
                        ), 
                           ],
                           )
                          :SizedBox(height:1)









                        
          
          

        ],),
      ),
      


        
                
              
         );

    
    
      }

     

  Future getMat(String idIstructor,year,sem) async {
    idIstructor =widget.idDep;
    names.clear();
    numbers.clear();
    names.add("رقم المساق");
    numbers.add("اسم المساق");
    final String apiUrl = "https://core-graduation.herokuapp.com/getMaterialsOfDepartment?idIstructor=$idIstructor&year=$year&sem=$sem";
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        decoded = json.decode(response.body) as Map<String, dynamic>; 

     for(int i =0; i<decoded['response'].length; i++){
       names.add(decoded['response'][i]['name']);  
       numbers.add(decoded['response'][i]['number']);

       }
    

    

      }

    
     
    
    }

 




    }

   

     
 

