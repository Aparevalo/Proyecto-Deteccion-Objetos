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
    $mail->setFrom('and_are100@hotmail.es', 'Tu Nombre');
    $mail->addAddress('ap761324@gmail.com', 'Anthonela');

    $mail->Subject = 'Eres puta';
    $mail->Body    = 'Mñana trabajas en el extasis';

    $mail->send();
    echo 'El correo ha sido enviado correctamente';
} catch (Exception $e) {
    echo "Error al enviar el correo: {$mail->ErrorInfo}";
}
?>
