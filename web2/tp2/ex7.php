<?php 

    $pass = 1234;
    $value = 000;

    $value = readline("Password :");
   
    while ($value != $pass)
    {

        echo "pass is incorect enter again \n";
        $value = readline("Password :");
        
    }

    echo "pass is correct\n";

?>