Feature: Consultar información de un Pokémon por ID

  Scenario: Obtener información de un Pokémon por ID, su tipo y habilidades
    Given url 'https://beta.pokeapi.co/graphql/v1beta'
    And header Content-Type = 'application/json'
    When text query =
      """
      query {
        pokemon_v2_pokemon(where: {id: {_eq: 25}}) {
          id
          name
          pokemon_v2_pokemontypes {
            pokemon_v2_type {
              name
            }
          }
          pokemon_v2_pokemonabilities {
            pokemon_v2_ability {
              name
            }
          }
        }
      }
      """
    When request { query: '#(query)' }
    And method POST
    Then status 200
    * print '\n', response
    And match response.data.pokemon_v2_pokemon[0].id == 25
    And match response.data.pokemon_v2_pokemon[0].name == 'pikachu'
    And match response.data.pokemon_v2_pokemon[0].pokemon_v2_pokemontypes[0].pokemon_v2_type.name == 'electric'
    And match response.data.pokemon_v2_pokemon[0].pokemon_v2_pokemonabilities[0].pokemon_v2_ability.name == 'static'