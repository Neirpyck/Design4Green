import 'package:flutter/material.dart';

class RowCards extends StatelessWidget {
  const RowCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ResultCard(),
        ResultCard(),
        ResultCard(),
      ],
    );
  }
}

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Recto(2000, 93);
  }
}

// ignore: must_be_immutable
class Recto extends StatelessWidget {
  int pop;
  int score;

  Recto(
    this.pop,
    this.score,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text('Commune'),
              Text('$pop'),
            ],
          ),
          Row(
            children: [
              Text('Score'),
              Text('$score'),
            ],
          )
        ],
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
      child: Column(
        children: [
          Row(
            children: [
              Text('Accès Numérique'),
              Text('$accesNum'),
            ],
          ),
          Row(
            children: [
              Text('Accès Information'),
              Text('$accesInfo'),
            ],
          ),
          Row(
            children: [
              Text('Compétences administratives'),
              Text('$compAdmin'),
            ],
          ),
          Row(
            children: [
              Text('Compétences numériques'),
              Text('$compNum'),
            ],
          ),
        ],
      ),
    );
  }
}
