<?php 
   $nombre = 1;
?>



<!DOCTYPE html>
<html>
<head>
    <title>My website</title>
</head>

<body>
    <ul>
        <?php for ($j = 1; $j <=10 ;$j++): ?>
        <?php for ($i = 1; $i <= 10; $i++): ?>

        
            <li> <?= $j?> x <?= $i?> = <?= $i * $j ?> </li>
        <?php endfor ?>
        <br> <br>
        <?php endfor ?>
    </ul>
</body>
</html>