import 'package:get/get.dart';
import 'package:nexticon_task/Controllers/movie_controller.dart';
import 'package:nexticon_task/Screens/Movie%20Detail/movie_detail.dart';

class Constants{

  static String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWIyMGI3MTJkNWViZWI2ZWE1MjVjMTVlMjYxNGI1ZiIsInN1YiI6IjY1YTMwOWI2Mzk1NDlhMDEzMjEwNzhkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fAhpnaKq0ZJPPLeZS6gfIQ41SSxufeAkMujQf_6Y7Y8";
  static String imagePath = "https://image.tmdb.org/t/p/w500";
}


getMovieDetail(int movieId)async{
  Get.find<MovieController>().getMovieDetail(movieId);
  Get.to(()=> const MovieDetailPage());
}
