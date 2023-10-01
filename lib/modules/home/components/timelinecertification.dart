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
  double _currentSliderValue = 1;
  List<String> slidtext = [
    "Ate 1 ano",
    "Entre 1 a 2 anos",
    "Entre 2 a 3 anos",
    "Mais de 3 anos"
  ];
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
    return SizedBox(
      width: widget.width,
      height: widget.heigth + 100,
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
                          height: widget.heigth * .9,
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
                                    index == mensagens.length - 1
                                        ? IndicatorStyle.dot
                                        : IndicatorStyle.outlined,
                                oppositeContentsBuilder: (context, index) =>
                                    Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    datas[index],
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
                                        mensagens[index],
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
                                itemCount: mensagens.length,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          Column(
            children: [
              Card(
                elevation: 3,
                //color: Colors.lightBlue[100],
                child: Container(
                  height: widget.heigth * .9,
                  width: widget.width * .7,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Slider(
                        value: _currentSliderValue,
                        max: 3,
                        divisions: 3,
                        label: slidtext[_currentSliderValue.round()],
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                      Slider(
                        value: _currentSliderValue,
                        max: 3,
                        divisions: 3,
                        label: slidtext[_currentSliderValue.round()],
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                      Slider(
                        value: _currentSliderValue,
                        max: 3,
                        divisions: 3,
                        label: slidtext[_currentSliderValue.round()],
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
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
