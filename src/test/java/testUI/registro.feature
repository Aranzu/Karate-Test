@parallel=false
Feature: Registro de usuario
  Comprobar si tras el ingreso de datos validos, se permite el registro de un nuevo usuario

  Scenario: Registro de usuario con datos válidas en chrome
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com/X10'
    * driver.maximize()
    And input('#reg_columna > input[type=text]','karatetest006',100)
    And input('input[name=clavereg]','Casa1234',100)
    And input('input[name=clavereg2]','Casa1234',100)
    And input('input[name=emailreg]','gptest006@outlook.es',100)
    And input('input[name=emailreg2]','gptest006@outlook.es',100)
    And select('#reg_columna > select', '{}Chile')
    And click('#reg_text > span.fuente4 > input[type=checkbox]:nth-child(46)')
    * scroll('#butan')
    * highlight('#butan')
    When click('#butan')
    Then driver.text('#reg_exitoso').contains('El registro se hizo exitosamente, ya puedes descargar subítulos.')
    * delay(5000)
    * def bytes = screenshot(false)
    * def file = karate.write(bytes, 'testRegistro.png')
    * print 'screenshot saved to:', file

  Scenario: Registro de usuario con correo inválido en chrome
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com/X10'
    * driver.maximize()
    And input('#reg_columna > input[type=text]','karatetest7',100)
    And input('input[name=clavereg]','Casa1234',100)
    And input('input[name=clavereg2]','Casa1234',100)
    And input('input[name=emailreg]','acltesting7gmail.com',100)
    And input('input[name=emailreg2]','acltesting7gmail.com',100)
    And select('#reg_columna > select', '{}Chile')
    And click('#reg_text > span.fuente4 > input[type=checkbox]:nth-child(46)')
    * scroll('#butan')
    * delay(5000)
    * highlight('#butan')
    When click('#butan')
    Then driver.text('#reg_detalle').contains('El email no es v�lido')
    * delay(5000)
    * def bytes = screenshot(false)
    * def file = karate.write(bytes, 'testRegistro2.png')
    * print 'screenshot saved to:', file

  Scenario: Registro de usuario con datos de usuario ya registrado
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com/X10'
    * driver.maximize()
    And input('#reg_columna > input[type=text]','karatetest',100)
    And input('input[name=clavereg]','Casa1234',100)
    And input('input[name=clavereg2]','Casa1234',100)
    And input('input[name=emailreg]','gptest01@outlook.es',100)
    And input('input[name=emailreg2]','gptest01@outlook.es',100)
    And select('#reg_columna > select', '{}Chile')
    And click('#reg_text > span.fuente4 > input[type=checkbox]:nth-child(46)')
    * scroll('#butan')
    * highlight('#butan')
    When click('#butan')
    Then driver.text('#reg_detalle').contains('El nick ya est� siendo utilizado')
    * delay(5000)
    * def bytes = screenshot(false)
    * def file = karate.write(bytes, 'testRegistro3.png')
    * print 'screenshot saved to:', file
