<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content= "width=device-width, initial-scale=1.0">
        <title>Envoyer un mail</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="hero">
            <nav>
                <ul>
                    <li><a href="index.html">Accueil</a></li>
                    <li><a href="projets.html">Mes projets</a></li>
                    <li><a href="etudes.html">Mes études</a></li>
                    <li><a href="contacter.html">Me contacter</a></li>
                </ul>
            </nav>
            <div class="contact">
                <div class="formulaireContact">
                    <h1>Me contacter</h1>
                    <form method="post">
                        <label>Email</label>
                        <input type="email" name="email" required>
                        <label>Sujet</label>
                        <input type="text" name="sujet" required>
                        <textarea name="message" required></textarea>
                        <input type="submit" value="Envoyer le message">
                    </form>
                </div>
            
            <?php
            if (isset($_POST["message"])){
                $retour=mail("yanis.merciertallet@gmail.com",$_POST["sujet"]." de ".$_POST["email"],$_POST["message"],"Reply-to:".$_POST["email"]);
                if ($retour){
                    echo "<p>Bien envoyé</p>";
                }                           
            }
            ?>
            </div>
            <div class="images">
                <img src="portfolio/RESSOURCE/IMAGES/shape.png" class="shape">
                <img src="portfolio/RESSOURCE/IMAGES/photoYanis.png" class="boy">
            </div>
        </div>
    </body>
</html>


