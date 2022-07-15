<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets\css\style.css">
    <title>Curso PHP</title>
</head>

<body>
    <header class="cabecalho">
        <h1>Projetos PHP</h1>
        <h2>Indice dos Exercicios</h2>
    </header>
    <main class="principal">
        <div class="conteudo">
            <nav class="modulos">
                <div class="modulo verde">
                    <h3>Básico</h3>
                    <ul>
                        <li><a href="exercicio.php?dir=basic&file=ola">Olá PHP</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=basic&file=html">Integração HTML</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=basic&file=css">Integração CSS</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=basic&file=comments">Comentários PHP</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=basic&file=challenge">Desafio</a></li>
                    </ul>
                </div>
                <div class="modulo vermelho">
                    <h3>Tipos de dados</h3>
                    <ul>
                        <li><a href="exercicio.php?dir=types&file=int">Inteiro</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=types&file=float">Float</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=types&file=aritmeticas">Operações Aritméticas</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=types&file=challenge_precedence">Desafio Precedência</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=types&file=string">Tipo String</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=types&file=challenge_string">Desafio String</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=types&file=boolean">Booleano</a></li>
                    </ul>
                    <ul>
                        <li><a href="exercicio.php?dir=types&file=conversions">Conversões</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </main>
    <footer class="rodape">
        Iago Ananias Silva © <?= date('Y'); ?>
    </footer>
</body>

</html>