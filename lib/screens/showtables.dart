import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/AddNewTable.dart';
import 'package:graduationproject/screens/ThreeMainCat.dart';
import 'package:graduationproject/screens/showFinalTable.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllTableshow extends StatefulWidget {

  final String idDep;
  final String instName;
  final String depName;
  final List<String> tablenames;
  final List<String> status;
  final List<String> year;

  const AllTableshow({Key key, this.idDep, this.instName, this.depName, this.tablenames, this.status, this.year}) : super(key: key);

  @override
  _AllTableshowState createState() => _AllTableshowState();
}

class _AllTableshowState extends State<AllTableshow> {

    //  List<String> tablenames=['جدول1','جدول2','جدول3','جدول1','جدول2','جدول3','جدول1','جدول2','جدول3','جدول1','جدول2','جدول3'];
    //  List<String> tabledate =['2020','2021','2022','2020','2021','2022','2020','2021','2022','2020','2021','2022','2020','2021','2022',];
    //  List<String> tabletype =['done','draft','new','done','draft','new','done','draft','new','done','draft','new','done','draft','new'];
     List<ListItem> items =[] ;
     bool wafaa = false;
     bool first = true;

  @override
  void initState() { 
    
    super.initState();
    for(int i =0 ; i<widget.tablenames.length;i++){
        items.add(ListItem(widget.tablenames[i],widget.year[i],widget.status[i]));
        
        
       }
       print("'yes'");
        print("main");
        print(items);
  
    

 
    
  }
  
Future deleteFunction(String tableName)async{

  
  

   String apiUrl = "https://core-graduation.herokuapp.com/deleteTable?name=${tableName}&idDep=${widget.idDep}";
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


  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: AppDrawer(
             idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
            appBar:AppBar(
            
              
            // backgroundColor: Color(0xFFF5CEB8),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[ Text(
                                "الجداول الدراسية",
                                style: GoogleFonts.amiri(
                                    fontSize: 20,
                                    color:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                              
                                 Padding(
                                   padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                   child: IconButton(icon: Icon(Icons.add ,color: Colors.white,size: 27,), onPressed: (){
                                      Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          AddNewTable(
                                        idDep:widget.idDep,
                                        instName :widget.instName,
                                        depName :widget.depName,
                                      ),
                                    ),
                                  ); 

                                   }),
                                 ),]

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
        
    //  wafaa? buildnew():buildnew(),
    buildnew()
    );
         

  }
  
 void onSelected(BuildContext context,MenuItem item,index){


    switch(item){
      case MenuItem.itemEdit:
         items[index].type =='done'?
          Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         ShowFinalTable(

                                        idDep:widget.idDep,
                                        instName:widget.instName,
                                        depName:widget.depName,
                                         tableName:items[index].title,
                                        year: items[index].year,
                                        courseNumbers :[],
                                        courseNames :[],
                                        insts:[],
                                        room:[],
                                        roomtype:[],
                                        fromTime:[],
                                        toTime:[],
                                        days:[],
      
                                      ),
                                    ),
                                  )
         :
        Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         Showcat(

                                        idDep:widget.idDep,
                                        instName:widget.instName,
                                        depName:widget.depName,
                                        tableName:items[index].title,
                                        year: items[index].year,


                                    
                                        
                                      ),
                                    ),
                                  );
      break;

      case MenuItem.itemDelete:
      
         setState(() {
          //  wafaa = !wafaa;
          deleteFunction(items[index].title
          );
           items.removeAt(index);
           
            });
     
      break;

    }

}

void onSelected1(BuildContext context,MenuItem1 item,index){


    switch(item){
      case MenuItem1.itemAdded:
      
          Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         Showcat(
                                      
                                        idDep:widget.idDep,
                                        instName:widget.instName,
                                        depName:widget.depName,
                                        tableName:items[index].title,
                                        year: items[index].year,
                                      ),
                                    ),
                                  );
      print("add");
      print(items[index].title);
      break;

      case MenuItem1.itemDelete:
      
         setState(() {
              setState(() {
          //  wafaa = !wafaa;
          deleteFunction(items[index].title
          );
           items.removeAt(index);
           
            });
     
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
      Divider(height: 20, thickness: 500,color:Colors.white ,),
      Text(item.text,style: GoogleFonts.amiri(
                                    fontSize: 15,
                                    color:Color.fromRGBO(33, 84, 84,1,),
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),

      ]),);

PopupMenuItem<MenuItem1> bulideritem1(MenuItem1 item)=>PopupMenuItem<MenuItem1>(
    value: item,
    child: Row(children:[ 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(item.icon1,color:Colors.grey[400],size:20),
      ),
      // SizedBox(height: 10,),
      Divider(height: 20, thickness: 500,color:Colors.white ,),
      Text(item.text1,style: GoogleFonts.amiri(
                                    fontSize: 15,
                                    color:Color.fromRGBO(64, 128, 128, 1),
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),

      ]),);


      Widget buildnew(){

    
                   
                    
                  return  CustomScrollView(slivers: [
           

                 
                // ),
              
              
            
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                 
                    return SingleChildScrollView(
                      child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: [

                            // first?SizedBox(height: 50,):SizedBox(height: 0,),

                            SizedBox(
                              height: 0,
                            ),
                            Padding(
                              padding: index ==0? const EdgeInsets.fromLTRB(0, 30, 0, 0):const EdgeInsets.all(0),
                              child: Container(
                                
                                height: MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: GestureDetector(
                                  
                                  onTap: () {
                                    print (items[index].title);
                                    
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Card(
                                      
                                      color: Color.fromRGBO(33, 84, 84,1,),
                                    
                                      shape: RoundedRectangleBorder(
                                        side:
                                            BorderSide(color:Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                           Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              if (items[index].type =='new') 
                                               Padding(
                                                 padding: const EdgeInsets.fromLTRB(1, 0, 30, 0),
                                                 child: Icon(Icons.new_releases,color: Colors.white,size: 20,),
                                               ),
                                                if(items[index].type =='draft')
                                                 Padding(
                                                 padding: const EdgeInsets.fromLTRB(1, 0, 30, 0),
                                                 child: Icon(Icons.save,color: Colors.white,size: 20,),
                                               ),
                                                if(items[index].type =='done')
                                                  Padding(
                                                 padding: const EdgeInsets.fromLTRB(1, 0, 30, 0),
                                                 child: Icon(Icons.check,color: Colors.white,size: 20,),
                                               ),
                                               if (items[index].type =='proc') 
                                               Padding(
                                                 padding: const EdgeInsets.fromLTRB(1, 0, 30, 0),
                                                 child: Icon(Icons.work,color:Colors.white,size: 20,),
                                               ),

                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(10, 0, 25, 0),
                                                child: Container(
                                                    child: Text('${items[index].title}',
                                                        style: GoogleFonts.amiri(
                                                        fontSize: 20,
                                                        color:Colors.white,
                                            
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.7),
                                      textAlign: TextAlign.center,)),
                                              ),


                                                       
          

                                                     ],
                                           
                                           
                                            
                                          ),
  
                                           Container(
      
              child: items[index].type !='new'? PopupMenuButton<MenuItem>(
                
                onSelected:(item)=>onSelected(context,item,index) ,
                itemBuilder: (context)=>[
                  ...MenuItem.itemsOne.map(bulideritem).toList(),
                  PopupMenuDivider(),
                  ...MenuItem.itemsTwo.map(bulideritem).toList(),

                ]
              ): PopupMenuButton<MenuItem1>(
                
                onSelected:(item)=>onSelected1(context,item,index) ,
                itemBuilder: (context)=>[
                  ...MenuItem1.itemsOne.map(bulideritem1).toList(),
                  PopupMenuDivider(),
                  ...MenuItem1.itemsTwo.map(bulideritem1).toList(),

                ]
              ),
            ),
                                        ],
                                      ),
                                      elevation: 5,
                                      // margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          
                          ],
                        ),
                      ),
                    );
                },
                   
                childCount: items.length,
              ),
            )
          ]);
                  
          
                    
                   
      }
}




class ListItem{
  final String  title;
  final String year;
  final String type;

  ListItem(this.title, this.year, this.type);



  
}
class MenuItem1{
  final String text1;
  final IconData icon1;
  static  List<MenuItem1> itemsOne = [
    itemAdded
  ];
  static  List<MenuItem1> itemsTwo = [
    itemDelete
  ];

  const MenuItem1(this.text1, this.icon1);

  static const MenuItem1 itemAdded = MenuItem1('اضافة',
  Icons.add);
    static const MenuItem1 itemDelete = MenuItem1('حذف',
    Icons.delete_outline);

  
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



 