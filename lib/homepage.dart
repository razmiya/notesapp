import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miniproject1/appstyle.dart';
import 'package:miniproject1/notecard.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("FireNotes"),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your recent notes",
            // style: GoogleFonts.r(=Colors.white,
            //     fontweight:FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
         Builder(
           builder: (context) => Expanded(
               child: StreamBuilder<QuerySnapshot>(
                   stream: FirebaseFirestore.instance.collection("notes").snapshots(),
                   builder: (context,AsyncSnapshot snopshot){
                     if(snopshot.connectionState == ConnectionState.waiting){
                       return Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                     if(snopshot.hasData){
                       return GridView(
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                         children: snopshot.data!.docs.map((note) => noteCard((){}, note)).toList(),
                         // children: snopshot.data!.docs.map((note) => noteCard((){}, note)).toList(),
                       );
                     }
                     return Text("there is no notes",
                       // style: GoogleFonts.nunito(color:Colors.white),
                     );
                   },
               ),
             )
         )
        ],
      ),
    );
  }
}

