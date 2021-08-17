// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // class Tableshow extends StatefulWidget {


// //   @override
// //   _TableshowState createState() => _TableshowState();
// // }

// // class _TableshowState extends State<Tableshow> {

// //        List<String> roomsnames=['جدول1','جدول2','جدول3'];
// //      List<String> roomstype=['2020','2021','2022'];
// //      List<ListItem> items =[] ;

// //   @override
// //   void initState() { 
    
// //     super.initState();
// //     for(int i =0 ; i<roomsnames.length;i++){
// //         items.add(ListItem(roomsnames[i],roomstype[i]));
        
        
// //        }
// //        print("'yes'");
// //         print("main");
  
    

 
    
// //   }
  
  

  
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //             appBar:AppBar(
// //             // backgroundColor: Color(0xFFF5CEB8),
        
            
// //             elevation: 0,
      
   

          
// //       ),
// //       body: ListView.builder(
// //         itemCount: items.length+1,
// //         itemBuilder: (context,index){
// //           return
// //           index == items.length?
// //           InkWell(child: Text("soso"),
// //           onTap: (){
// //             print("button");

// //           },
          
// //           ):
// //            ListTile(
// //             title: Text(items[index].title),
// //             leading:IconButton(
// //               icon: Icon(Icons.delete),
// //               onPressed: (){
// //                 print("icon1");
// //               },
            
// //             ),
// //             trailing:IconButton(
// //               icon: Icon(Icons.edit),
// //               onPressed: (){
// //                 print("icon2");
// //               }, 
// //               ),

            

// //             onTap:() {
// //               print(items[index].title);


// //             },
// //           );

// //         }),

        
        
// //                 //  buildDataTable(),
                
// //                 // AnimatedList(
// //                 //   initialItemCount: items.length,
                  
// //                 //   itemBuilder:(context,index,animation)=> ListItemWidget(
// //                 //     item:items[index],
// //                 //     animation:animation,
// //                 //     onClick:(){},
// //                 //   ),


// //                 // ),


    
// //     );
         

// //   }
// //   // Widget buildDataTable() {
// //   //        final columns = ['رقم القاعة','نوع القاعة','الحرم '];


// //   //   return DataTable(
  
// //   //     columns: getColumns(columns),
// //   //     rows: getRows(rooms),
// //   //   );
// //   // }

// //   //  List<DataColumn> getColumns(List<String> columns) => columns
// //   //     .map((String column) => DataColumn(
// //   //           label: Text(column),
// //   //         ))
// //   //     .toList();


// //   //     List<DataRow> getRows(List<Room> rooms) => rooms.map((Room room) {
// //   //       final cells = [room.number, room.type, room.camp];

// //   //       return DataRow(cells: getCells(cells));
// //   //     }).toList();

// //   //   List<DataCell> getCells(List<String> cells) =>
// //   //     cells.map((data) => DataCell(Text('$data'))).toList();

  





 
  


// // }



// // class ListItem{
// //   final String  title;
// //   final String year;

// //   ListItem(this.title, this.year);



  
// // }

// // // class  ListItemWidget extends StatelessWidget {
// // //   final ListItem item;
// // //   final Animation<double> animation;
// // //   final VoidCallback onClick;

// // //   const ListItemWidget({Key key, this.item, this.animation, this.onClick}) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context)=> buildItem();

// // //   Widget buildItem()=> Container(
// // //     margin: EdgeInsets.all(8),
// // //     decoration: BoxDecoration(

// // //       borderRadius: BorderRadius.circular(12),
// // //       color:Colors.green
// // //     ),
// // //     child: ListTile(
// // //       contentPadding: EdgeInsets.all(16),
      

// // //     ),
// // //   );
// // // }



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:graduationproject/widgets/button2.dart';
// import 'package:graduationproject/widgets/utils.dart';


// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
// int index =0;
// bool select = false;
// List <String> values=[
//   '2016/2017','2017/2018',
//   '2018/2019','2019/2020',
//   '2020/2021','2021/2022',
//   '2022/2023','2023/2024',
//   '2025/2026','2026/2027',
//   '2027/2028','2028/2028',
//   '2028/2029','2029/2030',
//   '2030/2031','2031/2032',
//   '2032/2033','2033/2034',
//   '2034/2035','2035/2036',

// ];
//  TimeOfDay time;
//    String getText() {
//     if (time == null) {
//       return 'اختر الوقت';
//     } else {
//       final hours = time.hour.toString().padLeft(2, '0');
//       final minutes = time.minute.toString().padLeft(2, '0');

//       return '$hours:$minutes';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
    
//        return Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("wafaa"),
//               //  buildCustomPicker(),
//               const SizedBox(height: 24),
//               // ButtonWidget(
//               //   onClicked: ()
//               //    => Utils.showSheet(
//               //     context,
//               //     child: buildCustomPicker(),
//               //     onClicked: () {
//               //       final value = values[index];
//               //       print(value);
//               //       // Utils.showSnackBar(context, 'Selected "$value"');

//               //       Navigator.pop(context);
//               //     },
//               //   ),
//               // ),
              

//               ButtonTimePiker(title: "الوقت", 
//               text: getText(), onClicked: ()=>pickTime(context)),

//              select? Text(getText()):SizedBox(height :0),
//             ],
//           ),
//         ),
//       );
//   }



//  Future pickTime(BuildContext context) async {
   
//     final initialTime = TimeOfDay(hour: 8, minute: 0);
//     final newTime = await showTimePicker(
//       context: context,
//       initialTime: time ?? initialTime,
//     );

//     if (newTime == null) return;

//     setState(() => time = newTime);
//     setState(() {
//       select = true;
//     });

//   }

// }




// // Widget buildCustomPicker() => SizedBox(
// //         height: 300,
// //         child: CupertinoPicker(
          
// //           itemExtent: 64,
// //           diameterRatio: 0.7,
// //           looping: true,
// //           //  selectionOverlay:,
// //           //   CupertinoPickerDefaultSelectionOverlay(
// //           //   background: Colors.pink.withOpacity(0.12),
// //           // ),
// //           onSelectedItemChanged: (index) =>
// //            setState(() => this.index = index),
// //           // selectionOverlay: Container(),
         
// //           children: Utils.modelBuilder<String>(
// //             values,
// //             (index, value) {
// //               // print(1);
// //               // print(values[index]);
// //               // print(5);
// //               // print(value);
// //               final isSelected = this.index == index;
// //               final color = isSelected ? Color.fromRGBO(212, 172, 13,1,) : Colors.green;

// //               return Center(
// //                 child: Text(
// //                   value,
// //                   style: TextStyle(color: color, fontSize: 24),
// //                 ),
// //               );
// //             },
// //           ),
// //         ),
// //       );
