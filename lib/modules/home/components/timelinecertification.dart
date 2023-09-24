import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';

class TimeLineListItem extends StatefulWidget {
  const TimeLineListItem(
      {super.key, required this.heigth, required this.width});
  final double heigth;
  final double width;

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
    "Atualmente - previsão 2026",
    "Setembro/2022 - Atualmente",
    "Agosto/2022 - Atualmente",
    "Atualmente - previsão 2024",
    "2016-2021",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            height: widget.heigth,
            width: 400,
            child: SizedBox(
              height: widget.heigth,
              width: 600,
              child: Timeline.tileBuilder(
                theme: TimelineThemeData(color: Colors.black),
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
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      datas[index],
                      style: GoogleFonts.bebasNeue(
                          fontSize: 10,
                          textStyle:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    color: Colors.black87,
                                  )),
                    ),
                  ),
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          mensagens[index],
                          style: GoogleFonts.delaGothicOne(
                              fontSize: 10,
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
        ],
      ),
    );
  }
}
