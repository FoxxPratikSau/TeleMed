import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new appointment
  Future<void> addAppointment(int doctorId, String userName, String email,
      String date, String time, String userImage) async {
    await _firestore.collection('appointments').add({
      'doctorId': doctorId,
      'userName': userName,
      'email': email,
      'date': date,
      'time': time,
      'userImage': userImage,
    });
  }

  // Retrieve appointments for a specific doctor
  Stream<QuerySnapshot> getDoctorAppointments(int doctorId) {
    return _firestore
        .collection('appointments')
        .where('doctorId', isEqualTo: doctorId)
        .snapshots();
  }

  Stream<QuerySnapshot> getUserAppointments(String email) {
    return _firestore
        .collection('appointments')
        .where('email', isEqualTo: email)
        .snapshots();
  }
}
