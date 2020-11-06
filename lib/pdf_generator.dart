import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

class PdfGenerator extends StatelessWidget {
  final Map<String, dynamic> result;
  
  PdfGenerator({
    this.result
  });

  @override
  Widget build(BuildContext context) {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: <pw.Widget>[
              pw.Text('Indice de fragilité', style: pw.TextStyle(fontSize: 24)),
              pw.Header(
                  level: 0,
                  child: pw.Text("Votre recherche: ",
                      style: pw.TextStyle(fontSize: 14))),
              pw.Row(children: [
                pw.Text("Nom de la commune: "),
                pw.Text(result['nom_iris']),
              ]),
              pw.Row(children: [
                pw.Text("Code Postal: "),
                pw.Text("Variable CP"),
              ]),
              pw.Row(children: [
                pw.Text("Département: "),
                pw.Text("Variable dep"),
              ]),
              pw.Row(children: [
                pw.Text("Région: "),
                pw.Text("${result["class_score_glob_region"]}\n"),
              ]),
              pw.Header(
                level: 0,
                child: pw.Text("Les résultats pour la commune ci-dessus: ",
                    style: pw.TextStyle(fontSize: 14)),
              ),
              pw.Row(children: [
                pw.Text("Accès Numérique: "),
                pw.Text(result['acces_num']),
              ]),
              pw.Row(children: [
                pw.Text("Accès Information: "),
                pw.Text(result['acces_info']),
              ]),
              pw.Row(children: [
                pw.Text("Compétence administratives: "),
                pw.Text(result['compt_admin']),
              ]),
              pw.Row(children: [
                pw.Text("Compétences numériques: "),
                pw.Text(result['compt_num_sco']),
              ]),
              pw.Row(children: [
                pw.Text("Score Global: "),
                pw.Text(result['score_glob']),
              ]),
              pw.Header(
                level: 0,
                child: pw.Text("Les résultats du département: ",
                    style: pw.TextStyle(fontSize: 14)),
              ),
              pw.Row(children: [
                pw.Text("Accès Numérique: "),
                pw.Text("Variable num" + " %"),
              ]),
              pw.Row(children: [
                pw.Text("Accès Information: "),
                pw.Text("Variable info" + " %"),
              ]),
              pw.Row(children: [
                pw.Text("Compétence administratives: "),
                pw.Text("Variable admin" + " %"),
              ]),
              pw.Row(children: [
                pw.Text("Compétences numériques: "),
                pw.Text("Variable num" + " %"),
              ]),
              pw.Row(children: [
                pw.Text("Score Global: "),
                pw.Text("Variable glob" + " % \n"),
              ]),
              pw.Header(
                level: 0,
                child: pw.Text("Les résultats de la région: ",
                    style: pw.TextStyle(fontSize: 14)),
              ),
              pw.Row(children: [
                pw.Text("Accès Numérique: "),
                pw.Text("Variable num" + " %"),
              ]),
              pw.Row(children: [
                pw.Text("Accès Information: "),
                pw.Text("Variable info" + " %"),
              ]),
              pw.Row(children: [
                pw.Text("Compétence administratives: "),
                pw.Text("Variable admin" + " %"),
              ]),
              pw.Row(children: [
                pw.Text("Compétences numériques: "),
                pw.Text("Variable num" + " %"),
              ]),
              pw.Row(children: [
                pw.Text("Score Global: "),
                pw.Text("Variable glob" + " % \n"),
              ]),
            ],
          );
        },
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: <pw.Widget>[
              pw.Header(
                level: 0,
                child: pw.Text("A quoi correspondent ces valeurs ? ",
                    style: pw.TextStyle(fontSize: 14)),
              ),
              pw.Column(
                children: [
                  pw.Paragraph(
                      text:
                          "L'indice de fragilité numérique sert à obtenir une projection de la fragilité numérique de votre "
                          " territoire ainsi qu'à fournir une étude qualitative du numérique sur le territoire. Il correspond à la probabilité"
                          " qu'une part non négligeable de la population se trouve en « zone blanche » sur un territoire donné. C'est un outil"
                          " utile notamment pour la décision du lieu l'implantation d'entreprises mais aussi pour les particuliers, d'autant "
                          " plus en cette période qui voit le télétravail prendre son essor.\n \n"
                          "Cet indice est basé sur quatre critères majeurs : l'accès aux interfaces numériques, l'accès à l'information, les"
                          " compétences administratives et les compétences numériques et scolaires (en savoir plus) afin de prendre en compte"
                          " non seulement la dimension technologique mais aussi les dimensions économiques et sociales.\n \n Accès aux interfaces numériques :\n"
                          "Cet indice examine la disponibilité des technologies haut débit (DSL, câble, fibre) et mobiles 2G. De plus il prend aussi en compte"
                          " le taux de pauvreté et le revenu médian sur le territoire.\n \n"),
                  pw.Text(
                    "Accès à l'information :\n",
                    style:
                        pw.TextStyle(decoration: pw.TextDecoration.underline),
                  ),
                  pw.Paragraph(
                      text:
                          "L'accès à l'information examine l'environnement social du territoire comme le taux de familles monoparentales, de ménages"
                          " d'une personne et la présence ou non de services publiques.\n \n"),
                  pw.Text(
                    "Compétences administratives :\n",
                    style:
                        pw.TextStyle(decoration: pw.TextDecoration.underline),
                  ),
                  pw.Paragraph(
                      text:
                          "Il s'agit de l'étude démographique de la population du territoire prenant en compte la part des chômeurs en âge de travailler"
                          " (15-64 ans) ainsi que la part de personnes les plus susceptibles d'utiliser le numérique (15-29 ans).\n \n"),
                  pw.Text(
                    "Compétences numériques et scolaires :\n",
                    style:
                        pw.TextStyle(decoration: pw.TextDecoration.underline),
                  ),
                  pw.Paragraph(
                      text:
                          "Cet indicateur montre la part de personnes disposant de peu de compétences numériques comme les retraités (65 ans et plus) et les"
                          " personnes pas ou peu diplômées de 15 ans et plus.\n \n"),
                  pw.Text(
                    "Ce rapport est issu du site  https://design4green-47860.web.app/#/  conçu et édité par l'équipe n°15 du Design4Green du 04/11/2020.",
                    style: pw.TextStyle(
                      decoration: pw.TextDecoration.underline,
                      fontStyle: pw.FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    final bytes = pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');

    // ignore: non_constant_identifier_names
    void Download_Pdf() {
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'result_indice_fragilite.pdf';
      html.document.body.children.add(anchor);
      anchor.click();
      html.document.body.children.remove(anchor);
      html.Url.revokeObjectUrl(url);
    }

    // ignore: non_constant_identifier_names
    void Display_Pdf() {
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.window.open(url, "_blank");
      html.Url.revokeObjectUrl(url);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //bouton afficher pdf dans le navigateur web
        RaisedButton(
          child: Text('Open'),
          onPressed: () {
            Display_Pdf();
          },
        ),
        Container(
          width: 10,
        ),
        //bouton télécharger
        RaisedButton(
          child: Text('Download'),
          onPressed: () {
            Download_Pdf();
          },
        ),
      ],
    );
  }
}
