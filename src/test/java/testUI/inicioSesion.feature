@parallel=false
Feature: Inicio de sesión
  Comprobar el inicio exitoso de un usuario. Hay 3 secciones donde se puede iniciar sesión, con resolución de 1920x1080 y limpiando campos

  Scenario: Inicio sesión con credenciales válidas desde login en chrome
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com/X50'
    And driver.dimensions = { x: 0, y: 0, width: 1920, height: 1080 }
    * def dims = driver.dimensions
    And print dims
    And input('#loguearse_user_pass > form > h2:nth-child(1) > input[type=text]:nth-child(1)','karatetest')
    * clear('#loguearse_user_pass > form > h2:nth-child(1) > input[type=text]:nth-child(1)')
    And input('#loguearse_user_pass > form > h2:nth-child(1) > input[type=text]:nth-child(1)','karatetest')
    And input('#loguearse_user_pass > form > h2:nth-child(1) > input[type=password]:nth-child(2)','Casa1234')
    * clear('#loguearse_user_pass > form > h2:nth-child(1) > input[type=password]:nth-child(2)')
    And input('#loguearse_user_pass > form > h2:nth-child(1) > input[type=password]:nth-child(2)','Casa1234')
    When click('#loguearse_user_pass > form > input[type=submit]')
    Then match driver.text('#detalle_ficha') == 'Te has logueado con �xito. Ya puedes continuar disfrutando subdivx.com'
    * delay(5000)
    * def bytes = screenshot(false)
		* def file = karate.write(bytes, 'testlogin1.png')
		* print 'screenshot saved to:', file

  Scenario: Inicio sesión con credenciales válidas desde mi cuenta en edge con refresh y persistencia del login
    * configure driver = { type: 'msedge'}
    Given driver 'https://www.subdivx.com/X14'
    * driver.fullscreen()
    And input('#micuenta_detalle_log > form > input[type=text]:nth-child(1)','karatetest')
    And input('#micuenta_detalle_log > form > input[type=password]:nth-child(2)','Casa1234')
    When click('#micuenta_detalle_log > form > input[type=submit]:nth-child(8)')
    Then match driver.text('#reg_menu_detalle') == 'Panel personal'
    * driver.refresh()
    And match driver.text('#reg_menu_detalle') == 'Panel personal'
    * delay(5000)
    * def bytes = screenshot(false)
		* def file = karate.write(bytes, 'testlogin2.png')
		* print 'screenshot saved to:', file

  Scenario: Inicio sesión con credenciales válidas desde upload en chrome con focus en campos, reload y persistencia del login
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com/index.php?accion=22'
    * driver.maximize()
    * focus('#ultimos_foros > form > span > input[type=text]:nth-child(1)')
    And input('#ultimos_foros > form > span > input[type=text]:nth-child(1)','karatetest')
    * focus('#ultimos_foros > form > span > input[type=password]:nth-child(2)')
    And input('#ultimos_foros > form > span > input[type=password]:nth-child(2)','Casa1234')
    When submit().click('#ultimos_foros > form > span > input[type=submit]:nth-child(8)')
    Then match driver.text('#prog_menu_detalle') == 'Subir Subtítulo'
    * driver.reload()
    And match driver.text('#prog_menu_detalle') == 'Subir Subtítulo'
    * delay(5000)
    * def bytes = screenshot(false)
		* def file = karate.write(bytes, 'testlogin3.png')
		* print 'screenshot saved to:', file
		