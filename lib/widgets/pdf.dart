// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// import 'package:pdf/widgets.dart';


// class User {
//   final String name;
//   final int age;

//   User(this.name, this.age);


// }

// class PdfApi {

 
//   static Future<File> generateTable() async {
//     final pdf = Document();

//     final headers = ['Name', 'Age'];

//     final users = [
//       User('James',  19),
//       User('Sarah', 21),
//       User('Emma', 28),
//     ];
//     final data = users.map((user) => [user.name, user.age]).toList();

//     pdf.addPage(Page(
//       build: (context) => Table.fromTextArray(
//         headers: headers,
//         data: data,
//       ),
//     ));

//     return saveDocument(name: 'my_example.pdf', pdf: pdf);
//   }

//    static Future<File> saveDocument({
//      final String name,
//      final Document pdf,
//   }) async {
//     final bytes = await pdf.save();

//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');

//     await file.writeAsBytes(bytes);
//     final url = file.path;
//     print(url);

//     return file;
//   }


// }