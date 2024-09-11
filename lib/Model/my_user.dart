import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String? uid;
  String? email;
  String? password;
  String? username;
  String? displayName;
  String? avatarUrl;
  String? friendUid;
  String? chatRoomId;
  String? gender;
  String? phone;
  bool? isLoadingStartupData;
  Timestamp? accountCreated;
  MyUser({
    this.phone,
    this.password,
    this.accountCreated,
    this.avatarUrl,
    this.chatRoomId,
    this.displayName,
    this.email,
    this.friendUid,
    this.gender,
    this.uid,
    this.isLoadingStartupData,
    this.username,
  });
}
