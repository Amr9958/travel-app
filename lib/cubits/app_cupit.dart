import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app__/cubits/cupit_states.dart';

class app_cupit extends Cubit<cupit_states> {
  app_cupit() : super(initialState()) {
    emit(welcomeState());
  }
  mainpage() {
    emit(mainpageState());
  }

  detailedpage() {
    emit(detailedpageState());
  }
}
