import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class PhotoSliderGet extends GetxController {
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  FirebaseStorage storageRef = FirebaseStorage.instance;
  String collectionName = 'image';
}
