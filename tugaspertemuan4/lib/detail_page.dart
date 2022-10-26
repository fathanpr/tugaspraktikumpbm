import 'package:flutter/material.dart';
import 'package:tugaspertemuan4/moviereview_model.dart';
import 'package:tugaspertemuan4/list_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatelessWidget {
  final MovieReview movie;
  DetailPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFE221F1F),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                color: Color(0xFE221F1F),
              ),
              Image.asset(
                movie.image,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .5,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color(0xFE221F1F),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [
                              0.3,
                              0.5,
                            ]))),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text("${movie.rating}",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 3, left: 5),
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            size: 12,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            movie.genre,
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12),
                          ),
                          Text(" | ",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 12)),
                          Text(
                            "${movie.episode} Episode",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text(
                        "Deskripsi",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Text(
                        movie.description,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            FontAwesomeIcons.circleChevronLeft,
                            color: Color.fromARGB(255, 250, 246, 246),
                            shadows: [
                              Shadow(
                                offset: Offset(0.0, 0.0),
                                blurRadius: 2.0,
                                color: Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.5),
                              ),
                            ],
                          )))),
            ],
          ),
        ),
      ),
    );
  }
}
