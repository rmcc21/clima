void main() {
  performTasks();
}

void performTasks() async {
  task1();  
  String task2Result = await task2();
  task3(task2Result);
}

void task1(){
  String result = 'task 1 data';
  print ('task 1 complete');
}

Future<String> task2() async{
  Duration threeSeconds = Duration(seconds: 3);
  
  String result = 'invalid result';
  
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print ('task 2 complete');
  });
  
  return result;
}
void task3(String task2Data){
  String result = 'task 3 data';
  print ('task 3 complete, task 2 data: $task2Data' );
}

