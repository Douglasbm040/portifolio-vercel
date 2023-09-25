import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
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
  List<String> mensagens = [
    "Pós graduando em cidades inteligentes - UFES",
    "Iniciação cientifica - UFES",
    "Estágio de Desenvolvimento - Conexos",
    "Graduando em Sistemas de Informação - UFES",
    "Graduado em Enfermagem - SÃO CAMILO",
  ];
  List<String> datas = [
    "Atualmente\nprevisão 2026",
    "Setembro/2022\nAtualmente",
    "Agosto/2022\nAtualmente",
    "Atualmente\nprevisão 2024",
    "2016-2021",
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                  top: -180,
                  left: -130,
                  child: widget.index == 0
                      ? Animate(
                          effects: [
                            FadeEffect(duration: Duration(seconds: 10))
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
              Animate(
                effects: [FadeEffect(duration: Duration(seconds: 10))],
                child: Container(
                  height: 350,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Timeline.tileBuilder(
                      theme: TimelineThemeData(color: Colors.amber),
                      builder: TimelineTileBuilder.connectedFromStyle(
                        contentsAlign: ContentsAlign.basic,
                        connectionDirection: ConnectionDirection.before,
                        lastConnectorStyle: ConnectorStyle.transparent,
                        firstConnectorStyle: ConnectorStyle.dashedLine,
                        connectorStyleBuilder: (context, index) {
                          return ConnectorStyle.solidLine;
                        },
                        indicatorStyleBuilder: (context, index) =>
                            index == mensagens.length - 1
                                ? IndicatorStyle.dot
                                : IndicatorStyle.outlined,
                        oppositeContentsBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            datas[index],
                            style: GoogleFonts.bebasNeue(
                                fontSize: 9,
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
                                mensagens[index],
                                style: GoogleFonts.delaGothicOne(
                                    fontSize: 9,
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
                        itemCount: mensagens.length,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    // TODO: implement createTicker
    throw UnimplementedError();
  }
}
