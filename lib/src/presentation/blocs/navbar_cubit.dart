import 'package:bloc/bloc.dart';

class NavbarCubit extends Cubit<int> {
  int initialData;

  NavbarCubit({this.initialData = 0}) : super(initialData);

  void changeIndex(i) => emit(i);
}
