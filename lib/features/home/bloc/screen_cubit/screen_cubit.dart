import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCubit extends Cubit<int> {
  ScreenCubit() : super(0);

  void setScreen(int index) {
    emit(index);
  }
}
