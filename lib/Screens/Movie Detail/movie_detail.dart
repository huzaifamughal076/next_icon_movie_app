import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nexticon_task/Controllers/movie_controller.dart';
import 'package:nexticon_task/Utils/colors.dart';
import 'package:nexticon_task/Utils/constants.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<MovieController>(
      builder: (controller) {
        if (controller.isMovieDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomScrollView(
          slivers: [
            SliverAppBar.large(
              backgroundColor: Colors.transparent,
              leading: Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.only(top: 16, left: 16),
                decoration: BoxDecoration(
                  color: scaffoldBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: Colors.white,
                    )),
              ),
              expandedHeight: 500,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  controller.movieDetailModel?.originalTitle ?? "Not Provided",
                  style: GoogleFonts.belleza(
                      fontSize: 17, fontWeight: FontWeight.w600),
                ),

                background:  ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24), 
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.network('${Constants.imagePath}${controller.movieDetailModel?.backdropPath}', 
                  filterQuality: FilterQuality.high, 
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/logo.webp', fit: BoxFit.cover,);
                  },
                  ),
                ),
              ),
            ), 
             SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overview',
                    style: GoogleFonts.openSans(
                      fontSize: 30, 
                      fontWeight: FontWeight.w800
                    ),
                    ),
                    const SizedBox(height: 16,),
                     Text(controller.movieDetailModel?.overview??"",
                    style: GoogleFonts.roboto(
                      fontSize: 25, 
                      fontWeight: FontWeight.w400
                    ),
                    ),
                    const SizedBox(height: 16,), 
                    
                    Row(
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0), 
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey), 
                                  borderRadius: BorderRadius.circular(10), 
                                ),
                                child: Row(
                                  children: [
                                    Text('Release date: ', 
                                    style: GoogleFonts.roboto(
                                      fontSize: 17, 
                                      fontWeight: FontWeight.bold
                                    )
                                    ),
                                    Text((controller.movieDetailModel?.releaseDate==null)
                                    ?""
                                    :DateFormat('yyyy-MM-dd').format(controller.movieDetailModel?.releaseDate??DateTime.now()), 
                                    style: GoogleFonts.roboto(
                                      fontSize: 17, 
                                      fontWeight: FontWeight.bold
                                    )
                                    ),
                                  ]),
                              )
                            ],
                          ),
                        ), 
                        const SizedBox(width: 10,),
                        SizedBox(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0), 
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey), 
                              borderRadius: BorderRadius.circular(10), 
                            ),
                            child: Row(
                              children: [
                                Text('Rating ', 
                                style: GoogleFonts.roboto(
                                  fontSize: 17, 
                                  fontWeight: FontWeight.bold
                                )
                                ),
                                const Icon(Icons.star, color: Colors.amber,),
                                Text("${controller.movieDetailModel?.voteAverage??""}", 
                                style: GoogleFonts.roboto(
                                  fontSize: 17, 
                                  fontWeight: FontWeight.bold
                                )
                                ),
                              ]),
                          )
                        ],
                      ),
                    ), 
                      ],
                    ), 


                  ],
                ),
              
              ),
            )
          ],
        );
      },
    ));
  }
}
