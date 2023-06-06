@parallel=false
Feature: Recuperación de contraseña
  Comprobar si tras el ingreso de un correo registrado, se permite la recuperacion de la contraseña

  Scenario: Recuperar la contraseña mediante ingreso de correo en chrome
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com/X17'
    * driver.maximize()
    And input('input[name=nickol]','gptest01@outlook.es')
    * delay(1000)
    When click('#detalle_ficha > form > input[type=submit]:nth-child(9)')
    * delay(1000)
    Then match driver.text('#menu_detalle') == '¿Te olvidaste tu clave?'
    * delay(5000)
    * def bytes = screenshot(false)
		* def file = karate.write(bytes, 'testRecuperar.png')
		* print 'screenshot saved to:', file

  Scenario: Revisar bandeja de entrada para comprobar recuperación
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://login.live.com/login.srf?wa=wsignin1.0&ct=1365632258&rver=6.1.6206.0&sa=1&ntprob=-1&wp=MBI_SSL_SHARED&wreply=https:%2F%2Fmail.live.com%2F%3Fowa%3D1%26owasuffix%3Dowa%252f&id=64855&snsc=1&cbcxt=mail'
    * driver.maximize()
    And input('input[name=loginfmt]','gptest01@outlook.es', 100)
    And click('#idSIButton9')
    * delay(1000)
    And input('input[name=passwd]','hjsaAS324', 100)
    And click('#idSIButton9')
    When click('#idBtn_Back')
    * delay(10000)
    * def bytes = screenshot(false)
		* def file = karate.write(bytes, 'testBandeja.png')
		* print 'screenshot saved to:', file