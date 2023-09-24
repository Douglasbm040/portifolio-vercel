import 'package:fade_scroll_app_bar/fade_scroll_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio/modules/home/components/locationlistitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FadeScrollAppBar(
        scrollController: _scrollController,
        appBarLeading: const Icon(Icons.flutter_dash_rounded),
        appBarTitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'Douglas Bastos Merencio',
                style: GoogleFonts.bebasNeue(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.black, fontSize: 15)),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(children: [
                  const Icon(Icons.school_rounded),
                  Text(
                    "Certificações",
                    style: GoogleFonts.bebasNeue(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.black, fontSize: 15)),
                  )
                ]) /*Text('Projetos')     */),
            Expanded(
                flex: 1,
                child: Column(children: [
                  const Icon(Icons.tips_and_updates),
                  Text(
                    "Projetos",
                    style: GoogleFonts.bebasNeue(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.black, fontSize: 15)),
                  )
                ]) /*Text('Artigos')      */),
            Expanded(
                flex: 1,
                child: Column(children: [
                  const Icon(Icons.science_rounded),
                  Text(
                    "Pesquisas",
                    style: GoogleFonts.bebasNeue(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.black, fontSize: 15)),
                  )
                ]) /*Text('Certificações')*/),
            Expanded(
                flex: 1,
                child: Column(children: [
                  const Icon(Icons.article_rounded),
                  Text(
                    "Artigos",
                    style: GoogleFonts.bebasNeue(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.black, fontSize: 15)),
                  )
                ]) /*Text('Pesquisas')    */),
          ],
        ),
        appBarForegroundColor: Colors.black,
        pinned: true,
        fadeOffset: 350,
        expandedHeight: height,
        backgroundColor: Colors.white,
        fadeWidget: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFFFe0eafc),
            Color(0xFFFFcfdef3),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\u{1F44B} Oi, eu sou o Douglas",
                              style: GoogleFonts.delaGothicOne(
                                  fontSize: 15,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(color: Colors.black)),
                            ),
                            Text(
                              "Flutter\nDeveloper",
                              style: GoogleFonts.delaGothicOne(
                                  fontSize: 95,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(
                                        color: Colors.black87,
                                      )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(190, 20, 0, 0),
                              child: Column(
                                children: [
                                  Text(
                                    "Apaixonado por tecnologia mobile\ne inteligencia artificial",
                                    style: GoogleFonts.bebasNeue(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          ?.copyWith(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.network(""),
                ],
              ),
            ],
          ),
        ),
        bottomWidgetHeight: 40,
        bottomWidget: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_food_beverage),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.email),
            ),
            Icon(Icons.facebook),
          ],
        ),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: LocationListItem(
                imageUrl:
                    "https://docs.flutter.dev/cookbook/img-files/effects/parallax/01-mount-rushmore.jpg",
                name: "asd",
                country: "as",
              ),
            );
          },
        ),
      ),
    );
  }
}
