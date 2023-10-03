import 'dart:js_util';

import 'package:animated_number/animated_number.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:timelines/timelines.dart';

class TimeLineListItem extends StatefulWidget {
  const TimeLineListItem(
      {super.key,
      required this.heigth,
      required this.width,
      required this.index});
  final double heigth;
  final double width;
  final int index;

  @override
  State<TimeLineListItem> createState() => _TimeLineListItemState();
}

class _TimeLineListItemState extends State<TimeLineListItem> {
  final List<Map<String, dynamic>> linguagens = [
    {
      "linguagem": "Flutter",
      "imagem": "https://img.icons8.com/fluency/96/000000/flutter.png",
      "dominio": 3,
      "Tecnologias": [
        "Provider",
        "BLoc",
        "Mobx",
        "SQLite",
        "Gps",
        "Http",
        "Bluetooth ble",
        "Permissions",
        "Sharepreferences"
      ],
      "numero_de_projetos": 13,
      "nivel_tecnico": ["Estudante", "Trainee", "Júnior", "Pleno", "Senior"],
      "tempo_de_uso": "2 anos e meio"
    },
    {
      "linguagem": "Android Nativo",
      "imagem": "https://img.icons8.com/fluency/96/000000/android-os.png",
      "dominio": 2,
      "Tecnologias": ["Layout", "Kotlin", "Jetpack Compose", "Gps"],
      "numero_de_projetos": 2,
      "nivel_tecnico": ["Estudante", "Trainee", "Júnior", "Pleno", "Senior"],
      "tempo_de_uso": "1 ano"
    },
    {
      "linguagem": "Firebase",
      "imagem": "https://img.icons8.com/color/48/firebase.png",
      "dominio": 3,
      "Tecnologias": ["CRUD", "Auth"],
      "numero_de_projetos": 3,
      "nivel_tecnico": ["Estudante", "Trainee", "Júnior", "Pleno", "Senior"],
      "tempo_de_uso": "1 ano e meio"
    },
    {
      "linguagem": "Python",
      "imagem": 'https://img.icons8.com/color/48/python--v1.png',
      "dominio": 2,
      "Tecnologias": [
        "Django",
        "Flask",
        "Numpy",
        "Pytorch",
        "Selenium",
        "Matploitlib",
        "OpenCV"
      ],
      "numero_de_projetos": 5,
      "nivel_tecnico": ["Estudante", "Trainee", "Júnior", "Pleno", "Senior"],
      "tempo_de_uso": "2 anos e meio"
    },
    {
      "linguagem": "Rust",
      "imagem":
          "https://img.icons8.com/external-tal-revivo-bold-tal-revivo/24/external-rust-is-a-multi-paradigm-system-programming-language-logo-bold-tal-revivo.png",
      "dominio": 1,
      "Tecnologias": ["Lógica"],
      "numero_de_projetos": 1,
      "nivel_tecnico": ["Estudante", "Trainee", "Júnior", "Pleno", "Senior"],
      "tempo_de_uso": "menos de 1 ano"
    },
    {
      "linguagem": "SQL",
      "imagem": "https://img.icons8.com/ios-filled/50/sql.png",
      "dominio": 2,
      "Tecnologias": [
        "Subselect",
        "Joins",
        "Union",
        "Procedure",
        "Cursor",
        "Package",
        "CRUD",
        "Funções",
        "Relatórios"
      ],
      "numero_de_projetos": 21,
      "nivel_tecnico": ["Estudante", "Trainee", "Júnior", "Pleno", "Senior"],
      "tempo_de_uso": "1 ano",
    },
  ];
  double _currentSliderValue = 1;
  List<String> slidtext = [
    "Ate 1 ano",
    "Entre 1 a 2 anos",
    "Entre 2 a 3 anos",
    "Mais de 3 anos"
  ];

  List<Map<String, dynamic>> curriculo = [
    {
      "datas": "Atualmente\nprevisão 2026",
      "cursos": "Pós graduando em cidades inteligentes - UFES",
    },
    {
      "datas": "Setembro/2022\nAtualmente",
      "cursos": "Iniciação cientifica - UFES",
    },
    {
      "datas": "Agosto/2022\nAtualmente",
      "cursos": "Estágio de Desenvolvimento - Conexos",
    },
    {
      "datas": "Atualmente\nprevisão 2024",
      "cursos": "Graduando em Sistemas de Informação - UFES",
    },
    {
      "datas": "2016-2021",
      "cursos": "Graduado em Enfermagem - SÃO CAMILO",
    },
  ];
  final controller = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.heigth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                  top: -180,
                  left: -130,
                  child: widget.index == 0
                      ? Animate(
                          effects: const [
                            FadeEffect(duration: Duration(seconds: 3))
                          ],
                          child: Container(
                              alignment: Alignment.topLeft,
                              height: widget.heigth,
                              width: widget.width,
                              child: Image.asset(
                                "images/iphone.png",
                                fit: BoxFit.contain,
                              )),
                        )
                      : Container()),
              widget.index == 1
                  ? Animate(
                      effects: const [
                        FadeEffect(duration: Duration(seconds: 2))
                      ],
                      child: Card(
                        elevation: 3,
                        child: SizedBox(
                          height: widget.heigth,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Timeline.tileBuilder(
                              theme: TimelineThemeData(
                                color: Colors.amber,
                              ),
                              builder: TimelineTileBuilder.connectedFromStyle(
                                contentsAlign: ContentsAlign.basic,
                                connectionDirection: ConnectionDirection.before,
                                lastConnectorStyle: ConnectorStyle.transparent,
                                firstConnectorStyle: ConnectorStyle.dashedLine,
                                connectorStyleBuilder: (context, index) {
                                  return ConnectorStyle.solidLine;
                                },
                                indicatorStyleBuilder: (context, index) =>
                                    index == curriculo.length - 1
                                        ? IndicatorStyle.dot
                                        : IndicatorStyle.outlined,
                                oppositeContentsBuilder: (context, index) =>
                                    Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    curriculo[index]["datas"],
                                    style: GoogleFonts.bebasNeue(
                                        fontSize: 12,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            ?.copyWith(
                                              color: Colors.black87,
                                            )),
                                  ),
                                ),
                                contentsBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        curriculo[index]["cursos"],
                                        style: GoogleFonts.delaGothicOne(
                                            fontSize: 12,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                  color: Colors.black87,
                                                )),
                                      ),
                                    ],
                                  ),
                                ),
                                itemCount: curriculo.length,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          widget.index == 1
              ? Animate(
                  effects: const [FadeEffect(duration: Duration(seconds: 2))],
                  child: Card(
                      elevation: 3,
                      //color: Colors.lightBlue[100],
                      child: Container(
                          height: widget.heigth * .7,
                          width: widget.width * .7,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Stack(
                            children: [
                              ListView.builder(
                                controller: controller,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.all(
                                    8.0), // padding around the grid
                                itemCount:
                                    linguagens.length, // total number of items
                                itemBuilder: (context, index) {
                                  return cardStack(
                                    linguagens: linguagens,
                                    index: index,
                                  );
                                },
                              ),
                              Positioned(
                                  left: 0,
                                  top: 100,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          controller.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.bounceIn);
                                        });
                                      },
                                      child:
                                          Icon(Icons.arrow_back_ios_rounded))),
                              Positioned(
                                  right: 0,
                                  top: 100,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          controller.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.bounceIn);
                                        });
                                      },
                                      child: Icon(
                                          Icons.arrow_forward_ios_rounded)))
                            ],
                          )))) /*
                      CarouselSlider.builder(
                          itemCount: linguagens.length,
                          options: CarouselOptions(
                            autoPlay: true, viewportFraction: .5, height: 300,
                            //aspectRatio: 2.0,
                            //enlargeCenterPage: true,
                          ),
                          itemBuilder: (context, index, realIdx) {
                            return cardStack(
                              linguagens: linguagens,
                              index: index,
                            );
                          }),
                    ),
                  ),
                )*/
              : Container()
        ],
      ),
    );
  }
}

class cardStack extends StatefulWidget {
  cardStack({
    super.key,
    required this.linguagens,
    required this.index,
  });
  final int index;

  final List<Map<String, dynamic>> linguagens;

  @override
  State<cardStack> createState() => _cardStackState();
}

class _cardStackState extends State<cardStack> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: isExpanded ? 600.0 : 200.0,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 5,
                        child: SizedBox(
                            height: 55,
                            width: 55,
                            child: Image.network(
                              widget.linguagens[widget.index]["imagem"],
                              fit: BoxFit.fill,
                            )),
                      ),
                    ],
                  ),
                  Text(widget.linguagens[widget.index]["linguagem"]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Nível ${widget.linguagens[widget.index]["nivel_tecnico"][widget.linguagens[widget.index]["dominio"] - 1]}",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                          height: 50,
                          width: 100,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, indexList) => Icon(
                              Icons.star_rate_rounded,
                              color: widget.linguagens[widget.index]
                                          ["dominio"] >
                                      indexList
                                  ? Colors.amber
                                  : Colors.black12,
                              size: 20,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Tempo:"),
                      SizedBox(width: 30),
                      Text(widget.linguagens[widget.index]["tempo_de_uso"])
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Projetos:"),
                      AnimatedNumber(
                        startValue: 0,
                        endValue: widget.linguagens[widget.index]
                            ["numero_de_projetos"],
                        duration: Duration(seconds: 2),
                        isFloatingPoint: false,
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ), /*
                  ExpansionTile(
                    title: Text("Tecnologias"),
                    trailing: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    onExpansionChanged: (expanded) {
                      setState(() {
                        isExpanded = expanded;
                      });
                    },
                    children: <Widget>[
                      Animate(
                        child: Container(
                          width: 300,
                          height: 100,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Text(widget.linguagens[widget.index]
                                  ["Tecnologias"][index]);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: Text("Cursos"),
                    trailing: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    onExpansionChanged: (expanded) {
                      setState(() {
                        isExpanded = expanded;
                      });
                    },
                    children: <Widget>[
                      // Conteúdo que você deseja exibir ao expandir o acordeão.
                      GroupButton(
                        options: GroupButtonOptions(
                          selectedShadow: const [],
                          selectedTextStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.pink[900],
                          ),
                          selectedColor: Colors.pink[100],
                          unselectedShadow: const [],
                          unselectedColor: Colors.purple[300],
                          unselectedTextStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          spacing: 5,
                          runSpacing: 5,
                          groupingType: GroupingType.wrap,
                          direction: Axis.horizontal,
                          buttonHeight: 30,
                          buttonWidth: 100,
                          mainGroupAlignment: MainGroupAlignment.start,
                          crossGroupAlignment: CrossGroupAlignment.center,
                          groupRunAlignment: GroupRunAlignment.start,
                          textAlign: TextAlign.center,
                          textPadding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          elevation: 3,
                        ),
                        buttons: widget.linguagens[widget.index]["Tecnologias"],
                      )
                    ],
                  ),*/
                ],
              )),
        ),
        /*Positioned(
          right: 125,
          top: -10,
          child: Card(
            elevation: 5,
            child: SizedBox(
                height: 55,
                width: 55,
                child: Image.network(
                  linguagens[index]["imagem"],
                  fit: BoxFit.fill,
                )),
          ),
        ),*/
      ],
    );
  }
}
