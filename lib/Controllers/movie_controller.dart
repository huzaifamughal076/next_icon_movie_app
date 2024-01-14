import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nexticon_task/Models/movie_detail_model.dart';
import 'package:nexticon_task/Models/movie_model.dart';
import 'package:nexticon_task/Models/top_rated_movie_model.dart';
import 'package:nexticon_task/Models/upcoming_movie_model.dart';
import 'package:nexticon_task/Repo/movie_services.dart';
import 'package:nexticon_task/Utils/api_stauts.dart';
import 'package:nexticon_task/Widgets/custom_snackbar.dart';

class MovieController extends GetxController {
  MovieModel? _movieModel;
  MovieModel? get movieModel => _movieModel;

  List<Result> _favoriteMovesList = [];
  List<Result> get favoriteMovesList => _favoriteMovesList;

  MovieDetailModel? _movieDetailModel;
  MovieDetailModel? get movieDetailModel => _movieDetailModel;

  bool _isTrendingMoviesLoading = false;
  bool get isTrendingMovies => _isTrendingMoviesLoading;

  bool _isTopRatedMovieLoading = false;
  bool get isTopRatedMovieLoading => _isTopRatedMovieLoading;

  bool _isUpComingMovieLoading = false;
  bool get isUpComingMovieLoading => _isUpComingMovieLoading;

  bool _isMovieDetailLoading = false;
  bool get isMovieDetailLoading => _isMovieDetailLoading;

  bool _isFavoriteLoading = false;
  bool get isFavoriteLoading => _isFavoriteLoading;

  TopRatedMovieModel? _topRatedMovieModel;
  TopRatedMovieModel? get topRatedMovieModel => _topRatedMovieModel;

  UpcomingMovieModel? _upcomingMovieModel;
  UpcomingMovieModel? get upcomingMovieModel => _upcomingMovieModel;

  

  @override
  onInit() {
    super.onInit();
    getTrendingMoveis();
    getTopRatedMoveis();
    getUpComingMoveis();
  }

//Loaders
  onChangeTrendingLoading(bool loading) async {
    _isTrendingMoviesLoading = loading;
    update();
  }  

  onChangeFavorieLoading(bool loading)async{
    _isFavoriteLoading = loading;
    update();
  }
  
  onChangeMovieDetailLoading(bool loading) async {
    _isMovieDetailLoading = loading;
    update();
  }

  onChangeTopRatedLoading(bool loading) async {
    _isTopRatedMovieLoading = loading;
    update();
  }

  onChangeUpcomingLoading(bool loading) async {
    _isUpComingMovieLoading = loading;
    update();
  }

// Setting Data in Models
  setMovieModel(MovieModel? model) async {
    _movieModel = model;
    update();
  }

  setMovieDetail(MovieDetailModel? model)async{
    _movieDetailModel = model;
    update();
  }

  setTopRatedMovieModel(TopRatedMovieModel? model) async {
    _topRatedMovieModel = model;
    update();
  }

  setUpComingMovieModel(UpcomingMovieModel? model) async {
    _upcomingMovieModel = model;
    update();
  }


  setFavoriteList(List<Result> list)async{
    _favoriteMovesList.clear(); 
    _favoriteMovesList = list;
  }

  addToFavorite(Result movie)async{
  _favoriteMovesList.add(movie);
  update();
}

removeFromFavorite(Result movie)async{
  _favoriteMovesList.removeWhere((element) => element.id== movie.id);
  update();
}




//Calling Api's

  getTrendingMoveis() async {
    onChangeTrendingLoading(true);
    await MovieServices.getTrendingMoveis().then((value) {
      if (value is Success) {
        setMovieModel(value.response as MovieModel);
        onChangeTrendingLoading(false);
      }
      if (value is Failure) {
        CustomSnackbar.show(value.errorResponse.toString(), Colors.red);
        onChangeTrendingLoading(false);
      }
    });
    update();
  }

  getTopRatedMoveis() async {
    onChangeTopRatedLoading(true);
    await MovieServices.getTopRatedMoveis().then((value) {
      if (value is Success) {
        setTopRatedMovieModel(value.response as TopRatedMovieModel);
        onChangeTopRatedLoading(false);
      }
      if (value is Failure) {
        CustomSnackbar.show(value.errorResponse.toString(), Colors.red);
        onChangeTopRatedLoading(false);
      }
    });
    update();
  }

  getUpComingMoveis() async {
    onChangeUpcomingLoading(true);
    await MovieServices.getUpComingMoveis().then((value) {
      if (value is Success) {
        setUpComingMovieModel(value.response as UpcomingMovieModel);
        onChangeUpcomingLoading(false);
      }
      if (value is Failure) {
        CustomSnackbar.show(value.errorResponse.toString(), Colors.red);
        onChangeUpcomingLoading(false);
      }
    });
    update();
  }  
  
  getMovieDetail(int movieId) async {
    onChangeMovieDetailLoading(true);
    await MovieServices.getMovieDetail(movieId).then((value) {
      if (value is Success) {
        setMovieDetail(value.response as MovieDetailModel);
        onChangeMovieDetailLoading(false);
      }
      if (value is Failure) {
        CustomSnackbar.show(value.errorResponse.toString(), Colors.red);
        onChangeMovieDetailLoading(false);
      }
    });
    update();
  }
}
