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
    "   $TaskDoneOrNot BOOLEAN NOT NULL "
    ")";


// Seed inicial para o aplicativo
const SEED_TABLE =[
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Tirar o Lixo','Colocar o lixo pra fora as 16:00','0')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras1','Comprar queijo, presunto e pão','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras2','Comprar queijo, presunto e pão','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras3','Comprar queijo, presunto e pão','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras4','Comprar queijo, presunto e pão','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras5','Comprar queijo, presunto e pão','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras6','Comprar queijo, presunto e pão','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras7','Comprar queijo, presunto e pão','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Fazer Compras8','Comprar queijo, presunto e pão','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Limpar a cozinha','Lavar a louça suja e limpar o fogão','0')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Malhar','treino de perna','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Estudar para a prova de Calculo III','Estudar a lista de exercício para prova na quinta feira','0')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('twesasi9awidiwa','Estudar a lista de exercício para prova na quinta feira opkawddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd','0')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Jiu jitsu','Jiu jitsu terça e quinta','1')",
  "INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('Levar o carro na oficina','O carro tem apresentado um barulho estranho no motor e deve ser investigado','0')",
];

