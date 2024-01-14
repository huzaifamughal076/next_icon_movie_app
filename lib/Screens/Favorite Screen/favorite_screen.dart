import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexticon_task/Controllers/movie_controller.dart';
import 'package:nexticon_task/Utils/constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MovieController>(builder: (controller) {
        if(controller.isFavoriteLoading){
          return const Center(child: CircularProgressIndicator());
        }
        if(controller.favoriteMovesList.isEmpty){
          return  Center(
            child: Text('No favorite found',style: GoogleFonts.roboto(fontSize: 24), ),);
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 300), 
            itemCount: controller.favoriteMovesList.length,
            itemBuilder: (context, index) {
              return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect( 
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: (){
                  getMovieDetail(controller.favoriteMovesList[index].id??0);
                },
                child: Container(
                  height: 200, 
                  width: 150, 
                  decoration:  BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                  image: NetworkImage("${Constants.imagePath}${controller.favoriteMovesList[index].posterPath??""}"),
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
                      int? resultedIndex =   Get.find<MovieController>().favoriteMovesList.indexWhere((element) => element.id == controller.favoriteMovesList[index].id);
                      if(resultedIndex==-1){
                        Get.find<MovieController>().addToFavorite(controller.favoriteMovesList[index]);
                      }else{
                        Get.find<MovieController>().removeFromFavorite(controller.favoriteMovesList[index]);
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
                        child:  Icon((Get.find<MovieController>().favoriteMovesList.any((element) => element.id == controller.favoriteMovesList[index].id))
                        ?CupertinoIcons.heart_fill
                        :Icons.add, size: 30,),
                      ),
                    ))
                ],
              ),
                ),
              ),
            ),
          );
            },);
      },),
    );
  }
}