<?php


$idusuario = isset($_GET["iduser"]) ? $_GET["iduser"]: null;
$op = isset($_GET["op"]) ? $_GET["op"]: null;

try {

    $servidor = "localhost";

    $usuario = "root";

    $senha = "";

    $bd = "bdsistema";

    $con = new PDO("mysql:host=$servidor;dbname=$bd",$usuario,$senha); 

    //var_dump($con);

    //die()


    if($op == "del"){
        $sql = "DELETE FROM tblusuarios WHERE iduser = :iduser";
        $stmt = $con->prepare($sql);
        $stmt->bindValue(":iduser", $idusuario);
        $stmt->execute();
        header("Location:administrativo.php");
    }

    if($idusuario){
        $sql = "SELECT * FROM tblusuarios WHERE iduser = :iduser";
        $stmt = $con->prepare($sql);
        $stmt->bindValue(":iduser", $idusuario);
        $stmt->execute();
        $usuario = $stmt->fetch(PDO::FETCH_OBJ);

    }

    if($_POST){
        if($_POST["idusuario"]){
            $sql = "UPDATE tblusuarios SET nome = :nome, email = :email, senha = :senha, idsit = :idsit, idnivel = :idnivel, criado = :criado, modificado = :modificado WHERE iduser = :iduser";
            $stmt = $con->prepare($sql);
            $stmt->bindValue(":nome", $_POST["nome"]);
            $stmt->bindValue(":email", $_POST["email"]);
            $stmt->bindValue(":senha", $_POST["senha"]);
            $stmt->bindValue(":idsit", $_POST["idsit"]);
            $stmt->bindValue(":idnivel", $_POST["idnivel"]);
            $stmt->bindValue(":criado", $_POST["criado"]);
            $stmt->bindValue(":modificado", $_POST["modificado"]);
            $stmt->bindValue(":iduser", $_POST["iduser"]);
            $stmt->execute();

        } else{
            $sql = "INSERT INTO tblusuarios(nome, email, senha, idsit, idnivel, criado, modificado) VALUES(:nome, :email, :senha, :idsit, :idnivel, :criado, :modificado)";
            $stmt = $con->prepare($sql);
            
            $stmt->bindValue(":nome", $_POST["nome"]);
            $stmt->bindValue(":email", $_POST["email"]);
            $stmt->bindValue(":senha", $_POST["senha"]);
            $stmt->bindValue(":idsit", $_POST["idsit"]);
            $stmt->bindValue(":idnivel", $_POST["idnivel"]);
            $stmt->bindValue(":criado", $_POST["criado"]);
            $stmt->bindValue(":modificado", $_POST["modificado"]);
            $stmt->execute();
            
        }
        header("Location:administrativo.php");

    }
} catch(PDOException $e){

    echo "Erro de conexão com o BD".$e->getMessage;

   }





?>




<!doctype html>
<html lang="pt-br">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Cadastro de Usuários</title>
  </head>
  <body>

  <nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Administrador</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            
            <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Usuário
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="listaruser.php">Listar</a></li>
                <li><a class="dropdown-item" href="frmusuario.php">Novo Usuário</a></li>
                
            </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Produtos</a>
            </li>
        </ul>
   
            <a href='sair.php' class="btn btn-outline-warning btn-sm">Sair</a>
        
        
    </div>
    </nav>
  
    <!--Inicio do Fomulário-->
    <div class="container">
        <h1 class="display-6 mb-3">Inscrevendo Novo Usuário</h1>
        <form method="POST">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="for-label">Nome do Usuário  </label>
                <input type="text" name="nome" class="for-control" value="<?php echo isset($usuario) ? $usuario->nome: null ?>">
            </div>
            <div class="mb-3">
                <label for="">Email</label>
                <input type="text" name="email" value="<?php echo isset($usuario) ? $usuario->email: null?>">
            </div>
            <div class="mb-3">
                <label for="">Senha</label>
                <input type="password" name="senha" value="<?php echo isset($usuario) ? $usuario->senha: null?>">
            </div>
            <div class="mb-3">
                <label for="">Situção</label>
                <input type="text" name="idsit" value="<?php echo isset($usuario) ? $usuario->idsit: null?>">
            </div>
            <div class="mb-3">
                <label for="">Nível de Acesso</label>
                <input type="text" name="idnivel" value="<?php echo isset($usuario) ? $usuario->idnivel: null?>">
            </div>
            <div class="mb-3">
                <label for="">Criado em:</label>
                <input type="date" name="criado" value="<?php echo isset($usuario) ? $usuario->criado: null?>">
            </div>
            <div class="mb-3">
                <label for="">Modificado</label>
                <input type="date" name="modificado" value="<?php echo isset($usuario) ? $usuario->modificado: null?>">
            </div>
            <div class="mb-3">
                <input type="hidden"     name="iduser"   value="<?php echo isset($usuario) ? $usuario->iduser: null?>">
                <input type="submit" class="btn btn-success" value="Cadastrar">
            </div>
        </form>
    </div>
     <!--Fim do Fomulário-->

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>