import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/movie_recommendation_model.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/services/api_services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();
  late Future<MovieRecommendationModel> popularMovies;
  SearchModel? searchModel;

  void search(String query) {
    apiServices.getSearchMovie(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    popularMovies = apiServices.getMovieRecommendation();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bGcolor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBar(
                    textStyle: WidgetStateProperty.all(TextStyle(color: Colors.white)),
                    backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 44, 44, 44)),
                    controller: searchController,
                    leading: Icon(Icons.search,color: Colors.grey,),
                    trailing: [
                      IconButton(
                        icon: Icon(Icons.cancel,color: Colors.grey,),
                        onPressed: () {
                          searchController.clear();
                        },
                      ),
                    ],
                    onChanged: (value) {
                      if (value.isEmpty) {
                      } else {
                        search(searchController.text);
                      }
                    },
                  ),
                ),
           
                searchController.text.isEmpty
                    ? FutureBuilder(
                        future: popularMovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data?.results;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Recommended TV Shows & Movies',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: data!.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 150,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Image.network(
                                                  '${imageUrl}${data[index].posterPath}'),
                                                  SizedBox(width: 20,),
                                                  SizedBox( width: 200,
                                                    child: Text(data[index].title,style: TextStyle(color: const Color.fromARGB(255, 205, 204, 204)),maxLines: 2, overflow: TextOverflow.ellipsis,),),
                                                  Icon(Icons.play_circle_outline,color: const Color.fromARGB(255, 205, 204, 204),size: 40,)
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        })
                    : searchModel == null
                        ? SizedBox.shrink()
                        : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: searchModel!.results.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 5,
                              //childAspectRatio: 1.5 / 2
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        '$imageUrl${searchModel!.results[index].backdropPath}',
                                    height: 203,
                                    fit: BoxFit.cover,
                                  ),
                                  // Text(searchModel!.results[index].originalTitle,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14,color: Colors.white),)
                                ],
                              );
                            })
              ],
            ),
          )),
    );
  }
}
