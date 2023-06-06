@parallel=false
Feature: Comentar opinion del subtitulo
  Comprobar que tras ingresar un comentario en el campo correspondiente, se registra efectivamente dicho comentario

  Scenario: Buscar subtitulo mandalorian y comentar opinión
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com/X50'
    * driver.maximize()
    And input('input[name=usuario]','karatetest')
    And input('input[name=clave]','Casa1234')
    And click('input[name=Enviar]')
    * delay(3000)
    And click('#arriba-item > a')
    And input('#buscar2','Alien')
    And click('#contenedor_gral > div:nth-child(4) > form > input[type=submit]:nth-child(2)')
    And click('#menu_titulo_buscador > a')
    * delay(3000)
    And input('#detalle_ficha > a > textarea', 'Muchas gracias')
    * delay(3000)
    When submit().click('#detalle_ficha > a > input[type=submit]:nth-child(11)')
    * driver.refresh()
    Then match driver.text('#detalle_reng_coment2') == 'Muchas gracias'
    * delay(5000)
    * def bytes = screenshot(false)
    * def file = karate.write(bytes, 'testcomentar.png')
    * print 'screenshot saved to:', file
