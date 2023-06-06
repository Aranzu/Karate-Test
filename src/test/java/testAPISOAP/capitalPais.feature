@parallel=false
Feature: Lista de capitales

  Background: 
    * url 'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso'

  Scenario: Listar capital de Argentina
    Given request
      """
			<?xml version="1.0" encoding="utf-8"?>
			<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			  <soap:Body>
			    <CapitalCity xmlns="http://www.oorsprong.org/websamples.countryinfo">
			      <sCountryISOCode>AR</sCountryISOCode>
			    </CapitalCity>
			  </soap:Body>
			</soap:Envelope>

      """
    When soap action 'Listar'
    Then status 200
    * print '\n', response
    * match response /Envelope/Body/CapitalCityResponse/CapitalCityResult == 'Buenos Aires'

  Scenario: Listar capital de Venezuela
    Given request
      """
			<?xml version="1.0" encoding="utf-8"?>
			<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			  <soap:Body>
			    <CapitalCity xmlns="http://www.oorsprong.org/websamples.countryinfo">
			      <sCountryISOCode>VE</sCountryISOCode>
			    </CapitalCity>
			  </soap:Body>
			</soap:Envelope>

      """
    When soap action 'Listar'
    Then status 200
    * print '\n', response
    * match response /Envelope/Body/CapitalCityResponse/CapitalCityResult == 'Caracas'
    
    
		# SOAP es un HTTP POST, se tiene que colocar el header manualmente
	  Scenario: Listar capital de Chile
    Given url 'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso'
    When header Content-Type = 'text/xml'
    And request
      """
			<?xml version="1.0" encoding="utf-8"?>
			<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			  <soap:Body>
			    <CapitalCity xmlns="http://www.oorsprong.org/websamples.countryinfo">
			      <sCountryISOCode>CL</sCountryISOCode>
			    </CapitalCity>
			  </soap:Body>
			</soap:Envelope>

      """
    # Usamos 'method' en lugar de 'soap action'
    And method POST
    * print '\n', response
    And match response /Envelope/Body/CapitalCityResponse/CapitalCityResult == 'Santiago'
    Then status 200