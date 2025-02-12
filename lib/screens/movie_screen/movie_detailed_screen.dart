import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/movie_detail_model.dart';
import 'package:netflix/screens/movie_screen/widget/dwnld_btn.dart';
import 'package:netflix/screens/movie_screen/widget/play_button.dart';
import 'package:netflix/services/api_services.dart';

class MovieDetailedScreen extends StatefulWidget {
  const MovieDetailedScreen({super.key, required this.movieId});

  final int movieId;

  @override
  State<MovieDetailedScreen> createState() => _MovieDetailedScreenState();
}

class _MovieDetailedScreenState extends State<MovieDetailedScreen> {
  ApiServices apiServices = ApiServices();
  late Future<MovieDetailModel> movieDetail;

  @override
  void initState() {
    super.initState();
    fetchInitialMovieData();
  }

  fetchInitialMovieData() {
    movieDetail = apiServices.getMovieDetails(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.movieId);
    return Scaffold(
        backgroundColor: bGcolor,
        body: FutureBuilder(
            future: movieDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movie = snapshot.data;

                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '$imageUrl${movie!.posterPath}'),
                                  fit: BoxFit.cover)),
                          child: SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back_ios),color: Colors.white,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(movie.title,style: GoogleFonts.poppins(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text(movie.releaseDate.year.toString(),style: GoogleFonts.poppins(color: Colors.grey,fontSize: 18),),
                              SizedBox(width: 5,),
                              Container(
                                height: 20,
                                width: 50,
                                color: const Color.fromARGB(255, 51, 50, 50),
                                child: Center(child: Text('U/A 16+',style: TextStyle(fontSize: 10,color: const Color.fromARGB(255, 175, 167, 167),fontWeight: FontWeight.w500))),
                              ),
                              SizedBox(width: 5,),
                              Text('2h 20m',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 18),),
                              SizedBox(width: 10,),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 51, 50, 50))),
                                child: Center(child: Text('HD',style: TextStyle(fontSize: 10,color: const Color.fromARGB(255, 175, 167, 167),fontWeight: FontWeight.w500))),
                            
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                              PlayButton(),
                              SizedBox(height: 5,),
                              DwnldBtn(),
                              SizedBox(height: 5,),
                              Text(movie.overview,style: const TextStyle(color: Colors.grey),)
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return SizedBox.shrink();
              }
            }));
  }
}
