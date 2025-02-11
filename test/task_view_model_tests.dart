import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// DISCLAIMER ================================================================================================
// Todos os testes deverão ser feitos logo apos a instalação do app (sem modificações nas tasks)
// Comando para rodar os testes: flutter test test/task_view_model_tests.dart
// DISCLAIMER ================================================================================================


void main() async{

  setUpAll((){
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });
  TaskViewModel tvm = new TaskViewModel();

  test('getTasksDone', () async {
    List<TaskModel> tasks = await tvm.getTasksDone()!;
    expect(tasks.first.id, 2);
    expect(tasks.first.Name, "Fazer Compras1");
    expect(tasks.first.Description, "Comprar queijo, presunto e pão");
    expect(tasks.first.Done, true);
  });

  test('getTasksNotDone', () async {
    List<TaskModel> tasks = await tvm.getTasksNotDone()!;
    expect(tasks.first.id, 1);
    expect(tasks.first.Name, "Tirar o Lixo");
    expect(tasks.first.Description, "Colocar o lixo pra fora as 16:00");
    expect(tasks.first.Done, false);
  });

  test('getTask',() async {
    TaskModel? task = await tvm.getTask("t");
    expect(task!.Name, "Tirar o Lixo");
  });

  test('createTask', () async {
    tvm.createTask("uniq", "1", true);
    TaskModel? searched = await tvm.getTask("uniq");
    expect(searched!.Name, "uniq");
  });



}