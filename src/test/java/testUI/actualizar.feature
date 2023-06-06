@parallel=false
Feature: Actualizar datos
  Comprobar si se permiten actualizar los datos del usuario

  Scenario: Inicio sesión con credenciales válidas desde mi cuenta en edge con refresh y persistencia del login
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com/X14'
    * driver.maximize()
    And input('#micuenta_detalle_log > form > input[type=text]:nth-child(1)','karatetest')
    And input('#micuenta_detalle_log > form > input[type=password]:nth-child(2)','Casa1234')
    And click('#micuenta_detalle_log > form > input[type=submit]:nth-child(8)')
    * clear('#reg_columna > input[type=text]')
    And input('input[name=emailmi]','gptest02@outlook.es')
    And select('#reg_columna > select', '{}Argentina')
    And click('#micuenta_columnax4 > input[type=submit]')
    And driver.text('#micuenta_detalle_log').contains('Las modificaciones se hicieron con éxito')
    * delay(2000)
    * def bytes = screenshot(false)
    * def file = karate.write(bytes, 'testActualizar.png')
    * print 'screenshot saved to:', file
