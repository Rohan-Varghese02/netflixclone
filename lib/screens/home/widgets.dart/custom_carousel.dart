import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/tv_series_model.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key, required this.data});

  final TvSeriesModel data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 240,
      child: CarouselSlider.builder(itemCount: data.results.length,
       itemBuilder: (BuildContext context, int index, int realIndex) { 
        var url = data.results[index].backdropPath.toString();

        return GestureDetector(
          child: Column(
            children: [
              CachedNetworkImage(imageUrl: '$imageUrl$url'),
              SizedBox(height: 20,),
              Text(data.results[index].name,style: TextStyle(color: Colors.white),),
            ],
          ),
          
        );
       }, options: CarouselOptions(
        height: (size.height *0.33<300)?300: size.height*0.33,
        aspectRatio: 16/9,
        reverse: false,
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enlargeCenterPage: true,
       ),),
    );
  }
}