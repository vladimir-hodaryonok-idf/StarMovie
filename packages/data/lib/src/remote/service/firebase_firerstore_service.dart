import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/src/constants/strings.dart';
import 'package:domain/domain.dart';

abstract class FireStoreService {
  Future<List<Map<String, dynamic>>> findUserInCloud(UserEmailPass user);

  Future<Map<String, dynamic>> fetchVersionsFromCloud();
}

class FireStoreServiceImpl implements FireStoreService {
  final FirebaseFirestore firebaseFirestore;

  const FireStoreServiceImpl(this.firebaseFirestore);

  @override
  Future<List<Map<String, dynamic>>> findUserInCloud(
    UserEmailPass user,
  ) async {


    final QuerySnapshot<Map<String, dynamic>> query = await firebaseFirestore
        .collection(DataStrings.usersCollection)
        .where(DataStrings.login, isEqualTo: user.login)
        .where(DataStrings.password, isEqualTo: user.password)
        .get();
    return query.docs.map((e) => e.data()).toList();
  }

  @override
  Future<Map<String, dynamic>> fetchVersionsFromCloud() async {
    final QuerySnapshot<Map<String, dynamic>> query =
        await firebaseFirestore.collection(DataStrings.versionCollection).get();
    return query.docs.first.data();
  }
}
