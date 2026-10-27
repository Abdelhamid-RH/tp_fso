<?php

    $number1 = 12;
    $number2 = 16;

    if ($number1 > $number2)
        {
            $res =  " is greater than ";
        }
    else if ($number1 < $number2)
        {
            $res = " is less than ";
        }
        else
        {
            $res = " is equale to ";
        }
        
?>


<html>

<head> </head>

<body>
<h1> <?= $number1.$res.$number2?> <h1/>    

</body>

</html>