# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Beer.destroy_all
myBeer = Beer.new({
  name: "Smash 66",
  style: "Smash",
  volume: 23,
  fermentation: "Mixte",
  initial_density_target: 1.066,
  final_density_target: 1.012,
  fermentation_temperature_target: 18,
  color: 14,
  bitterness: 26,
  bitterness_ratio: 0.47,
  alcohol: 5.4,
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacé. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
  "recipe": {
    "preparation": {
      "ingredients": {
        "cereals": "6Kg de malt Pale Ale",
        "hops": {
          "bitterness": "fuggle 30 grammes à 60 minutes",
          "flavor": "Fuggle 20 grammes à 15 minutes",
          "Dryhop": "Fuggle 40 grammes à 3 jours"
        },
        "water": {
          "preboil": "15l à 67°c pour le Mash In",
          "rince": "15l pour rincer le grain",
          "total": "Volume en fermentation : 23l"
        }
      },
      "nettoyage": {
        "first_step": "nettoyer à l'eau chaude et au produit",
        "second_step": "Rincer avec votre starSan dilué ou votre oxygène actif"
      }
    },
    "brassage": {
      "mashin": {
        "water": "Monter l'eau à temperature..."
      }
    }
  }
})

p myBeer.valid?
myBeer.save
