import 'package:cloud_firestore/cloud_firestore.dart';

  Future<List<Map<String, dynamic>>> getData(String codePostal) async {
    final Query query = FirebaseFirestore.instance.collection('data');
    List<Map<String, dynamic>> getData = [];

    QuerySnapshot result = await query.where("code_postal", isEqualTo: codePostal).get();

    result.docs.forEach((element) {
      getData.add(element.data());
    });
    return getData;
}