import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nexticon_task/Models/movie_detail_model.dart';
import 'package:nexticon_task/Models/movie_model.dart';
import 'package:nexticon_task/Models/top_rated_movie_model.dart';
import 'package:nexticon_task/Models/upcoming_movie_model.dart';
import 'package:nexticon_task/Utils/api_points.dart';
import 'package:nexticon_task/Utils/api_stauts.dart';
import 'package:nexticon_task/Utils/constants.dart';
import 'package:nexticon_task/Utils/exception_services.dart';

class MovieServices{


static Future<Object> getTrendingMoveis()async{
  var url = Uri.parse(ApiClass.baseUrl + ApiClass.trendingMovieApiUrl);

return await ExceptionService.applyTryCatch(() async {
  return await http.get(url, 
  headers: {
    "Accept": "application/json",
    "Authorization": "Bearer ${Constants.accessToken}", 
  }, 
  ).then((response){
    if(response.statusCode==200){
      return Success(response.statusCode, movieModelFromJson(response.body));
    }
    return Failure(response.statusCode, jsonDecode(response.body)['status_message']);
  });
});
}

static Future<Object> getTopRatedMoveis()async{
  var url = Uri.parse(ApiClass.baseUrl + ApiClass.topRatedMovieApiUrl);

return await ExceptionService.applyTryCatch(() async {
  return await http.get(url, 
  headers: {
    "Accept": "application/json",
    "Authorization": "Bearer ${Constants.accessToken}", 
  }, 
  ).then((response){
    if(response.statusCode==200){
      return Success(response.statusCode, topRatedMovieModelFromJson(response.body));
    }
    return Failure(response.statusCode, jsonDecode(response.body)['status_message']);
  });
});
}

static Future<Object> getUpComingMoveis()async{
  var url = Uri.parse(ApiClass.baseUrl + ApiClass.upcomingMovieApiUrl);

return await ExceptionService.applyTryCatch(() async {
  return await http.get(url, 
  headers: {
    "Accept": "application/json",
    "Authorization": "Bearer ${Constants.accessToken}", 
  }, 
  ).then((response){
    if(response.statusCode==200){
      return Success(response.statusCode, upcomingMovieModelFromJson(response.body));
    }
    return Failure(response.statusCode, jsonDecode(response.body)['status_message']);
  });
});
}
static Future<Object> getMovieDetail(int id)async{
  var url = Uri.parse('${ApiClass.baseUrl}${ApiClass.movieDetailApiUrl}$id');

return await ExceptionService.applyTryCatch(() async {
  return await http.get(url, 
  headers: {
    "Accept": "application/json",
    "Authorization": "Bearer ${Constants.accessToken}", 
  }, 
  ).then((response){
    if(response.statusCode==200){
      return Success(response.statusCode, movieDetailModelFromJson(response.body));
    }
    return Failure(response.statusCode, jsonDecode(response.body)['status_message']);
  });
});
}

}