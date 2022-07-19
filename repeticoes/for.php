<div class="titulo">Laço For</div>

<?php
for($cont = 1; $cont <= 5; $cont++) {
    echo "$cont <br>";
}

echo "<hr>";

/* Podemos utilizar uma variavel contadora já inicializada */
for(; $cont <= 10; $cont++) {
    echo "$cont <br>";
}

echo "<hr>";

/* POdemos utilizar a iteração do contador dentro da estrutura do for */
for(; $cont <= 15; ) {
    echo "$cont <br>";
    $cont++;
}


$array = [
    1 => 'Domingo',
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado'
];

print_r($array);

echo "<hr>";

/* Imprimindo Vetor */
for($i = 1; $i <= count($array); $i++) {
    echo "{$array[$i]} <br>";
}

$matrix = [
    ['a', 'e', 'i', 'o', 'u'],
    ['b', 'c', 'd']
];

echo "<hr>";

/* Imprimindo Matriz */
for($i = 0; $i < count($matrix); $i++) {
    for($j = 0; $j < count($matrix[$i]); $j++) {
        echo "{$matrix[$i][$j]} ";
    }
    echo "<br>";
}
?>