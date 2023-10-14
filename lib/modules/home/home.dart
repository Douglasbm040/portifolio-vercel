import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio/modules/home/components/timelinecertification.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  late VideoPlayerController _controller;
  final _pageController = PageController(
      //viewportFraction: 1,
      );
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/mockup.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page?.round() ?? 0;
      });
    });
    _scrollController.addListener(() {
      double height = _scrollController.position.pixels;
    });
  }

  void setScreen(int screen, double heigth) {
    setState(() {
      //_pageController.jumpToPage(screen);
      _pageController.animateTo(
        screen * heigth, // Height of each list item
        duration: Duration(seconds: 1),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void openNewTab(String url) {
    final anchor = AnchorElement(href: url)..target = 'blank';
    anchor.click();
  }

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold( 
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: InkWell(
                      onTap: () => setScreen(0, height),
                      child: Text(
                        'Douglas Bastos Merencio',
                        style: GoogleFonts.bebasNeue(
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: Colors.black, fontSize: 25)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      openNewTab(
                          "https://www.linkedin.com/in/douglas-bastos-mer%C3%AAncio-127550204/");
                    },
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.network(
                          "https://img.icons8.com/fluency/48/linkedin.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        openNewTab("https://github.com/Douglasbm040");
                      },
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.network(
                            "https://img.icons8.com/glyph-neue/64/github.png"),
                      ),
                    ),
                  ),
                  /*SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.network(
                        "https://img.icons8.com/glyph-neue/64/medium-logo.png"),
                  ),*/
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => setScreen(1, height),
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
                  ]),
                ) /*Text('Projetos')     */),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => setScreen(2, height),
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
                  ]),
                ) /*Text('Artigos')      */),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => setScreen(3, height),
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
                  ]),
                ) /*Text('Certificações')*/),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => setScreen(4, height),
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
                  ]),
                ) /*Text('Pesquisas')    */),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: ListView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              //controller: _pageController,
              children: [
                inicialpage(
                  index: currentPage,
                  heigth: height,
                  width: width,
                ),
                TimeLineListItem(
                  index: currentPage,
                  heigth: height,
                  width: width,
                ),
                Container(
                  color: Colors.lightBlueAccent[100],
                  height: height,
                  width: width,
                ),
                Container(
                  color: Colors.amber,
                  height: height,
                  width: width,
                ),
                Container(
                  color: Colors.redAccent,
                  height: height,
                  width: width,
                ),
              ] /* LocationListItem(
                  imageUrl:
                      "https://docs.flutter.dev/cookbook/img-files/effects/parallax/01-mount-rushmore.jpg",
                  name: "asd",
                  country: "as",
                );*/

              ),
        ),
      ),
    ); //);
  }
}

class inicialpage extends StatelessWidget {
  const inicialpage({
    super.key,
    required this.width,
    required this.heigth,
    required this.index,
  });
  final double width;
  final double heigth;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      width: width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFFFe0eafc),
        Color(0xFFFFcfdef3),
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          index != 0
              ? Container()
              : Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Animate(
                                    effects: const [
                                      FadeEffect(duration: Duration(seconds: 1))
                                    ],
                                    child: Text(
                                      "\u{1F44B} Oi, eu sou o Douglas",
                                      style: GoogleFonts.delaGothicOne(
                                          fontSize: 15,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(color: Colors.black)),
                                    ),
                                  ),
                                  Animate(
                                    effects: const [
                                      FadeEffect(duration: Duration(seconds: 2))
                                    ],
                                    child: Text(
                                      "Mobile\nDeveloper",
                                      style: GoogleFonts.delaGothicOne(
                                          fontSize: 95,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.copyWith(
                                                color: Colors.black87,
                                              )),
                                    ),
                                  ),
                                  Animate(
                                    effects: const [
                                      FadeEffect(duration: Duration(seconds: 2))
                                    ],
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18.0, horizontal: 150),
                                        child: Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: """   
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
                                                        fontWeight:
                                                            FontWeight.w100),
                                              ),
                                            ),
                                          ]),
                                        )),
                                  )
                                ],
                              ),
                              Animate(
                                effects: const [
                                  FadeEffect(duration: Duration(seconds: 3))
                                ],
                                child: Positioned(
                                  right: 50,
                                  top: 25,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        "https://img.icons8.com/fluency/96/000000/android-os.png",
                                      ),
                                      Column(
                                        children: [
                                          Image.network(
                                              "https://img.icons8.com/fluency/96/000000/flutter.png"),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Animate(
                      effects: const [
                        FadeEffect(duration: Duration(seconds: 3))
                      ],
                      child: SizedBox(
                          height: 500,
                          width: 500,
                          child: Image.asset("images/phone.png")),
                    ),

                    /*AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),*/
                  ],
                ),
        ],
      ),
    );
  }
}
