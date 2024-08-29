import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgesDisplayState {}

class AgesLoadingState extends AgesDisplayState {}

class AgesLoadedState extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  AgesLoadedState(this.ages);
}

class AgesLoadFailureState extends AgesDisplayState {
  final String message;

  AgesLoadFailureState(this.message);
}
