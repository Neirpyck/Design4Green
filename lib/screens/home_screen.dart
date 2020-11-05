import 'package:design4green/pdf_generator.dart';
import 'package:design4green/screens/Cards.dart';
import 'package:design4green/services/services.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/indexed_db.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> result;

  @override
  Widget build(BuildContext context) {
    MyDatabase _database = MyDatabase();
    bool asResult = false;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                    'Trouvez l\'indice de fragilité de votre commune',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width > 900
                      ? MediaQuery.of(context).size.width * 0.3
                      : MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      onSubmitted: (value) async {
                        Map<String, dynamic> hit = await _database.getData(value);
                        setState(() {
                          result = hit; 
                          if(result != null){
                            asResult = true;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Code postal',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.arrow_downward),
                          onPressed: ()  {

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
                  SizedBox(
                      width: MediaQuery.of(context).size.width > 900 ? 50 : 10),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.grey)),
                    height: 60,
                    onPressed: () {},
                    child: Icon(Icons.search),
                  ),
                ],
              ),
              RowCards(result: (asResult = true) ? result : null),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: PdfGenerator(),
              ),
              Container(
                padding: EdgeInsets.only(top: 30.0),
                width: MediaQuery.of(context).size.width < 900
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: 'Que représente cet indice de fragilité ?\n\n',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, color: Colors.black),
                      ),
                    ),
                    Container(
                      child: Text(
                        '''L’indice de fragilité numérique sert à obtenir une projection de la fragilité numérique de votre territoire ainsi qu’à fournir une étude qualitative du numérique sur le territoire.Il correspond à la probabilité qu’une part non négligeable de la population se trouve en « zone blanche » sur un territoire donné. C’est un outil utile notamment pour la décision du lieu l’implantation d’entreprises mais aussi pour les particuliers, d’autant plus en cette période qui voit le télétravail prendre son essor. Cet indice est basé sur quatre critères majeurs : l’accès aux interfaces numériques, l’accès à l’information, les compétences administratives et les compétences numériques et scolaires (en savoir plus) afin de prendre en compte non seulement la dimension technologique mais aussi les dimensions économiques et sociales.\n''',
                        style: TextStyle(fontWeight: FontWeight.w200),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
