<?php 

    $somme = 0;

    for ($i = 0; $i <= 100; $i++)
    {
        $somme += $i;
    }



    $somme_paire = 0;
    for ($i = 0; $i <= 100; $i++)
    {
        if ($i % 2 == 0)
            {
                $somme_paire += $i;
            }
    }


    $somme_impaire = 0;
    for ($i = 0; $i <= 100; $i++)
    {
        if ($i % 2 != 0)
            {
                $somme_impaire += $i;
            }  
    }


    $mult3 = 0;
    for ($i = 1; $i <= 100; $i++)
    {
        if ($i % 3 == 0)
            {
                $mult3++;
            }  
    }
    
    echo "somme est $somme <br>";
    echo "somme impire est $somme_impaire <br>";
    echo "somme paire est $somme_paire <br>";
    echo " nombre multiple 3 est $mult3 <br>";

?>