Feature: Listar todos los tipos de Pokémon

  Scenario: Obtener una lista de todos los tipos de Pokémon
    Given url 'https://beta.pokeapi.co/graphql/v1beta'
    And header Content-Type = 'application/json'
    When text query =
      """
      query {
        pokemon_v2_type {
          name
        }
      }
      """
    When request { query: '#(query)' }
    And method POST
    Then status 200
    * print '\n', response
    And match response.data.pokemon_v2_type[*].name == ["normal","fighting","flying","poison","ground","rock","bug","ghost","steel","fire","water","grass","electric","psychic","ice","dragon","dark","fairy","unknown","shadow"]
    