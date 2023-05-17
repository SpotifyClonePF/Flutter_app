import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de Privacidad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Política de Privacidad de Dyzr',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '''
Fecha de entrada en vigencia: 17/05/2023

En Dyzr, nos tomamos la privacidad de nuestros usuarios muy en serio. Esta Política de Privacidad describe cómo recopilamos, utilizamos, compartimos y protegemos la información personal de los usuarios de nuestra aplicación. Al utilizar Dyzr, aceptas los términos y condiciones establecidos en esta Política de Privacidad.

Recopilación de Información

Información Personal: Podemos recopilar información personal que proporcionas voluntariamente al registrarte en Dyzr, como tu nombre, dirección de correo electrónico, edad, género y ubicación. Esta información se utiliza para identificarte como usuario y mejorar tu experiencia dentro de la aplicación.

Información de Registro: Recopilamos automáticamente información sobre tu dispositivo, como la dirección IP, tipo de dispositivo, sistema operativo, proveedor de servicios de Internet, y datos de registro. Esta información se utiliza para fines estadísticos y para mejorar la calidad y el rendimiento de Dyzr.

Información de Uso: Podemos recopilar información sobre cómo interactúas con la aplicación, incluyendo las canciones que reproduces, las listas de reproducción que creas, las interacciones sociales y las preferencias de música. Esta información se utiliza para personalizar tu experiencia, ofrecerte recomendaciones relevantes y mejorar nuestros servicios.

Uso de la Información

Mejora de la Experiencia: Utilizamos la información recopilada para mejorar y personalizar tu experiencia dentro de Dyzr. Esto incluye ofrecerte recomendaciones de música, adaptar la interfaz de usuario a tus preferencias y proporcionarte contenido relevante.

Comunicación: Podemos utilizar tu dirección de correo electrónico para enviarte actualizaciones, noticias y promociones relacionadas con Dyzr. Si no deseas recibir estas comunicaciones, puedes optar por no recibirlas en cualquier momento.

Compartir con Terceros: No compartiremos tu información personal con terceros sin tu consentimiento, excepto en los casos en que sea necesario para brindar los servicios solicitados por ti, cumplir con obligaciones legales, proteger nuestros derechos o en casos en que la ley lo requiera.

Seguridad de la Información

Tomamos medidas razonables para proteger la información personal de nuestros usuarios contra acceso no autorizado, divulgación o destrucción. Utilizamos medidas de seguridad técnicas y organizativas para salvaguardar tus datos.

Sin embargo, debes tener en cuenta que ninguna transmisión de datos a través de Internet o almacenamiento en línea puede garantizar una seguridad absoluta. Siempre existe un riesgo inherente asociado con la transmisión de información por Internet.

Cambios en la Política de Privacidad

Nos reservamos el derecho de actualizar y modificar esta Política de Privacidad en cualquier momento. Te recomendamos revisar periódicamente esta Política para estar al tanto de los cambios. El uso continuado de Dyzr después de la publicación de cambios constituirá tu aceptación de dichos cambios.

Contacto

Si tienes preguntas, inquietudes o comentarios sobre nuestra Política de Privacidad, o si deseas acceder, corregir o eliminar tu información personal, puedes contactarnos a través de dyzr_contacto@gmail.com y nos pondremos en contacto contigo lo antes posible.

Esta Política de Privacidad se rige por las leyes del país España y cualquier disputa relacionada con esta Política estará sujeta a la jurisdicción exclusiva de los tribunales de España.

Gracias por confiar en Dyzr y por utilizar nuestra aplicación.
                ''',
              ),
            ],
          ),
        ),
      ),
    );
  }
}