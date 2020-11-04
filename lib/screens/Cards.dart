import 'package:flutter/material.dart';

class RowCards extends StatelessWidget {
  const RowCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ResultCard(2000, 93, 'Seiches sur le Loir', 97, 78, 96, 105),
        ResultCard(2000, 93, 'Seiches sur le Loir', 97, 78, 96, 105),
        ResultCard(2000, 93, 'Seiches sur le Loir', 97, 78, 96, 105),
      ],
    );
  }
}

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
    return Column(
      children: [
        Recto(pop, score, collectivite),
        Verso(accesNum, accesInfo, compAdmin, compNum),
      ],
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
