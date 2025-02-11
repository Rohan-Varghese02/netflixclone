import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/tv_series_model.dart';
import 'package:netflix/models/upcoming_model.dart';
import 'package:netflix/models/upcoming_tv_model.dart';
import 'package:netflix/screens/home/widgets.dart/appBar_widgets.dart';
import 'package:netflix/screens/home/widgets.dart/custom_carousel.dart';
import 'package:netflix/screens/home/widgets.dart/movie_card_widget.dart';
import 'package:netflix/screens/home/widgets.dart/top_ten_card_widget.dart';
import 'package:netflix/screens/home/widgets.dart/top_ten_tv_card.dart';
import 'package:netflix/services/api_services.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<UpcomingMovieModel>upcomingFuture;
  late Future<UpcomingMovieModel>toptenFuture;
  late Future<UpcomingTvModel>toptentvFuture;
  late Future<TvSeriesModel> topRatedFuture;
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
  upcomingFuture = apiServices.getUpcomingMovies();
  toptenFuture = apiServices.getTopTenMovies();
  toptentvFuture = apiServices.getTopTenShow();
  topRatedFuture = apiServices.getTvSeries();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGcolor,
      appBar: AppBar(
        backgroundColor: bGcolor,
        title: Text('For Rohan',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
        actions: [
          screenShareButton(context),
    downloadButton(context),
    searchButton(context)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(future: topRatedFuture, builder: (context,snapshot){
              if(snapshot.hasData){
              return CustomCarousel(data: snapshot.data!);
              }
              else{
                return SizedBox.shrink();
              }
            }),
            SizedBox(
              height: 220,
              child: MovieCardWidget(future: upcomingFuture, headLineText: 'Upcoming Movies')),
              SizedBox(height: 10,),
              SizedBox(
              height: 220,
              child: TopTenCardWidget(future: toptenFuture, headLineText: 'Top 10 Movies in India Today')),
              SizedBox(height: 10,),
              SizedBox(
              height: 220,
              child: TopTenTvCard(future: toptentvFuture, headLineText: 'Top 10 TV Shows in India Today')),
              SizedBox(height: 10,),
              SizedBox(
              height: 220,
              child: MovieCardWidget(future: upcomingFuture, headLineText: 'Popular Movies')),
          ],
        ),
      ),
    );
  }
}