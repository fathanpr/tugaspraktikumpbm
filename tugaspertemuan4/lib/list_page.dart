import 'package:flutter/material.dart';
import 'package:tugaspertemuan4/moviereview_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugaspertemuan4/detail_page.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFE221F1F),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'M O R I P I U',
          style: GoogleFonts.poppins(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 17, 17, 17),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: Offset(0, 1)),
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFE221F1F)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          width: width * .9,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listMovie.length,
                  itemBuilder: (context, index) {
                    //Panggil ini, data yang sudah ditampung
                    final movie = listMovie[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: height / 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.6),
                                  BlendMode.dstATop),
                              image: AssetImage(movie.image),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(0, 3)),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 248, 245, 245),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
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
                              Row(
                                children: [
                                  Text("${movie.rating}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12)),
                                  Icon(
                                    FontAwesomeIcons.solidStar,
                                    size: 12,
                                    color: Colors.amber,
                                  ),
                                ],
                              )
                            ],
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(movie: movie),
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
