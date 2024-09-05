import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'legends_state.dart';

class LegendsPageCubit extends Cubit<LegendsPageState> {
  LegendsPageCubit() : super(LegendsPageInitial());
}
