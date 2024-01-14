import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexticon_task/Controllers/movie_controller.dart';
import 'package:nexticon_task/Widgets/movie_widget.dart';
import 'package:nexticon_task/Widgets/trending_widget.dart';
import 'package:nexticon_task/Widgets/upcoming_movie_slider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), 
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text('Trending Movies', style: GoogleFonts.aBeeZee(fontSize: 25), ), 
              const SizedBox(height: 10,),
              GetBuilder<MovieController>(builder: (controller) {
                if(controller.isTrendingMovies){
                  return const SizedBox(
                    height: 300, 
                    width: double.maxFinite, 
                    child: Center(child:  CircularProgressIndicator(),),
                  );
                }
                if(controller.movieModel?.results?.isEmpty??true){
                  return const SizedBox(
                    height: 200,
                    child: Center(child: Text('No trending movies found'),));
                }
                return  TrendingWidget(model: controller.movieModel,);
              },),
              const SizedBox(height: 16,),
              Text('Top rated movies', 
              style: GoogleFonts.aBeeZee(fontSize: 25), 
              ),
              const SizedBox(height: 32,), 
              GetBuilder<MovieController>(builder: (controller) {
                if(controller.isTopRatedMovieLoading){
                  return const SizedBox(
                    height: 200, 
                    width: double.maxFinite, 
                    child: Center(child:  CircularProgressIndicator(),),
                  );
                }
                if(controller.topRatedMovieModel?.results?.isEmpty??true){
                  return const SizedBox(
                    height: 200,
                    child: Center(child: Text('No top rated movies found'),));
                }
                return  MovieSlider(model: controller.topRatedMovieModel,);
              },),
              const SizedBox(height: 16,),
              Text('Upcoming movies', 
              style: GoogleFonts.aBeeZee(fontSize: 25), 
              ),
              const SizedBox(height: 32,), 
              GetBuilder<MovieController>(builder: (controller) {
                if(controller.isUpComingMovieLoading){
                  return const SizedBox(
                    height: 200, 
                    width: double.maxFinite, 
                    child: Center(child:  CircularProgressIndicator(),),
                  );
                }
                if(controller.upcomingMovieModel?.results?.isEmpty??true){
                  return const SizedBox(
                    height: 200,
                    child: Center(child: Text('No upComing movies found'),));
                }
                return  UpcomingMovieSlider(model: controller.upcomingMovieModel,);
              },),
          
          
            ],
          ),
        ),
      )
    );
  }
}