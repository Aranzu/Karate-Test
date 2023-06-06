Feature: Obtener información de un Pokémon mediante una solicitud GET

  Scenario: Consulta a la API de Pokémon para obtener información de un Pokémon mediante una solicitud GET
    Given url 'https://pokeapi.co/api/v2/pokemon'
    And path 'dragonite'
    When method GET
    Then status 200
    And match response.name == 'dragonite'
    And match response.base_experience == 300
    And match response.height == 22
    And match response.weight == 2100
    And match response.types[*].type.name == ["dragon","flying"]