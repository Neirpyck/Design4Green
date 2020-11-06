import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../pdf_generator.dart';

class RowCards extends StatefulWidget {
  final List<Map<String, dynamic>> result;
  
  RowCards({
    this.result
  });

  @override
  _RowCardsState createState() => _RowCardsState();
}

class _RowCardsState extends State<RowCards> {
  bool showCards = false;
  Widget cardCommune;
  Widget cardDept;
  Widget cardRegion;
  Map<String, dynamic> selectedData = {};

  showingCards(Map<String, dynamic> data) {
    cardCommune =  ResultCard(data["pop"], data["score_glob"], data["nom_iris"], data["acces_num"], data["acces_info"], data["compt_admin"], data["compt_num_sco"]);
    cardDept = ResultCard("", data["score_glob_dept"], data["nom_dept"], data["score_num_dept"], data["acces_info_dep"], data["compt_admin_dep"], data["compt_num_sco_dep"]);
    cardRegion = ResultCard("", data["score_glob_reg"], data["nom_region"], data["acces_num_reg"], data["acces_info_reg"], data["compt_admin_reg"], data["compt_num_sco_reg"]);
    return true;
  }


  @override
  Widget build(BuildContext context) {
      if (MediaQuery.of(context).size.width <= 1300) {
      if(widget.result != null) {
        return Column(
           children: [
             Container(
               height: 300,
               width: MediaQuery.of(context).size.width > 900
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.5,
               child: ListView.builder(
                itemCount: widget.result.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          showingCards(widget.result[index]);
                          selectedData = widget.result[index];
                          showCards = true;
                        });
                        print(widget.result[index]);
                      },
                      title: Text(widget.result[index]['nom_iris']),
                    ),
                  );
                },
              ),
             ),
            (showCards == true) ?
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    cardCommune,
                    cardDept,
                    cardRegion,
                  ],
                )
            :
              Container(),
            (showCards == true) ?
              PdfGenerator(result: selectedData)
            :
              Container(),
           ],
         );
      } else {
        return Container();
      }
     
    } else {
      if(widget.result != null) {
         return Column(
           children: [
             Container(
               height: 300,
               width: MediaQuery.of(context).size.width > 900
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.5,
               child: ListView.builder(
                itemCount: widget.result.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          showingCards(widget.result[index]);
                          selectedData = widget.result[index];
                          showCards = true;
                        });
                        print(widget.result[index]);
                      },
                      title: Text(widget.result[index]['nom_iris']),
                    ),
                  );
                },
              ),
             ),
            (showCards == true) ?
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    cardCommune,
                    cardDept,
                    cardRegion,
                  ],
                )
            :
              Container(),
            (showCards == true) ?
              PdfGenerator(result: selectedData)
            :
              Container(),
           ],
         );
      } else {
        return Container();
      }
    }
  }
}

// ignore: must_be_immutable
class ResultCard extends StatelessWidget {
  String pop;
  String score;
  String collectivite;
  String accesNum;
  String accesInfo;
  String compAdmin;
  String compNum;

  ResultCard(
    this.pop,
    this.score,
    this.collectivite,
    this.accesNum,
    this.accesInfo,
    this.compAdmin,
    this.compNum,
  );

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Recto(pop, score, collectivite),
      back: Verso(accesNum, accesInfo, compAdmin, compNum),
    );
  }
}

// ignore: must_be_immutable
class Recto extends StatelessWidget {
  String pop;
  String score;
  String collectivite;

  Recto(
    this.pop,
    this.score,
    this.collectivite,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Card(
        child: Container(
          width: 300,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(collectivite),
                  Text('Score'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$pop'),
                  Text('$score'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Verso extends StatelessWidget {
  String accesNum;
  String accesInfo;
  String compAdmin;
  String compNum;

  Verso(
    this.accesNum,
    this.accesInfo,
    this.compAdmin,
    this.compNum,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Accès Numérique'),
                Text('Accès Information'),
                Text('Compétences administratives'),
                Text('Compétences numériques'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('$accesInfo'),
                Text('$accesNum'),
                Text('$compAdmin'),
                Text('$compNum'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
