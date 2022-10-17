import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugaspraktikum3/main.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});
  
  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 248, 253, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            TextButton.icon(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color:Color.fromARGB(255, 150, 149, 149),size: 15,), label:Text("Go Back",style: GoogleFonts.manrope(color:Color.fromARGB(255, 150, 149, 149),fontWeight: FontWeight.w700),),),
            SizedBox(
              width: 210,
            ),
            Icon(Icons.star_border_outlined,color: Color.fromARGB(255, 150, 149, 149),size: 18,),
          ],
        ),
      ),
      body: Stack(
        children: [

          Positioned(
            top: height*.0,
            right: width*.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("by QR code",style: GoogleFonts.manrope(fontSize: 26,fontWeight: FontWeight.w700),),
                Text("Scan a QR code to connect to a sensor",style: GoogleFonts.manrope(fontSize: 12,fontWeight: FontWeight.w900,color:Color.fromARGB(255, 150, 149, 149),)),
              ],
            )),
            
          Positioned(
            top: height * .1,
            right: width * .22,
            child: Container(
              height: height * .4,
              width: width * .6,
                child: Image(
                  image: AssetImage("img/qr_fix.png") ),
          ),
        ),

        Positioned(
          top: height*.5,
          right: width*.42,
          child: Text("Scanning...",style: GoogleFonts.manrope(fontSize: 12,fontWeight: FontWeight.w500,color:Color.fromARGB(255, 150, 149, 149),)), ),
            ]
      )
    );
  }
}