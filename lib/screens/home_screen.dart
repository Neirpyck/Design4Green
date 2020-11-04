import 'package:design4green/screens/Cards.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  'Trouvez l\'indice de fragilité de votre commune',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Code postal',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.arrow_downward),
                        onPressed: () {

                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.grey)
                  ),
                  height: 60,
                  onPressed: () {

                  },
                  child: Icon(Icons.search),
                ),
              ],
            ),
            RowCards(),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey)
                ),
                height: 60,
                onPressed: () {

                },
                child: Text("Imprimer les résulats"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30.0),
              width: 800,
              child: RichText(
                text: TextSpan(
                  text: 'Que représente cet indice de fragilité ?\n\n',
                  style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text:  
                        "L’indice de fragilité numérique sert à obtenir une projection de la fragilité numérique de votre territoire ainsi qu’à fournir une étude qualitative du numérique sur le territoire.\n\n"
                        "Il correspond à la probabilité qu’une part non négligeable de la population se trouve en « zone blanche » sur un territoire donné. C’est un outil utile notamment pour la décision du lieu l’implantation "
                        "d’entreprises mais aussi pour les particuliers, d’autant plus en cette période qui voit le télétravail prendre son essor. "
                        "Cet indice est basé sur quatre critères majeurs : l’accès aux interfaces numériques, l’accès à l’information, les compétences administratives et les compétences numériques et scolaires (en savoir plus) afin "
                        "de prendre en compte non seulement la dimension technologique mais aussi les dimensions économiques et sociales.\n",
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
