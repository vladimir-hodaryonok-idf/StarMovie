import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

abstract class FireStoreService {
  Future<List<Map<String, dynamic>>> findUserInCloud(UserEmailPass user);

  Future<Map<String, dynamic>> fetchVersionsFromCloud();
}

const _usersCollection = 'StarMovie_users';
const _versionCollection = 'StarMovie_versions';

class FireStoreServiceImpl implements FireStoreService {
  final FirebaseFirestore firebaseFirestore;

  const FireStoreServiceImpl(this.firebaseFirestore);

  @override
  Future<List<Map<String, dynamic>>> findUserInCloud(
    UserEmailPass user,
  ) async {
    const login = 'login';
    const password = 'password';

    final QuerySnapshot<Map<String, dynamic>> query = await firebaseFirestore
        .collection(_usersCollection)
        .where(login, isEqualTo: user.login)
        .where(password, isEqualTo: user.password)
        .get();
    return query.docs.map((e) => e.data()).toList();
  }

  @override
  Future<Map<String, dynamic>> fetchVersionsFromCloud() async {
    final QuerySnapshot<Map<String, dynamic>> query =
        await firebaseFirestore.collection(_versionCollection).get();
    return query.docs.first.data();
  }
}
