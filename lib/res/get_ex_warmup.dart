import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everygym/modals/dataExcercise.dart';

CollectionReference<Map<String, dynamic>> db =
    FirebaseFirestore.instance.collection('ExercisePosture');
List<void> datawarmupname = [];
Future<void> getWarmupByCollection() async {
  db.where("Type", isEqualTo: 'Warm Up').get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        // print('${docSnapshot.data()}');
        var test = docSnapshot.get('ExerciseName');
        
        print(test);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}
