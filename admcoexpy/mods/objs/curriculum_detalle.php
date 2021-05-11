
<?php
    include_once "mods/server/curriculum.php";

    if ($_SERVER['REQUEST_METHOD'] == "GET") {
		if (isset($_GET['curriculum'])){
            $curriculum = getCurriculum($_GET['curriculum']);
            $experiencia = getExperiencia($_GET['curriculum']);
        } else {
            echo "<script type='text/javascript'>document.location.href='curriculum.php';</script>";
        }
    }	
?>