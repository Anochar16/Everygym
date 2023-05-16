import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference<Map<String, dynamic>> db =
    FirebaseFirestore.instance.collection('ExercisePosture');

Future<void> getCooldownByCollection() async {
  db.where("Type", isEqualTo: 'Cooldown').get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}
