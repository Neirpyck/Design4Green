import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class RowCards extends StatelessWidget {
  const RowCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 1300) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ResultCard(2000, 93, 'Seiches sur le Loir', 97, 78, 96, 105),
          ResultCard(2000, 93, 'Maine et Loire', 97, 78, 96, 105),
          ResultCard(2000, 93, 'Pays de la Loire', 97, 78, 96, 105),
          ResultCard(2000, 93, 'Global', 97, 78, 96, 105),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ResultCard(2000, 93, 'Seiches sur le Loir', 97, 78, 96, 105),
          ResultCard(2000, 93, 'Maine et Loire', 97, 78, 96, 105),
          ResultCard(2000, 93, 'Pays de la Loire', 97, 78, 96, 105),
          ResultCard(2000, 93, 'Global', 97, 78, 96, 105),
        ],
      );
    }
  }
}

// ignore: must_be_immutable
class ResultCard extends StatelessWidget {
  int pop;
  int score;
  String collectivite;
  int accesNum;
  int accesInfo;
  int compAdmin;
  int compNum;

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
  int pop;
  int score;
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
  int accesNum;
  int accesInfo;
  int compAdmin;
  int compNum;

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
