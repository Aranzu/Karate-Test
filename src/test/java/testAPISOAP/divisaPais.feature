@parallel=false
Feature: Lista de divisas

  Background: 
    * url 'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso'

  Scenario: Listar divisa de Argentina
    Given request
      """
			<?xml version="1.0" encoding="utf-8"?>
			<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			  <soap:Body>
			    <CountryCurrency xmlns="http://www.oorsprong.org/websamples.countryinfo">
			      <sCountryISOCode>AR</sCountryISOCode>
			    </CountryCurrency>
			  </soap:Body>
			</soap:Envelope>

      """
    When soap action 'Listar'
    Then status 200
    * print '\n', response
    * match response /Envelope/Body/CountryCurrencyResponse/CountryCurrencyResult/sName == 'Pesos'
    * match response /Envelope/Body/CountryCurrencyResponse/CountryCurrencyResult/sISOCode == 'ARS'

  Scenario: Listar divisa de Venezuela
    Given request
      """
			<?xml version="1.0" encoding="utf-8"?>
			<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			  <soap:Body>
			    <CountryCurrency xmlns="http://www.oorsprong.org/websamples.countryinfo">
			      <sCountryISOCode>VE</sCountryISOCode>
			    </CountryCurrency>
			  </soap:Body>
			</soap:Envelope>

      """
    When soap action 'Listar'
    Then status 200
    * print '\n', response
    * match response /Envelope/Body/CountryCurrencyResponse/CountryCurrencyResult/sName == 'Bolivares'
    * match response /Envelope/Body/CountryCurrencyResponse/CountryCurrencyResult/sISOCode == 'VEB'
