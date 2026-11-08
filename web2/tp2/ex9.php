<?php


    $tab = [1,2,3,4,5,6,10,8,9,11,12,13, 14,15];

    $found = 0;
    for ($i = 0; $i < count($tab); $i++)
        {
            if ($tab[$i] == 10)
                {
                    echo "10 was found \n";
                    $found = 1;
                    break;
                }
        }

    if ($found == 0)
        {
            echo "10 was not found \n";
        }
?>