<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../../PHPMailer\PHPMailer.php';
require '../../PHPMailer\SMTP.php';
require '../../PHPMailer\Exception.php';

$mail = new PHPMailer(true);

try {
    // Configuración del servidor SMTP de Outlook
    $mail->isSMTP();
    $mail->Host       = 'smtp-mail.outlook.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'and_are100@hotmail.es'; // Tu dirección de correo de Outlook/Hotmail
    $mail->Password   = 'aas2010A/';          // Tu contraseña de correo
    $mail->SMTPSecure = 'tls';
    $mail->Port       = 587;

    // Resto de la configuración del correo
    $mail->setFrom('and_are100@hotmail.es', 'Tu Nombre');//No tocar
    $mail->addAddress('and.are100@gmail.com', 'Anderson');//Su correo y el nombre

    $mail->Subject = 'Prueba Api';//Asunto
    $mail->Body    = 'Prueba Exitosa';//Contenido

    $mail->send();
    echo 'El correo ha sido enviado correctamente';
} catch (Exception $e) {
    echo "Error al enviar el correo: {$mail->ErrorInfo}";
}
?>
