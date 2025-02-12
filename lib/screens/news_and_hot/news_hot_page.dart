import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/screens/home/widgets.dart/appBar_widgets.dart';
import 'package:netflix/screens/news_and_hot/widgets/coming_soon_movie_widget.dart';

class NewsHotPage extends StatelessWidget {
  const NewsHotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2, child: SafeArea(child: Scaffold(
          backgroundColor: bGcolor,
          appBar: AppBar(
        backgroundColor: bGcolor,
        title: Text('News & Hot',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
        actions: [
          screenShareButton(context),
    downloadButton(context),
    searchButton(context)
        ],
        bottom: TabBar( dividerColor: Colors.black,
        isScrollable: false,
        indicator:BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        labelColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        unselectedLabelColor: Colors.white,
          tabs: [
          Tab(
            text: '  🍿Coming Soon  ',
          ),Tab(
            text: '  🔥Everyone\'s Watching  ',
          )
        ]),
      ),
      body: TabBarView(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              ComingSoonMovieWidget(
                      imageUrl:
                          'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                      overview:
                          'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                      logoUrl:
                          "https://logowik.com/content/uploads/images/stranger-things4286.jpg",
                      month: "Jun",
                      day: "19",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                      overview:
                          'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                      logoUrl:
                          "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                      month: "Mar",
                      day: "07",
                    ),
            ],
          ),
        ),
        ComingSoonMovieWidget(
                      imageUrl:
                          'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                      overview:
                          'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                      logoUrl:
                          "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                      month: "Mar",
                      day: "07",
                    ),
      ]),
        )));
  }
}
