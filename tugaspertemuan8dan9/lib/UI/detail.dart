import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class detailPage extends StatelessWidget {
  detailPage({Key? key, required this.name, required this.image}) : super(key: key);

  final String name;
  final String image;


  Future<void> _launchUrl(String url) async {
  final Uri uri = Uri(scheme: "https", host: url);
  if (!await launchUrl(uri,mode: LaunchMode.externalApplication)) 
  {
    throw 'Could not launch $uri';
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(140),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: NetworkImage(image),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      icon: const FaIcon(FontAwesomeIcons.github),
                      onPressed:() {
                      _launchUrl('www.github.com');
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.pink),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                      ),
                      label: const Text(
                        "GitHub",
                      ),
                    ),

                ],
              ),
            ],
          ),
        ),
    );
  }
}