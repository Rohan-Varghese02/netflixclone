import 'dart:convert';
import 'dart:developer';

import 'package:netflix/common/utils.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/models/movie_detail_model.dart';
import 'package:netflix/models/movie_recommendation_model.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/models/tv_series_model.dart';
import 'package:netflix/models/upcoming_model.dart';
import 'package:netflix/models/upcoming_tv_model.dart';

const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPont;

class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPont = 'movie/upcoming';
    final url = '$baseUrl$endPont$key';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success');

      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to Load upcoming movies');
  }

  Future<UpcomingMovieModel> getTopTenMovies() async {
    endPont = 'movie/now_playing';
    final url = '$baseUrl$endPont$key';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success, top 10');

      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to Load top ten movies');
  }

  Future<UpcomingTvModel> getTopTenShow() async {
    endPont = 'tv/popular';
    final url = '$baseUrl$endPont$key';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Success Tv show');
      return UpcomingTvModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load top ten TV shows');
  }

  Future<TvSeriesModel> getTvSeries() async {
    endPont = 'tv/top_rated';
    final url = '$baseUrl$endPont$key';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Successfully added Carosuel data');
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to Load Carsouel data');
  }

  Future<SearchModel> getSearchMovie(String searchText) async {
    endPont = 'search/movie?query=$searchText';
    final url = '$baseUrl$endPont';
    print('search url is $url');
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YWNhNTJhYzBkY2M0MTA5ZmQ3ZDcxYWRiMGVhNzJkMiIsIm5iZiI6MTczOTE2MzcxMS45NTcsInN1YiI6IjY3YTk4ODNmMWNhODU4YWUxMTA2MDY1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7lgKh16emUVOKo_SEx-pK3vlZZa6QX-XDzIGxteH5EM' 
    });
    if (response.statusCode == 200) {
      log('Successfully added Search data');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to Load Search data');
  }

  Future<MovieRecommendationModel> getMovieRecommendation() async {
    endPont = 'movie/popular';
    final url = '$baseUrl$endPont$key';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Successfully added Carosuel data');
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to Load Carsouel data');
  }


   Future<MovieDetailModel> getMovieDetails(int movieId) async {
    endPont = 'movie/$movieId';
    final url = '$baseUrl$endPont$key';
    print('search url is $url');
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Successfully added Search data');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to Load Movie data');
  }

  Future<MovieRecommendationModel> getRecommendations(int movieId) async {
    endPont = 'movie/$movieId/recommendations';
    final url = '$baseUrl$endPont$key';
    print('search url is $url');
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Successfully added Search data');
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to Load Movie data');
  }


}
