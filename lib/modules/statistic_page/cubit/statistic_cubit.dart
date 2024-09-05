import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'statistic_state.dart';

class StatisticPageCubit extends Cubit<StatisticPageState> {
  StatisticPageCubit() : super(StatisticPageInitial());
}
