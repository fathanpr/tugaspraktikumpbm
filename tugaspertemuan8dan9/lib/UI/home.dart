import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:tugaspertemuan8dan9/services/fetch_user.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_card/image_card.dart';

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

// ignore: camel_case_types
class _homePageState extends State<homePage> {

  GithubUsersServices services = GithubUsersServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github User'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: services.fetchDataGithubUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      gridDelegate: SliverQuiltedGridDelegate(
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                        crossAxisCount: 4,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          const QuiltedGridTile(2, 2),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 2),
                        ]),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: InkWell(
                          onTap:() {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => detailPage(
                            name: snapshot.data![index].login,
                            image: snapshot.data![index].avatarUrl,
                          ), ));
                          },
                          child: TransparentImageCard(
                            width: double.infinity,
                            height: double.infinity,
                            imageProvider: NetworkImage(snapshot.data![index].avatarUrl),
                            title: Container(
                              padding: const EdgeInsets.only(top: 20),
                              width: double.infinity,
                              child: Text(snapshot.data![index].login,style: const TextStyle(color: Colors.white),)),
                                            ),
                        ),
                      ),
                    // staggeredTileBuilder:(index) => StaggeredTile.count(
                    //   (index % 7 == 0 ) ? 2 : 1, (index % 7 == 0) ? 2 : 1
                    // ),
                    ),
                  );
                }else{
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator()
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}