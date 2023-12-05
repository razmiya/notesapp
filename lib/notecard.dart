import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miniproject1/appstyle.dart';
Widget noteCard(Function()? onTop,QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTop,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc["note_title"]),
            // style:AppStyle.mainTile,),
          SizedBox(
            height: 4,
          ),
          Text(doc["creating_date"]),
            // style:AppStyle.dateTitle,),
          SizedBox(
            height: 8,
          ),
          Text(doc["note_content"],
            // style:AppStyle.mainContent,
          overflow: TextOverflow.ellipsis,),
        ],
      ),
    ),
  );
}