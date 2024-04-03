import 'dart:html';

import 'package:flutter/material.dart';
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
            /*Text('Projetos')     */
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => setScreen(1, height),
                  child: Column(children: [
                    const Icon(
                      Icons.work_outline_outlined,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      "Experiencias",
                      style: GoogleFonts.bebasNeue(
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(
                                  color: Colors.blueAccent, fontSize: 15)),
                    )
                  ]),
                ) /*Text('Artigos')      */),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => setScreen(2, height),
                  child: Column(children: [
                    const Icon(Icons.school_outlined),
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
                  onTap: () => setScreen(3, height),
                  child: Column(children: [
                    const Icon(Icons.science_outlined, color: Colors.amber),
                    Text(
                      "Projetos",
                      style: GoogleFonts.bebasNeue(
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.amber, fontSize: 15)),
                    )
                  ]),
                ) /*Text('Certificações')*/),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => setScreen(4, height),
                  child: Column(children: [
                    const Icon(Icons.article_outlined, color: Colors.red),
                    Text(
                      "Publicações",
                      style: GoogleFonts.bebasNeue(
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.red, fontSize: 15)),
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
                Container(
                  color: Colors.lightBlueAccent,
                  height: height,
                  width: width,
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.lightBlueAccent[100],
                        width: width * .35,
                        height: height,
                        child: animatedTimeLine(
                            color: Colors.white70,
                            isHorizontal: false,
                            padding: 5,
                            isOpacity: currentPage == 1,
                            curriculo: [
                              {
                                "datas": "Agosto/2022 - Atualmente",
                                "imagem":
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Logo_Ufes.png/240px-Logo_Ufes.png",
                                "titulo": "Conexos",
                                "cursos": "Estágio de Desenvolvimento",
                                "desc": "PL-SQL | ORACLE | JASPER"
                              },
                              {
                                "datas": "Setembro/2022 - Atualmente",
                                "imagem":
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Logo_Ufes.png/240px-Logo_Ufes.png",
                                "titulo": "UFES",
                                "cursos": "Iniciação cientifica",
                                "desc": "FLUTTER | PYTHON | C++ "
                              },
                              {
                                "datas": "Setembro/2022 - Atualmente",
                                "imagem":
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Logo_Ufes.png/240px-Logo_Ufes.png",
                                "titulo": "UFES",
                                "cursos": "Consultor",
                                "desc": "FLUTTER | Firebase"
                              }
                            ]),
                      ),
                      Positioned(
                        right: 0,
                        child: AnimatedOpacity(
                          duration: const Duration(seconds: 2),
                          opacity: currentPage == 1 ? 1.0 : 0.0,
                          child: Container(
                            color: Colors.lightBlueAccent[400],
                            width: width * .6,
                            height: height,
                            child: Center(
                              child: ListView(
                                children: [
                                  Card(
                                    elevation: 5,
                                    child: Text(
                                      """
                                        Estágio Conexos:
                                        1. Padronização de interfaces de parâmetros dos relatórios: reflexos na melhorar a experiência do usuário e redução bugs
                                        2. Escrita de artigos técnicos: reflexos redução de bugs e tempo de manutenção 
                                        3. Documentação de rotinas: reflexos Unificação do conhecimento da equipe e treinamento de estagiários.
                                        4. Protótipo de sistema de compartilhamento de soluções de bugs comuns
                                        5. Desenvolvimento de procedimento construtor de query para levantamento de orçamento.
                                        6. Proposta de documento padrão para testes de relatórios
                                      """,
                                      style: GoogleFonts.bebasNeue(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    child: Text(
                                      """
                                      Iniciação Cientifica:
                                      Sendo o desenvolvedor principal do projeto, desenvolvi a integração do Esp32 com o celular
                                      usando tecnologias como: Flutter, Firebase e Bluetooth LE. O projeto foi desenvolvido em 
                                      Arquitetura limpa e TDD para garantir a qualidade do código. Além disso implementei uma esteira
                                      de CI para executar os testes automatizados com GitHub Actions.                     
                                      """,
                                      style: GoogleFonts.bebasNeue(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        """
                                    Consultor Flutter:
                                    Sendo referência técnica durante o projeto, auxiliei na implementação da arquitetura
                                    e modelagem tanto da autenticação quanto o banco de dados via FIREBASE.
                                       
                                        """,
                                        style: GoogleFonts.bebasNeue(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                ?.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 15)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TimeLineListItem(
                  index: currentPage,
                  heigth: height,
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
          Row(
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
                            AnimatedOpacity(
                              duration: const Duration(seconds: 1),
                              opacity: index == 0 ? 1.0 : 0.0,
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
                            AnimatedOpacity(
                              duration: const Duration(seconds: 1),
                              opacity: index == 0 ? 1.0 : 0.0,
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
                            AnimatedOpacity(
                              duration: const Duration(seconds: 1),
                              opacity: index == 0 ? 1.0 : 0.0,
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
                                                  fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                    ]),
                                  )),
                            )
                          ],
                        ),
                        Positioned(
                          right: 50,
                          top: 25,
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 1),
                            opacity: index == 0 ? 1.0 : 0.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: index == 0 ? 1.0 : 0.0,
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
