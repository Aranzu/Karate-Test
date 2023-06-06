
Feature: Buscar subtitulo
  Comprobar que tras ingresar en el campo de busqueda la serie mandalorian, arroja como resultado los subtitulos de dicha serie en chrome

  Scenario: Buscar subtitulo mandalorian en la web
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com'
    * driver.maximize()
    And input('#buscar2','mandalorian')
    And click('#contenedor_gral > div:nth-child(4) > form > input[type=submit]:nth-child(2)')
    When click('#contenedor_izq > span.result_busc3 > a:nth-child(2)')
    And match driver.text('#menu_titulo_buscador > a') == 'Subtitulos de The Mandalorian S03E05'
    * delay(2000)
    * def bytes = screenshot(false)
		* def file = karate.write(bytes, 'testBuscar.png')
		* print 'screenshot saved to:', file