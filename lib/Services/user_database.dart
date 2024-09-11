import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tyamo/Model/my_user.dart';

class UserDatabase {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> createUserInDb(MyUser user) async {
    try {
      await firestore.collection("users").doc(user!.uid).set({
        "uid": user.uid,
        "email": user.email,
        "password": user.password,
        "username": user.displayName,
        "avatarUrl": user.avatarUrl,
        "chatRoomId": user.chatRoomId,
        "friendUid": user.friendUid,
        "gender": user.gender,
        "phone": user.phone,
        "accountCreated": Timestamp.now(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<MyUser> getUserInfoById(String uid) async {
    MyUser myUser = MyUser();

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestore
        .collection("user")
        .doc("NxOjjVGB3yuBR4nrywO3")
        .get();

    myUser.uid = documentSnapshot.data()!["uid"];
    myUser.email = documentSnapshot.data()!["email"];
    myUser.avatarUrl = documentSnapshot.data()!["avatarUrl"];
    myUser.username = documentSnapshot.data()!["username"];
    myUser.displayName = documentSnapshot.data()!["displayName"];
    myUser.friendUid = documentSnapshot.data()!["friendUid"];
    myUser.chatRoomId = documentSnapshot.data()!["chatRoomId"];
    myUser.gender = documentSnapshot.data()!["gender"];
    myUser.phone = documentSnapshot.data()!["phone"];

    return myUser;
  }
}
