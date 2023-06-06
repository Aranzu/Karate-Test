@parallel=false
Feature: Lista de banderas

  Background: 
    * url 'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso'

  Scenario: Listar capital de Argentina
    Given request
      """
			<?xml version="1.0" encoding="utf-8"?>
			<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			  <soap:Body>
			    <CountryFlag xmlns="http://www.oorsprong.org/websamples.countryinfo">
			      <sCountryISOCode>AR</sCountryISOCode>
			    </CountryFlag>
			  </soap:Body>
			</soap:Envelope>

      """
    When soap action 'Listar'
    Then status 200
    * print '\n', response
    * match response /Envelope/Body/CountryFlagResponse/CountryFlagResult == 'http://www.oorsprong.org/WebSamples.CountryInfo/Flags/Argentina.jpg'

  Scenario: Listar capital de Venezuela
    Given request
      """
			<?xml version="1.0" encoding="utf-8"?>
			<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			  <soap:Body>
			    <CountryFlag xmlns="http://www.oorsprong.org/websamples.countryinfo">
			      <sCountryISOCode>VE</sCountryISOCode>
			    </CountryFlag>
			  </soap:Body>
			</soap:Envelope>

      """
    When soap action 'Listar'
    Then status 200
    * print '\n', response
    * match response /Envelope/Body/CountryFlagResponse/CountryFlagResult == 'http://www.oorsprong.org/WebSamples.CountryInfo/Flags/Venezuela.jpg'
