<form method="post">
    <input type="text" name="nome">
    <input type="text" name="email">
    <input type="submit" value="Enviar">
</form>
<?php
    //Nome do servidor
    $servername = "localHost";     
    //Nome da base de dados
    $database = "teste"; 
    //Nome de usuario       
    $username = "root";     
    //Senha do usuario
    $passoword = "";     

    //Criando a conexão com o banco de dados.
    //$pdo = new PDO('mysql:$servername,dbname=$database',$username,$passoword);

    try {
        $nome = filter_var($_POST['nome'], FILTER_SANITIZE_STRIPPED);
        $email = filter_var($_POST['email'], FILTER_SANITIZE_STRIPPED);
    
        $pdo = new PDO("mysql:localhost,dbname=teste",'root','');
        echo "Nome: $nome </br>";
        echo "Email: $email </br>";
        if($nome != 0 or $nome != 'null'){
            echo "o comando vai ser executado agora </br>";
            $sql = $pdo->prepare("insert into clientes VALUES (?,?)");
            $sql->bindValue(1,$nome);
            $sql->bindValue(2,$email);
            $sql->execute();
            echo "Comando executado";
        }
    } catch (\Throwable $th) {
        echo "</br>";
        print_r($th);
    }
?>

