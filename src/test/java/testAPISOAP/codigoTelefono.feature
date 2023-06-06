@parallel=false
Feature: Lista códigos de teléfono

  Background: 
    * url 'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso'

  Scenario: Listar códigos de teléfono de Venezuela
    Given request
      """
			<?xml version="1.0" encoding="utf-8"?>
			<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			  <soap:Body>
			    <CountryIntPhoneCode xmlns="http://www.oorsprong.org/websamples.countryinfo">
			      <sCountryISOCode>VE</sCountryISOCode>
			    </CountryIntPhoneCode>
			  </soap:Body>
			</soap:Envelope>

      """
    When soap action 'Listar'
    Then status 200
    * print '\n', response
    * match response /Envelope/Body/CountryIntPhoneCodeResponse/CountryIntPhoneCodeResult == '58'
    
  Scenario: Listar códigos de teléfono de Argentina
    Given request
      """
			<?xml version="1.0" encoding="utf-8"?>
			<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			  <soap:Body>
			    <CountryIntPhoneCode xmlns="http://www.oorsprong.org/websamples.countryinfo">
			      <sCountryISOCode>AR</sCountryISOCode>
			    </CountryIntPhoneCode>
			  </soap:Body>
			</soap:Envelope>

      """
    When soap action 'Listar'
    Then status 200
    * print '\n', response
    * match response /Envelope/Body/CountryIntPhoneCodeResponse/CountryIntPhoneCodeResult == '54'