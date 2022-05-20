<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require '/home/coexmacompar/public_html/PHPMailer/src/Exception.php';
require '/home/coexmacompar/public_html/PHPMailer/src/PHPMailer.php';
require '/home/coexmacompar/public_html/PHPMailer/src/SMTP.php';
//Load Composer's autoloader
//require 'vendor/autoload.php';

//Create an instance; passing `true` enables exceptions
$mail = new PHPMailer(true);

//ry {
    //Server settings 
    $mail->SMTPDebug = false; //SMTP::DEBUG_SERVER;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;          
    $mail->Username   = 'enviaemail@coexma.com.py';                     //SMTP username
    $mail->Password   = 'coexcoex@22cp';                                //Enable SMTP authentication
    //$mail->Username   = 'diego.martinez@coexma.com.py';                     //SMTP username
    //$mail->Password   = 'coex.m@1998';                               //SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
    $mail->SMTPSecure = 'ssl';   
    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    //$mail->setFrom('enviaemail@coexma.com.py', 'Mailer');
    //$mail->addAddress('diego.martinez@coexma.com.py', 'Diego Martinez');     //Add a recipient
    //$mail->addAddress('capacitcursoscde@gmail.com');               //Name is optional
    //$mail->addReplyTo('jrichardcabrera@gmail.com', 'Information');
    //$mail->addCC('cc@example.com');
    //$mail->addBCC('bcc@example.com');

    //Attachments
    //$mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
    //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

    //Content
 //   $mail->isHTML(true);                                  //Set email format to HTML
 //   $mail->Subject = 'Esto es una prueba';
  //  $mail->Body    = 'Prueba de envio del sitio web';
  //  $mail->AltBody = 'test';

 //   $mail->send();
//    echo 'Message has been sent';
//} catch (Exception $e) {
   // echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
//}