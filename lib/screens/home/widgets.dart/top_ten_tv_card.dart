import 'dart:math';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/upcoming_tv_model.dart';

class TopTenTvCard extends StatelessWidget {
  final Future<UpcomingTvModel> future;
  final String headLineText;
  const TopTenTvCard({super.key,required this.future, required this.headLineText});

 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: future, builder: (context,snapshot){
      if(snapshot.hasData){
      var data = snapshot.data?.results;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(headLineText, style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: min(data!.length,10),
              itemBuilder: (context,index){
              return Stack(
                children: [
                  Positioned(
                  bottom: -30,
                  left: -7,
                  child: Container(
                    padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  ),
                  child: BorderedText(
                    strokeColor: Colors.white,
                    strokeWidth: 4.0,
                    child: Text('${index+1}',style: TextStyle(color: Colors.black,fontSize: 100, fontWeight: FontWeight.bold, decoration: TextDecoration.none, decorationColor: Colors.white),
                    )),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Container(
                    padding: const EdgeInsets.only(left: 30, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image.network('${imageUrl}${data[index].posterPath}'),
                                    ),
                  ),
                
                ]
              );
            },),
          )
        ],
      );
      }
      else{
        return SizedBox();
      }
    });
  }
}