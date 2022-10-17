import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scan_page.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MaterialColor WarnaUtama = MaterialColor(0xFF4269CE, <int, Color>{
      50: Color(0xFF4269CE),
      100: Color(0xFF4269CE),
      200: Color(0xFF4269CE),
      300: Color(0xFF4269CE),
      400: Color(0xFF4269CE),
      500: Color(0xFF4269CE),
      600: Color(0xFF4269CE),
      700: Color(0xFF4269CE),
      800: Color(0xFF4269CE),
      900: Color(0xFF4269CE),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Praktikum 3',
      theme: ThemeData(primarySwatch: WarnaUtama,),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 0;
  double width = 0;

  Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const ScanPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
     },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 248, 253, 1),
      body: Stack(
      children: [
        Positioned(
          top: height * .2,
          right: width * .35,
          child: Container(
            height: height * .2,
            width: width * .3,
            child: Image(
                  image: AssetImage("img/logo_fix.png") ),
          ),
        ),

        Positioned(
          top: height * .45,
          right: width * .15,
          child: Container(
            height: height * .15,
            width: width * .7,
            child: Column(
              children: [
                Text("Connection",style: GoogleFonts.manrope(fontSize: 26,fontWeight: FontWeight.w700)),
                SizedBox(height: 10,),
                Text("Choose the connection method",style: GoogleFonts.manrope(fontSize: 14,fontWeight: FontWeight.w700,color: Color.fromARGB(255, 150, 149, 149))),
              ],
            ),
          ),
        ),

        Positioned(
          top: height * .6,
          right: width * .1,
          child: Container(
            height: height * .4,
            width: width * .8,
            child: Column(
              children: [
                Container(
                  width: width * .7,
                  child: ElevatedButton(onPressed: (){
                    Navigator.of(context).push(_createRoute());
                  }, child: Text("QR Code",style: GoogleFonts.manrope(fontWeight: FontWeight.w600)),)),
                  SizedBox(height: 10,),
                Container(
                  width: width * .7,
                  child: OutlinedButton(onPressed: (){}, child: Text("Sensor Code",style: GoogleFonts.manrope(fontWeight: FontWeight.w600)), style: OutlinedButton.styleFrom(side: BorderSide(width: 1.5,color: Color(0xFF4269CE))))),
                  SizedBox(height: 10,),
                Container(
                  width: width * .7,
                  child: OutlinedButton(onPressed: (){}, child: Text("Asset ID",style: GoogleFonts.manrope(fontWeight: FontWeight.w600)), style: OutlinedButton.styleFrom(side: BorderSide(width: 1.5,color: Color(0xFF4269CE))))),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}