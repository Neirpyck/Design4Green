import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabase {
  final Query query = FirebaseFirestore.instance.collection('data');

  Future<Map<String, dynamic>> getData(String codePostal) async {
    Map<String, dynamic> getData;
    QuerySnapshot result = await query.where("code_postal", isEqualTo: codePostal).get();
    result.docs.forEach((element) {
      getData = element.data();
    });
    return getData;
  // result.docs.forEach((element) {
  //     data = element.data();
  //   });
  // }   
  }
}