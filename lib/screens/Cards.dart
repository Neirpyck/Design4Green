import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class RowCards extends StatefulWidget {
  final Map<String, dynamic> result;
  
  RowCards({
    this.result
  });

  @override
  _RowCardsState createState() => _RowCardsState();
}

class _RowCardsState extends State<RowCards> {
  @override
  Widget build(BuildContext context) {
    print(widget.result);
    print('aaaaaa');

    if (MediaQuery.of(context).size.width <= 1300) {
      if(widget.result == null) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                ResultCard(null, null, '-', null, null, null, null),
                ResultCard(null, null, '-', null, null, null, null),
                ResultCard(null, null, '-', null, null, null, null),
                ResultCard(null, null, '-', null, null, null, null),

                // ResultCard(2000, 93, 'Maine et Loire', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Pays de la Loire', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Global', 97, 78, 96, 105)

                // ResultCard(2000, 93, 'Seiches sur le Loir', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Maine et Loire', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Pays de la Loire', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Global', 97, 78, 96, 105),
          ],
        );
      } else {
        return Container();
      }
     
    } else {
      if(widget.result == null) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ResultCard(null, null, '-', null, null, null, null),
            ResultCard(null, null, '-', null, null, null, null),
            ResultCard(null, null, '-', null, null, null, null),
            ResultCard(null, null, '-', null, null, null, null),

                // ResultCard(2000, 93, 'Maine et Loire', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Pays de la Loire', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Global', 97, 78, 96, 105)

                // ResultCard(2000, 93, 'Seiches sur le Loir', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Maine et Loire', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Pays de la Loire', 97, 78, 96, 105),
                // ResultCard(2000, 93, 'Global', 97, 78, 96, 105),
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ResultCard(
              widget.result['Population'],
              widget.result['SCORE_GLOBAL'],
              widget.result['Nom_Com'],
              widget.result['ACCÈS_AUX_INTERFACES_NUMERIQUES'],
              widget.result['ACCES_INFORMATION'],
              widget.result['COMPETENCES_ADMINISTATIVES'],
              widget.result['COMPÉTENCES_NUMÉRIQUES_SCOLAIRES']
            ),
            ResultCard(null, null, '-', null, null, null, null),
            ResultCard(null, null, '-', null, null, null, null),
            ResultCard(null, null, '-', null, null, null, null),
          ],
        );
      }
      // return Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     ResultCard(2000, 93, 'Seiches sur le Loir', 97, 78, 96, 105),
      //     ResultCard(2000, 93, 'Maine et Loire', 97, 78, 96, 105),
      //     ResultCard(2000, 93, 'Pays de la Loire', 97, 78, 96, 105),
      //     ResultCard(2000, 93, 'Global', 97, 78, 96, 105),
      //   ],
      // );
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
