<div class="titulo">Desafio Sorteio</div>

<?php
$nomes = ["Goku", "Vegeta", "Piccolo", "Gohan"];
$index = array_rand($nomes);
echo "<div center><h1>{$nomes[$index]}</h1></div>"

?>

<style>
    [center] {
        display: flex;
        justify-content: center;
    }
</style>