import 'package:cloud_firestore/cloud_firestore.dart';

  Future<List<Map<String, dynamic>>> getData(String codePostal) async {
    final Query query = FirebaseFirestore.instance.collection('data');
    // Map<String, dynamic> getData;
    List<Map<String, dynamic>> getData = [];
    // String dep = codePostal.substring(0, 2);
    // String depImplemented = (int.parse(dep) + 1).toString();
    // if(depImplemented.length == 1) {
    //   depImplemented = "0" + depImplemented;
    // }
    // print(dep);
    // print(depImplemented);


    QuerySnapshot result = await query.where("code_postal", isEqualTo: codePostal).get();

    result.docs.forEach((element) {
      // getData = element.data();
      getData.add(element.data());
    });
    // print(test);
    // print(getData.length);
    return getData;
}