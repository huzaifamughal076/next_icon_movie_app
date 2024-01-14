import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexticon_task/Controllers/movie_controller.dart';
import 'package:nexticon_task/Models/movie_model.dart';
import 'package:nexticon_task/Utils/constants.dart';

class TrendingWidget extends StatelessWidget {
  final MovieModel? model;
  const TrendingWidget({
    this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: model?.results?.length??0, 
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: InkWell( 
            onTap: (){
              getMovieDetail(model?.results?[index].id??0);
            },
            child: Container(
              height: 300, 
              width: 200,
              decoration: BoxDecoration(
              color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage("${Constants.imagePath}${model?.results?[index].posterPath??""}"),
                  fit: BoxFit.fill,
                  onError: (exception, stackTrace) {
                     debugPrint(exception.toString());
                  },
                  )
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -1, 
                    right: -1,
                    child: InkWell( 
                      onTap: (){
                      int? resultedIndex =   Get.find<MovieController>().favoriteMovesList.indexWhere((element) => element.id == model?.results?[index].id);
                      if(resultedIndex==-1){
                        Get.find<MovieController>().addToFavorite(model?.results?[index]??Result());
                      }else{
                        Get.find<MovieController>().removeFromFavorite(model?.results?[index]??Result());
                      }

                      },
                      child: Container(
                        height: 50, 
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                        color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:  Icon((Get.find<MovieController>().favoriteMovesList.any((element) => element.id == model?.results?[index].id))
                        ?CupertinoIcons.heart_fill
                        :Icons.add, size: 30,),
                      ),
                    ))
                ],
              ),
            ),
          ),
        );
            
        
      }, options: CarouselOptions(
        height: 300, 
        autoPlay: true, 
        viewportFraction: 0.55, 
        enlargeCenterPage: true, 
        pageSnapping: true,
        autoPlayCurve: Curves.fastOutSlowIn, 
        autoPlayAnimationDuration: const Duration(milliseconds: 3000),
      ));
  }
}