@parallel=false
Feature: Descargar subtitulo
  Comprobar que tras buscar un subtitulo, este permite ser descargado

  Scenario: Buscar subtitulo mandalorian en la web
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.subdivx.com'
    * driver.maximize()
    And input('#buscar2','mandalorian')
    And click('#contenedor_gral > div:nth-child(4) > form > input[type=submit]:nth-child(2)')
    And click('#contenedor_izq > span.result_busc3 > a:nth-child(2)')
    And click('#menu_titulo_buscador > a')
    When click('#detalle_datos > center > h1 > a')
    * delay(5000)
    * def bytes = screenshot(false)
		* def file = karate.write(bytes, 'testDescargar.png')
		* print 'screenshot saved to:', file
