import 'package:fade_scroll_app_bar/fade_scroll_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio/modules/home/components/locationlistitem.dart';
import 'package:porfolio/modules/home/components/timelinecertification.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/mockup.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> pages = [
      TimeLineListItem(
        index: 1,
        heigth: height,
        width: width,
      ),
      Container(
        color: Colors.amber,
        height: height,
        width: width,
      )
    ];
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
        fadeOffset: 150,
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
                        /*const Column(
                          children: [
                            Card(
                              elevation: 4,
                              child: Column(
                                children: [
                                  Icon(Icons.flutter_dash_rounded),
                                  Text("Flutter")
                                ],
                              ),
                            ),
                            Card(
                              elevation: 4,
                              child: Column(
                                children: [
                                  Icon(Icons.flutter_dash_rounded),
                                  Text("Flutter")
                                ],
                              ),
                            ),
                            Card(
                              elevation: 4,
                              child: Column(
                                children: [
                                  Icon(Icons.flutter_dash_rounded),
                                  Text("Flutter")
                                ],
                              ),
                            )
                          ],
                        ),*/
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18.0, horizontal: 150),
                              child: Text(
                                """   
                                Desenvolvedor Mobile apaixonado por explorar
                                as possibilidades da tecnologia para criar 
                                soluções inovadoras.Com experiência em Flutter
                                e conhecimentos sólidos em desenvolvimento Android,
                                estou constantemente em busca de desafios que me 
                                permitam aplicar minhas habilidades e conhecimentos para 
                                impactar positivamente a vida das pessoas.
                                """,
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 15,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      ?.copyWith(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w100),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 500,
                      width: 500,
                      child: Image.asset("images/phone.png")),

                  /*AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),*/
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
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: height,
              width: width,
              child: TimeLineListItem(
                index: index,
                heigth: height,
                width: width,
              ),
            ); /* LocationListItem(
              imageUrl:
                  "https://docs.flutter.dev/cookbook/img-files/effects/parallax/01-mount-rushmore.jpg",
              name: "asd",
              country: "as",
            );*/
          },
        ),
      ),
    );
  }
}
