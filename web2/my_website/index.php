<?php

    $first_name = "Abdelhamid";
    $last_name = "RH";
    $program = "Computer science";
    $year = 2026;
    $date = date("d-m-Y  H:i");

    $student = ["First name:" => $first_name, "Last name:" => $last_name, "Program:" => $program, "Year:" => $year, "Date and time:" => $date];
?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My website</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="sidebar">
        <h2 class="contact">Contact me</h2>
        <ul>
            <li> <a href = "https://www.gmail.com"> <img src="logos/email.png" alt = "logo">          Email   </a> </li>
            <li> <a href = "https://www.linkedin.com"> <img src = "logos/linkedin.png" alt = "logo">  Linkedin  </a> </li>
            <li> <a href = "https://www.github.com"> <img src = "logos/github.png" alt = "logo">      Github    </a> </li>
            <li> <a href = "https://www.facebook.com"> <img src = "logos/facebook.png" alt = "logo">  Facebook  </a> </li>
        </ul>
    </div>

    <div class="main">
        <h1 class="title">My First PHP Page</h1>
        <h3 class ="welcom"> Welcome To My Page</h3>
        <table>
            <?php foreach ($student as $key => $value): ?>

                <tr>
                    <td> <?= $key ?> </td>
                    <td class="answer"> <?= $value ?> </td>
                </tr>

            <?php endforeach ?>
            
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