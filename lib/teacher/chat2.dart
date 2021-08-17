import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Chatpage2 extends StatefulWidget {

 final String idDep;
 final String instName;
 final String depName;
 final String instId;
 final String headId;
 final String gender;
 final String doctorN;

  const Chatpage2({Key key, this.idDep, this.instName, this.depName,this.instId, this.headId, this.gender, this.doctorN}) : super(key: key);



  
  @override
  _Chatpage2State createState() => _Chatpage2State();
}

class _Chatpage2State extends State<Chatpage2> {
  String groupChatId;
  
  
  // String doctorId = "";
  // String gender = "ذكر";
      String message = "";



  TextEditingController textEditingController = TextEditingController();

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    print(widget.instId);
    print(widget.headId);
    getGroupChatId();
    super.initState();
  }

  
  getGroupChatId() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
  
    
      groupChatId = '${widget.headId} - ${widget.instId}';
      print(groupChatId);
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
     
      body: Stack(children: [
       
       Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 2),
            child: StreamBuilder(
      stream: Firestore.instance
          .collection('messages')
          .document(groupChatId)
          .collection(groupChatId)
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: ListView.builder(
                  controller: scrollController,
                  itemBuilder: (listContext, index) =>
                      buildItem(snapshot.data.documents[index]),
                  itemCount: snapshot.data.documents.length,
                  reverse: true,
                )),

               buildText(context),],
            ),
          );
        } else {
          return const Center(
              child: SizedBox(
            height: 36,
            width: 36,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            ),
          ));
        }
      },
            ),
          ),
     Column(children:[
       SizedBox(height:5), buildhead(context)]),
   ]), );
  }

  sendMsg() {
    String msg = textEditingController.text.trim();
    print("inside $msg");

    /// Upload images to firebase and returns a URL

    if (msg.isNotEmpty) {
      print('thisiscalled $msg');
      var ref = Firestore.instance
          .collection('messages')
          .document(groupChatId)
          .collection(groupChatId)
          .document(DateTime.now().millisecondsSinceEpoch.toString());
      
      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(ref, {
          "senderId": widget.instId,
          "anotherUserId":widget.headId,
          "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
          'content': msg,
          "type": 'text',
        });
      });

      scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 100),
          curve: Curves.bounceInOut);
    } else {
      print('Please enter some text to send');
    }
  }
  

  buildItem(doc) {
    final radius = Radius.circular(12);
    final borderRadius = BorderRadius.all(radius);
       bool isMe = doc['senderId'] == widget.instId;


 return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          constraints: BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[200] : Theme.of(context).accentColor,
            borderRadius: isMe
                ? borderRadius.subtract(BorderRadius.only(bottomRight: radius))
                : borderRadius.subtract(BorderRadius.only(bottomLeft: radius)),
          ),
          child: buildMessage(isMe,doc),
        ),
      if (!isMe)
          CircleAvatar(
              radius: 15, backgroundImage: widget.gender=='ذكر'?AssetImage('assets/images/1.jpg'):
                    AssetImage('assets/images/2.jpg'),),
        ],
    );

  }
  Widget buildMessage(isMe ,doc) => Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '${doc['content']}',
            style: TextStyle(color: isMe ? Colors.black : Colors.white),
            textAlign: isMe ? TextAlign.start : TextAlign.end,
          ),
         
     ],
      );

  Widget buildText(BuildContext context){
return Container(
  // color:Colors.red,
  height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
              GestureDetector(
              onTap:(){
            print(message.length);


               if (message.trim().isNotEmpty ){
                                   print('2');


                 sendMsg();
                textEditingController.text = "";
                message ="";
               }
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).accentColor,
                ),
                child: Icon(Icons.send, color: Colors.white),
              ),
            ),
          SizedBox(width: 15),
            Expanded(
              child: TextField(
                controller: textEditingController,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  // labelText: 'ادخل رسالتك',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onChanged: (value) => setState(() {
                  message = value;
                  print(message);
                }),
              ),
            ),
            
          ],
        ),
      );

}
 Widget buildhead(BuildContext context) => Container(
        height: 80,
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.all(5).copyWith(left: 0),
        child: Column(

          children: [
            SizedBox(height: 18,),
            Row(
              children: [
                BackButton(color: Colors.white,
                onPressed: (){
                  Navigator.pop(context); 

                },),
                CircleAvatar(
              radius: 15, backgroundImage: widget.gender=='ذكر'?AssetImage('assets/images/1.jpg'):
                    AssetImage('assets/images/2.jpg'),),
              //  SizedBox(height: 20,),
               
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  
                    child: Text(
                      "${widget.doctorN}",
                      style: GoogleFonts.amiri(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                
              ],
            )
          ],
        ),
      );

  Widget buildIcon(IconData icon) => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white54,
        ),
        child: Icon(icon, size: 20, color: Colors.white),
      );


}

