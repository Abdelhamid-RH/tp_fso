<?php

    $note = 77;

    if($note >= 90 && $note <= 100)
    {
        $res = "A";
    }
    else if ($note >= 80)
    {
        $res = "B";
    }
    else if (($note >= 70))
    {
        $res = "C";
    }
    else if ($note >= 60)
    {
        $res = "D";
    }
    else
    {
        $res = "F";
    }
    
?>


<html>

<head> </head>

<body>
<h1> <?= "$note : $res"?> <h1/>    

</body>

</html>
