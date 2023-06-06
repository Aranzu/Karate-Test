Feature: exigencia de captcha

Scenario: Verificar si se exige captcha para pedir codigo de steam guard
* robot { window: 'Inicio de sesión en Steam', fork: 'C:/Program Files (x86)/Steam/steam.exe', retryCount: 10 }
* click('Ayuda, no puedo iniciar sesión')
* delay(3000)
* windowOptional('Soporte de Steam - Ayuda, no puedo iniciar sesión').click ('No recibo un código de Steam Guard')
* delay(3000)
* windowOptional('Soporte de Steam - Ayuda sobre el código de Steam Guard').click ('Verificar y actualizar mi dirección de email')
* delay(3000)
* input("karaterobot@gmail.com" + Key.ENTER)
* delay(3000)
* screenshot()