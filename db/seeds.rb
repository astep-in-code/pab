# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Beer.destroy_all
Brew.destroy_all
User.destroy_all
BeerStep.destroy_all
Ispindle.destroy_all

d1 = DateTime.new(1980, 6, 22)
myUser = User.create({
  email: "contact@pretabrasser.com",
  password: "pretabrasser",
  username: "Pret a Brasser",
  date_of_birth: d1
})

# recipe = {
#   "preparation": [{
#     "ingredients": {
#       "cereals": "6Kg de malt Pale Ale",
#       "hops": {
#         "bitterness": "fuggle 30 grammes à 60 minutes",
#         "flavor": "Fuggle 20 grammes à 15 minutes",
#         "Dryhop": "Fuggle 40 grammes à 3 jours"
#       },
#       "water": {
#         "preboil": "15l à 67c pour le Mash In",
#         "rince": "15l à 82c pour rincer le grain",
#         "total": "Volume en fermentation  23l"
#       }
#     },
#     "nettoyage": {
#       "first_step": "ettoyer à l'eau chaude et auproduit",
#       "second_step": "Rincer avec votre starSan dilué ou votre oxygène actif"
#     }
#   }],
#   "brassage": [{
#     "mashin": {
#       "water": "Monter l'eau à temperature"
#     }
#   }]
# }
recipe = {preparation: "test", brassage: "test"}
myBeer = Beer.new({
  name: "Smash 66",
  style: "Smash",
  photo: "https://res.cloudinary.com/dqyudfjjy/image/upload/v1581156334/biere-au-beurre_mtknsc.jpg",
  volume: 23,
  fermentation: "Mixte",
  initial_density_target: 1.066,
  final_density_target: 1.012,
  fermentation_temperature_target: 1800,
  color: 14,
  bitterness: 26,
  bitterness_ratio: 0.47,
  alcohol: 5.4,
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacé. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
  recipe: "test"
})

p "Biere sauvegardee" if myBeer.save

myBrew = Brew.new({
  beer_id: myBeer.id,
  user_id: myUser.id
})
p myBrew.valid?
p myUser.id
p myBeer.id
# p myBrew.valid?
p "My Brew saved" if myBrew.save!

10.times do |i|
  myIspindle = Ispindle.new({
    name: "Ispindel001",
    temperature: rand(1700..1900),
    density: rand(1008..1054),
    brew_id: 1
  })
  myIspindle.valid?
  myIspindle.save
  p "Ispindle001 value :#{i} saved"
end

# myBeerStep = BeerStep.new({
#   step: 0,
#   description:"Préparation de la recette"
# })
#  # p "Ibug here ?"
# myBeerStep.valid?
# myBeerStep.save!

# myBeerSubStep = BeerSubStep.new({
#   id_beer_steps: myBeerStep.id,
#   id_beer: myBeer.id,
#   substep: {
#     "0": {
#       "title": "Matériel dont vous aurez besoin pour cette étape:",
#       "content": "Vous aurez besoin de vous munir de votre produit de rinçage. Dans le kit vous est fourni un flacon d'Oxy. C'est une solution à base d'oxygène actif qui va permettre de désinfecter votre matériel qui sera en contact avec le mou afin d'éviter tout risque d'infection. Vous aurez également besoin de votre seau de fermentation, d'un récipient de 7 litre minimum, de votre ispindle, de votre syphon et de votre barboteur.",
#       "time": "0"
#     },
#     "1": {
#       "title": "Nettoyage des éléments de brassage",
#       "content": "Munissez-vous d'un seau et remplissez-le d'eau. Lorsque celui-ci est plein, mélangez votre produit de rinçage dans l'eau et mélangez bien. Prenez ensuite l'ensemble des ustensilles que vous avez précédement réuni et plongez-les dans l'eau. L'oxygen actif que vous utilisez lors de cette étape de brassage doit agir durant une durée d'au moins 10 minutes. Pendant que le produit agis, vous pouvez passer à l'étape suivante.",
#       "time": 900
#     },
#     "2": {
#       "title": "Préparation de l'eau de rinçage",
#       "content": "Munissez-vous d'un seau et placez-y 7l d'eau. Cette eau devra être portée à une température de 82°c lors de votre rinçage et permettra d'extraire un maximum de sure du mout.",
#       "time": 0
#     },
#     "3": {
#       "title": "Préchauffe de l'eau de brassage",
#       "content": "Préchauffer les 15l d'eau de brassage dont vous aurez besoin à uen températur de 69°c. La température est légèrement plus chaude que la température cible d'empatage car le grain va refroidir votre volume d'eau en y étant mélangé. Pendant que l'eau chauffe, munissez-vous de votre matériel de brassage dans l'étape suivante",
#       "time": "900"
#     },
#     "4": {
#       "title": "Préparation du matériel de brassage",
#       "content": "Pendant que votre eau préchauffe, munissez vous de : Votre grain concassé, votre houblon, votre spatule de brassage et votre sac de brassage."
#     }
#   }
# })
#  p myBeerSubStep.valid?
#  myBeerSubStep.save!

# myBrewStep = BrewStep.new({
#   status: 0,
#   brew_id: Brew.last,
#   beer_step_id: 1
# })

# p myBrewStep.valid?

# myBeerStep = BeerStep.new({
#   step: 0,
#   description:"Préparation de la recette"
# })

# myBeerStep.valid?

# myBeerSubStep = BeerSubStep.new({
#   id_beer_steps: 0,
#   id_beer: Beer.last,
#   substep: {
#     "0": {
#       "title": "Matériel dont vous aurez besoin pour cette étape:",
#       "content": "Vous aurez besoin de vous munir de votre produit de rinçage. Dans le kit vous est fourni un flacon d'Oxy. C'est une solution à base d'oxygène actif qui va permettre de désinfecter votre matériel qui sera en contact avec le mou afin d'éviter tout risque d'infection. Vous aurez également besoin de votre seau de fermentation, d'un récipient de 7 litre minimum, de votre ispindle, de votre syphon et de votre barboteur.",
#       "time": "0"
#     },
#     "1": {
#       "title": "Nettoyage des éléments de brassage",
#       "content": "Munissez-vous d'un seau et remplissez-le d'eau. Lorsque celui-ci est plein, mélangez votre produit de rinçage dans l'eau et mélangez bien. Prenez ensuite l'ensemble des ustensilles que vous avez précédement réuni et plongez-les dans l'eau. L'oxygen actif que vous utilisez lors de cette étape de brassage doit agir durant une durée d'au moins 10 minutes. Pendant que le produit agis, vous pouvez passer à l'étape suivante.",
#       "time": 900
#     },
#     "2": {
#       "title": "Préparation de l'eau de rinçage",
#       "content": "Munissez-vous d'un seau et placez-y 7l d'eau. Cette eau devra être portée à une température de 82°c lors de votre rinçage et permettra d'extraire un maximum de sure du mout.",
#       "time": 0
#     },
#     "3": {
#       "title": "Préchauffe de l'eau de brassage",
#       "content": "Préchauffer les 15l d'eau de brassage dont vous aurez besoin à uen températur de 69°c. La température est légèrement plus chaude que la température cible d'empatage car le grain va refroidir votre volume d'eau en y étant mélangé. Pendant que l'eau chauffe, munissez-vous de votre matériel de brassage dans l'étape suivante",
#       "time": "900"
#     },
#     "4": {
#       "title": "Préparation du matériel de brassage",
#       "content": "Pendant que votre eau préchauffe, munissez vous de : Votre grain concassé, votre houblon, votre spatule de brassage et votre sac de brassage."
#     }
#   }
# })
#  p myBeerSubStep.valid?
