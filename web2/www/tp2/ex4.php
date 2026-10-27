<?php

    $nom = "Ahmed";
    $age = 21;
    $note1 = 14;
    $note2 = 16;
    $note3 = 12;

    $moy = (($note1 + $note2 + $note3) / 3);
    
    if ($moy >= 10)
        {
            $ad = "admis";
        }
        else{
            $ad = "Ratt";
        }

?>


<html>

<head> </head>

<body>
<h1> <?= "le   nom est $nom"?> <h1/>
<h1> <?= "le   age est $age"?> <h1/>
<h1> <?= "le   moyenne est $moy" ?> <h1/>
<h1> <?= " $ad"?> <h1/> 
</body>

</html>
