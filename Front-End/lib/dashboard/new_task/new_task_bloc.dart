import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_task_event.dart';
part 'new_task_state.dart';

class NewTaskBloc extends Bloc<NewTaskEvent, NewTaskState> {
  NewTaskBloc() : super(NewTaskInitial()) {
    on<NewTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
