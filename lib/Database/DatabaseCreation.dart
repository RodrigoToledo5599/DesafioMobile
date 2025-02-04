const VERSION =1;

const DB_NAME = "Taski";

// tabela principal
const TASK_TABLE_NAME = "Task";
const TaskName = "Name";
const TaskDescription = "Description";
const TaskDoneOrNot = "Done";


const CREATE_DB_SCRIPT =
    "CREATE TABLE $TASK_TABLE_NAME ("
    "   id INTEGER PRIMARY KEY, "
    "   $TaskName TEXT NOT NULL, "
    "   $TaskDescription TEXT, "
    "   $TaskDoneOrNot BOOLEAN NOT NULL, "
    ")";


// Seed inicial para o aplicativo
const SEED_TABLE =[
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Tirar o Lixo','Colocar o lixo pra fora as 16:00','0')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras','Comprar queijo, presunto e pão','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('','','0')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras','','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras','','0')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras','','1')",

  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Levar o carro na oficina','O carro tem apresentado um barulho estranho no motor e deve ser investigado','0')",
];

