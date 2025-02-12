import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/movie_detail_model.dart';
import 'package:netflix/models/movie_recommendation_model.dart';
import 'package:netflix/screens/movie_screen/widget/dwnld_btn.dart';
import 'package:netflix/screens/movie_screen/widget/info.dart';
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
  late Future<MovieRecommendationModel> movieRecommendation;

  @override
  void initState() {
    super.initState();
    fetchInitialMovieData();
  }

  fetchInitialMovieData() {
    movieDetail = apiServices.getMovieDetails(widget.movieId);
    movieRecommendation = apiServices.getRecommendations(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.movieId);
    return Scaffold(
        backgroundColor: bGcolor,
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: movieDetail,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final movie = snapshot.data;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
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
                                    icon: Icon(Icons.arrow_back_ios),
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  movie.releaseDate.year.toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Info(),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            PlayButton(),
                            SizedBox(
                              height: 5,
                            ),
                            DwnldBtn(),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              movie.overview,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 15,)
                          ],
                        ),
                      ),
                  
                      FutureBuilder(
                          future: movieRecommendation,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final movieRec = snapshot.data;
          
                              return movieRec!.results.isEmpty
                                  ? SizedBox.shrink()
                                  : Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('More Like this',style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),),
                                          
                                          GridView.builder(
                                            itemCount: min(movieRec.results.length,10),
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 5,
                                              ),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      MovieDetailedScreen(
                                                        movieId: movieRec.results[index].id,
                                                      )));
                                        },
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        '$imageUrl${movieRec.results[index].posterPath}',fit: BoxFit.cover,
                                                  ),
                                                );
                                              
                                              })
                                        ],
                                      ),
                                  );
                            }
                            return const Text('');
                          })
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
        ));
  }
}
