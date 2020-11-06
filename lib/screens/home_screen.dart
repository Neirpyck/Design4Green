import 'package:design4green/screens/Cards.dart';
import 'package:design4green/services/services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> result;
  bool asResult = false;
  bool displayMentionLegal = false;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

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
                      controller: _controller,
                      onSubmitted: (value) async {
                        List<Map<String, dynamic>> hit = await getData(value);
                        result = hit; 
                          if(hit != null){
                            setState(() {
                              asResult = true;
                            });
                          }
                      },
                      decoration: InputDecoration(
                        hintText: 'Code postal',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () async {
                            List<Map<String, dynamic>> hit = await getData(_controller.value.text);
                            result = hit; 
                              if(hit != null){
                                setState(() {
                                  asResult = true;
                                });
                              }
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
                ],
              ),
              (asResult == true) ? 
                RowCards(result: (asResult = true) ? result : null)
              :
                Container(),
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
              SizedBox(height: 50),
              FlatButton(
                padding: EdgeInsets.all(20.0),
                onPressed: () {
                  setState(() {
                    displayMentionLegal = !displayMentionLegal;
                  });
                },
                shape: RoundedRectangleBorder(side: BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(20)),
                child: Text('Mentions légales')
              ),
              displayMentionLegal == true ?
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "Edition du site :\n"
                    "Ce site à été conçu et édité par l’équipe n°15 du Design4Green du 04/11/2020.\n\n"
                    "Propriété intellectuelle :\n"
                    "L’ensemble du site relève de la législation française et internationale sur le droit d’auteur et la propriété intellectuelle. "
                    "Tous les droits de reproductions sont réservés, y compris les représentations photographiques. La reproduction, adaptation et/ou"
                    "traduction de tout ou partie de ce site sur un support quel qu’il soit, est formellement interdite sauf autorisation expresse de l’équipe d’édition.\n\n"
                    "Modification du site :\n"
                    "l’équipe se réserve le droit de modifier ou de corriger le contenu de ce site et de ces mentions légales à tout moment et ceci sans préavis.\n\n"
                    "Hébergeur :\n"
                    "Le site https://design4green-47860.web.app/#/ est hébergé par la société Google.\n\n"
                    "Sources :\n"
                    "Toutes les données relatives aux « indices de fragilité numérique » proviennent des données disponibles librement sur le site https://indice.institutnr.org/. "
                    "De plus les logos et imageries utilisés et leur propriété intellectuelle reviennent à leurs auteurs et propriétaires respectifs, sauf explicitement cité autrement.\n\n"
                    "Utilisation de Donnée :\n"
                    "Le site n’a pas vocation à collecter ou traiter des données de quelque manière que ce soit et décline toute responsabilité en cas de collecte, utilisation, ou partage, "
                    "illicite ou non de données personnelles provenant d’un ou plusieurs utilisateurs du site.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                )
              :
                Container()
            ],
          ),
        ),
      ],
    );
  }
}
