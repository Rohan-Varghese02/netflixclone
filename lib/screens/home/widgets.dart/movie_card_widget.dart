

import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/upcoming_model.dart';
import 'package:netflix/screens/movie_screen/movie_detailed_screen.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({super.key, required this.future, required this.headLineText});

  final Future<UpcomingMovieModel> future;
  final String headLineText;

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
              itemCount: data!.length,
              itemBuilder: (context,index){
              return InkWell(
                onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      MovieDetailedScreen(
                                                        movieId: data[index].id,
                                                      )));
                                        },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network('$imageUrl${data[index].posterPath}'),
                ),
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