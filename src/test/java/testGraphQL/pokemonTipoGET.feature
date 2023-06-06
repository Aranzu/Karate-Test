Feature: Obtener todos los Pokémon de tipo fuego

  Background:
    * url 'https://pokeapi.co/api/v2'

  Scenario: Obtener lista de todos los Pokémon de tipo fuego
    Given path '/type/fire'
    When method GET
    Then status 200
    * print '\n', response
    And match response.name == 'fire'
    And match response.pokemon[*].pokemon.name contains 'charmander'
    And match response.pokemon[*].pokemon.name contains 'charmeleon'
    And match response.pokemon[*].pokemon.name contains 'charizard'