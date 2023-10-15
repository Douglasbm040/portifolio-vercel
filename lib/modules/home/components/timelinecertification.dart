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
  final Scroll = ScrollController();
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
      "numero_de_projetos": 5,
      "nivel_tecnico": ["Estudante", "Trainee", "Júnior", "Pleno", "Senior"],
      "tempo_de_uso": "1 ano",
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
      "datas": "2016 - 2021",
      "imagem":
          "https://media.licdn.com/dms/image/C4D0BAQEC-88mSj8Z2g/company-logo_100_100/0/1578054761377?e=1705536000&v=beta&t=2LxEfSp2QwYKjbX4asj4Nimx42EL3g05HeO28FnQvTw", //"https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Webysther_20170627_-_Bras%C3%A3o_USP.svg/300px-Webysther_20170627_-_Bras%C3%A3o_USP.svg.png",
      "titulo": "SÃO CAMILO - ES",
      "cursos": "Graduado em Enfermagem",
      "desc": "ANDROID | ANALISE DE DADOS | GESTÃO "
    },
    {
      "datas": "Atualmente - previsão 2026",
      "imagem":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Logo_Ufes.png/240px-Logo_Ufes.png",
      "titulo": "UFES",
      "cursos": "Graduando em Sistemas de Informação",
      "desc": "FLUTTER | HTML + JS + CSS | JAVA | PYTHON "
    },
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
      "datas": "Atualmente - previsão 2024",
      "imagem":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Logo_Ufes.png/240px-Logo_Ufes.png",
      "titulo": "UFES",
      "cursos": "Pós graduando em cidades inteligentes",
      "desc": "Analise de dados | Banco de Dados "
    },
  ];
  List<Map<String, dynamic>> cursos = [
    {
      "situacao": "Concluido",
      "imagem":
          "https://media.licdn.com/dms/image/C560BAQEqmVRp2Q2Jbg/company-logo_100_100/0/1554852395434?e=1705536000&v=beta&t=DicFntHvDFw60osoZ6ykU7Xcq9Xk8E_pHa5zLgdz9ps",
      "titulo": "Cod3r",
      "cursos": "Flutter",
      "desc": "FLUTTER"
    },
    {
      "situacao": "Concluido",
      "imagem":
          "https://media.licdn.com/dms/image/D4D0BAQFV96eZLtsPNw/company-logo_100_100/0/1683840189560?e=1705536000&v=beta&t=5TACrsCM5a10jdRE2zgJX49qk0jy5AlKzGqWjcGswPs", //"https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Webysther_20170627_-_Bras%C3%A3o_USP.svg/300px-Webysther_20170627_-_Bras%C3%A3o_USP.svg.png",
      "titulo": "Samsung Ocean",
      "cursos": "Trilha de android",
      "desc": "ANDROID | ROOM | MVVM | GPS | RETROFIT "
    },
    {
      "situacao": "Concluido",
      "imagem":
          "https://media.licdn.com/dms/image/C4D0BAQFQr9e68bBOPQ/company-logo_100_100/0/1626275253364?e=1705536000&v=beta&t=IpsqeKpVaFYhEA6Lz9serBtCqx-DeSeLxMPPYjgbyJw",
      "titulo": "Udemy",
      "cursos": "Formação ciências de dados",
      "desc": "PYTHON | MACHINE LEARNING "
    },
    {
      "situacao": "Concluido",
      "imagem":
          "https://media.licdn.com/dms/image/C4D0BAQHK9N3CILU7Lg/company-logo_100_100/0/1679419059178?e=1705536000&v=beta&t=ELepDY2mAtX5_GbcktoRgQX4384UIdc1GpUKlvM9Jjw",
      "titulo": "ICMC",
      "cursos": "Processamento de linguagem natural",
      "desc": "PYTHON"
    },
    {
      "situacao": "Em andamento",
      "imagem":
          "https://media.licdn.com/dms/image/C4E0BAQFdNatYGiBelg/company-logo_100_100/0/1636138753911?e=1705536000&v=beta&t=puN16Tjgkvep-Bf3kzT0py6txuqdut__SoDJm8SkWZg",
      "titulo": "Meta",
      "cursos": "Formação Android",
      "desc": "ANDROID | REACT | REACT-NATIVE "
    },
    {
      "situacao": "Em andamento",
      "imagem":
          "https://media.licdn.com/dms/image/C4D0BAQE5MTWc9Bgf0g/company-logo_100_100/0/1582306984947?e=1705536000&v=beta&t=dNtZmS58QcsTLGCewHLEg7veNf2xaKM5NQsmSiA5ADQ",
      "titulo": "Stanford",
      "cursos": "Machine Learning",
      "desc": "Redes neurais"
    },
  ];
  final controller = PageController();
  bool isscroll = false;
  @override
  void initState() {
    super.initState();
  }

  void Scrolling() {
    setState(() {
      !isscroll
          ? controller.animateTo(
              400, // Height of each list item
              duration: Duration(seconds: 1),
              curve: Curves.ease,
            )
          : controller.animateTo(
              -400, // Height of each list item
              duration: Duration(seconds: 1),
              curve: Curves.ease,
            );
      isscroll = !isscroll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.heigth,
      child: Column(
        children: [
          SizedBox(
              height: widget.heigth * .4,
              width: widget.width,
              child: Stack(
                children: [
                  Positioned(
                    top: -100,
                    child: SizedBox(
                      height: widget.heigth * .6,
                      width: widget.width,
                      child: AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: widget.index == 1 ? 1.0 : 0.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Timeline.tileBuilder(
                            //scrollDirection: Axis.horizontal,
                            theme: TimelineThemeData(
                              direction: Axis.horizontal,
                              color: Colors.blueAccent[100],
                            ),
                            builder: TimelineTileBuilder.connectedFromStyle(
                              contentsAlign: ContentsAlign.basic,
                              connectionDirection: ConnectionDirection.before,
                              lastConnectorStyle: ConnectorStyle.dashedLine,
                              firstConnectorStyle: ConnectorStyle.solidLine,
                              connectorStyleBuilder: (context, index) {
                                return ConnectorStyle.solidLine;
                              },
                              indicatorStyleBuilder: (context, index) =>
                                  index == curriculo.length - 1
                                      ? IndicatorStyle.outlined
                                      : IndicatorStyle.dot,
                              oppositeContentsBuilder: (context, index) =>
                                  Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Animate(
                                  effects: const [
                                    // FadeEffect(duration: Duration(seconds: 2))
                                  ],
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
                              ),
                              contentsBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Card(
                                      elevation: 2,
                                      child: SizedBox(
                                        height: 120,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                                child: Image.network(
                                                  curriculo[index]["imagem"],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  curriculo[index]["titulo"],
                                                  style:
                                                      GoogleFonts.delaGothicOne(
                                                          fontSize: 12,
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline1
                                                                  ?.copyWith(
                                                                    color: Colors
                                                                        .black87,
                                                                  )),
                                                ),
                                              ),
                                              Text(
                                                curriculo[index]["cursos"],
                                                style:
                                                    GoogleFonts.delaGothicOne(
                                                        fontSize: 10,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline1
                                                                ?.copyWith(
                                                                  color: Colors
                                                                      .black87,
                                                                )),
                                              ),
                                              Text(
                                                curriculo[index]["desc"],
                                                style:
                                                    GoogleFonts.delaGothicOne(
                                                        fontSize: 10,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline1
                                                                ?.copyWith(
                                                                  color: Colors
                                                                      .black87,
                                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
                  ),
                ],
              )),
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: widget.index == 1 ? 1.0 : 0.0,
            child: Stack(
              children: [
                Container(
                    color: Colors.blueAccent[100],
                    width: widget.width,
                    height: widget.heigth * .6,
                    child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: AnimatedOpacity(
                          duration: const Duration(seconds: 1),
                          opacity: widget.index == 1 ? 1.0 : 0.0,
                          child: GridView.count(
                              controller: controller,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              children: List.generate(
                                cursos.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        child: SizedBox(
                                          width: widget.width / 4,
                                          height: widget.heigth * .4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: CircleAvatar(
                                                    radius: 25,
                                                    child: Image.network(
                                                      cursos[index]["imagem"],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        cursos[index]["titulo"],
                                                        style: GoogleFonts
                                                            .delaGothicOne(
                                                                fontSize: 12,
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1
                                                                    ?.copyWith(
                                                                      color: Colors
                                                                          .black87,
                                                                    )),
                                                      ),
                                                      Text(
                                                        cursos[index]["cursos"],
                                                        style: GoogleFonts
                                                            .delaGothicOne(
                                                                fontSize: 10,
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1
                                                                    ?.copyWith(
                                                                      color: Colors
                                                                          .black87,
                                                                    )),
                                                      ),
                                                      Text(
                                                        cursos[index]["desc"],
                                                        style: GoogleFonts
                                                            .delaGothicOne(
                                                                fontSize: 10,
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1
                                                                    ?.copyWith(
                                                                      color: Colors
                                                                          .black87,
                                                                    )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Card(
                                                      color: cursos[index][
                                                                  "situacao"] ==
                                                              "Concluido"
                                                          ? Colors.green
                                                          : Colors.amber,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          cursos[index]
                                                              ["situacao"],
                                                          style: GoogleFonts
                                                              .delaGothicOne(
                                                                  fontSize: 10,
                                                                  textStyle: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline1
                                                                      ?.copyWith(
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ))),
                Positioned(
                    right: 20,
                    bottom: 20,
                    child: ElevatedButton(
                        onPressed: Scrolling,
                        child: isscroll
                            ? Icon(Icons.keyboard_arrow_up_outlined)
                            : Icon(Icons.keyboard_arrow_down_rounded)))
              ],
            ),
          )
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
                    children: [
                      Text("Projetos: "),
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
                  ),
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
