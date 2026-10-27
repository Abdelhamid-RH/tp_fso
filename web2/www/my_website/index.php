<?php

    $first_name = "Abdelhamid";
    $last_name = "RH";
    $program = "Computer science";
    $y = 2026;
    $date = date("d-m-y")

?>



<!DOCTYPE html>
<html>
<head>
    <title>My website</title>
    <link rel="stylesheet" href="my_website/style.css">
</head>

<body>
    <div class="sidebar">
        <h2>Contact me</h2>
        <ul>
            <li> <a href = "https://www.gmail.com"> <img src="/my_website/logo.png" alt = "logo"> Email </a> </li>
            <li> <a href = "https://www.linkedin.com"> <img src = "/my_website/logo.png" alt = "logo"> Linkedin </a> </li>
            <li> <a href = "https://www.github.com"> <img src = "/my_website/logo.png" alt = "logo"> Github </a> </li>
            <li> <a href = "https://www.facebook.com"> <img src = "/my_website/logo.png" alt = "logo"> Facebook </a> </li>
        </ul>
    </div>

    <div class="main">
        <h1>My First Php Page</h1>
        <h3 class ="welcom"> Welcom To My Page</h3>
        <table>
            <tr>
                <td>First name:</td>
                <td class="answer"> <?php echo $first_name ?> </td>
            </tr>

            <tr>
                <td>Last name:</td>
                <td class="answer"><?= $last_name ?></td>
            </tr>

            <tr>
                <td>Program:</td>
                <td class="answer"><?= $program?></td>
            </tr>

            <tr>
                <td>Year:</td>
                <td class="answer"><?= date("Y")?></td>
            </tr>

            <tr>
                <td>Date and time</td>
                <td class="answer"> <?= date("d-m-Y  h:i") ?> </td>
            </tr>
        </table>
        <h3>About me</h3>
        <p class="about">
            I'm a second-year computer science student at the Faculty of Sciences Oujda. I love uncovering the magic of how computers work, how they store,
             process, protect, and transform information at lightning speed to solve real-world problems. As a result, my interests vary, 
            including operating systems, databases, networking and security, web development, and AI.
            </p>
    </div>
</body>

</html>