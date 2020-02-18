# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ispindle.destroy_all
BeerSubStep.destroy_all
BeerStep.destroy_all
BrewStep.destroy_all
Brew.destroy_all
Beer.destroy_all
User.destroy_all

d1 = DateTime.new(1980, 6, 22)
myUser = User.create({
  email: "contact@pretabrasser.com",
  password: "pretabrasser",
  username: "Pret a Brasser",
  date_of_birth: d1
})

myBeer = Beer.new({
  name: "Smash 66",
  style: "Smash",
  photo: "https://res.cloudinary.com/dqyudfjjy/image/upload/v1581255960/smash66_i8wa88.jpg",
  volume: 23,
  fermentation: "Mixte",
  initial_density_target: 1066,
  final_density_target: 1012,
  fermentation_temperature_target: 1800,
  color: 8,
  bitterness: 28,
  bitterness_ratio: 047,
  alcohol: 5.4,
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacé. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6Kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15l à 67°c pour le Mash In",'\
          '"rince": "15l à 82°c pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23l"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "nettoyer à l eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-pallier 1H à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles, au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
      '  "2": "Je refroidis mon moût à l’aide d’un serpentin refroidisseur",'\
      '  "3": "Je fais un whirlpool (je crée un tourbillon avec ma spatule dans ma cuve pour concentrer mes particules au centre, cela clarifie la bière)"'\
      '}'\
    '  },'\
    '"Fermentation": {'\
    '  "Etapes": {'\
      '  "1": "Je désinfecte mon fermenteur et petit matériel. Je réhydrate ma levure",'\
      '  "2": "Je transvase ma bière de ma cuve vers mon fermenteur",'\
      '  "3": "5 jours de fermentation primaire à 20°C",'\
      '  "4": "10 jours de fermentation secondaire à 5°C"'\
      '}'\
    '  },'\
    '"Embouteillage": {'\
    '  "Etapes": {'\
      '  "1": "Lavage et désinfection des bouteilles",'\
      '  "2": "Création d’un sirop de sucre avec 7g de sucre/L de moût",'\
      '  "3": "Transvasement de ma cuve de brassage vers une cuve tampon",'\
      '  "4": "Remplissage des bouteilles",'\
      '  "5": "Dégustation deux semaines après"'\
      '}'\
    '  }'\
  '}'\
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

30.times do |i|
  myIspindle = Ispindle.new({
    name: "Ispindel001",
    temperature: rand(16..22),
    density: rand(1034..1086),
    brew_id: myBrew.id
  })
  myIspindle.valid?
  myIspindle.save
  myIspindle.update_attribute :created_at, (i).days.ago
  p "Ispindle001 value :#{i} saved"
end


myBeerStep = BeerStep.new({
   step: 0,
   description:"Préparation de la recette"
 })
 myBeerStep.valid?
 myBeerStep.save!

 myBrewStep = BrewStep.new({
   status: 0,
   brew_id: myBrew.id,
   beer_step_id: 1
 })
myBrewStep.valid?
myBrewStep.save!

p "BrewStep saved"

myBeerSubStep = BeerSubStep.new({
  beer_step_id: myBeerStep.id,
  beer_id: myBeer.id,
  sub_step: '{'\
    '"0": {'\
      '"title": "Matériel dont vous aurez besoin pour cette étape:",'\
      '"content": "Vous aurez besoin de vous munir de votre produit de rinçage. Dans le kit vous est fourni un flacon d\'Oxy. C\'est une solution à base d\'oxygène actif qui va permettre de désinfecter votre matériel qui sera en contact avec le mou afin d\'éviter tout risque d\'infection. Vous aurez également besoin de votre seau de fermentation, d\'un récipient de 7 litre minimum, de votre ispindle, de votre syphon et de votre barboteur.",'\
      '"time": "0"'\
    '},'\
    '"1": {'\
      '"title": "Nettoyage des éléments de brassage",'\
      '"content": "Munissez-vous d\'un seau et remplissez-le d\'eau. Lorsque celui-ci est plein, mélangez votre produit de rinçage dans l\'eau et mélangez bien. Prenez ensuite l\'ensemble des ustensilles que vous avez précédement réuni et plongez-les dans l\'eau. L\'oxygen actif que vous utilisez lors de cette étape de brassage doit agir durant une durée d\'au moins 10 minutes. Pendant que le produit agis, vous pouvez passer à l\'étape suivante.",'\
      '"time": 900'\
    '},'\
    '"2": {'\
      '"title": "Préparation de l\'eau de rinçage",'\
      '"content": "Munissez-vous d\'un seau et placez-y 7l d\'eau. Cette eau devra être portée à une température de 82°c lors de votre rinçage et permettra d\'extraire un maximum de sure du mout.",'\
      '"time": 0'\
    '},'\
    '"3": {'\
      '"title": "Préchauffe de l\'eau de brassage",'\
      '"content": "Préchauffer les 15l d\'eau de brassage dont vous aurez besoin à uen températur de 69°c. La température est légèrement plus chaude que la température cible d\'empatage car le grain va refroidir votre volume d\'eau en y étant mélangé. Pendant que l\'eau chauffe, munissez-vous de votre matériel de brassage dans l\'étape suivante",'\
      '"time": "900"'\
    '},'\
    '"4": {'\
      '"title": "Préparation du matériel de brassage",'\
      '"content": "Pendant que votre eau préchauffe, munissez vous de : Votre grain concassé, votre houblon, votre spatule de brassage et votre sac de brassage.",'\
      '"time": "0"'\
    '}'\
  '}'
})
 p myBeerSubStep.valid?
 myBeerSubStep.save!


myBeer2 = Beer.new({
  name: "Citra I.P.A",
  style: "IPA Américaine",
  photo: "https://res.cloudinary.com/dqyudfjjy/image/upload/v1581156334/biere-au-beurre_mtknsc.jpg",
  volume: 23,
  fermentation: "Mixte",
  initial_density_target: 1046,
  final_density_target: 1002,
  fermentation_temperature_target: 1800,
  color: 8,
  bitterness: 26,
  bitterness_ratio: 047,
  alcohol: 5.4,
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacé. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6Kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15l à 67°c pour le Mash In",'\
          '"rince": "15l à 82°c pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23l"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "nettoyer à l eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-pallier 1H à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles, au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
      '  "2": "Je refroidis mon moût à l’aide d’un serpentin refroidisseur",'\
      '  "3": "Je fais un whirlpool (je crée un tourbillon avec ma spatule dans ma cuve pour concentrer mes particules au centre, cela clarifie la bière)"'\
      '}'\
    '  },'\
    '"Fermentation": {'\
    '  "Etapes": {'\
      '  "1": "Je désinfecte mon fermenteur et petit matériel. Je réhydrate ma levure",'\
      '  "2": "Je transvase ma bière de ma cuve vers mon fermenteur",'\
      '  "3": "5 jours de fermentation primaire à 20°C",'\
      '  "4": "10 jours de fermentation secondaire à 5°C"'\
      '}'\
    '  },'\
    '"Embouteillage": {'\
    '  "Etapes": {'\
      '  "1": "Lavage et désinfection des bouteilles",'\
      '  "2": "Création d’un sirop de sucre avec 7g de sucre/L de moût",'\
      '  "3": "Transvasement de ma cuve de brassage vers une cuve tampon",'\
      '  "4": "Remplissage des bouteilles",'\
      '  "5": "Dégustation deux semaines après"'\
      '}'\
    '  }'\
  '}'\
})

p "Biere sauvegardee IPA" if myBeer2.save

myBeer3 = Beer.new({
  name: "Irish Red Ale",
  style: "Irish",
  photo: "https://res.cloudinary.com/dqyudfjjy/image/upload/v1581156334/biere-rousse_womrq5.jpg",
  volume: 23,
  fermentation: "Mixte",
  initial_density_target: 1066,
  final_density_target: 1012,
  fermentation_temperature_target: 1800,
  color: 14,
  bitterness: 26,
  bitterness_ratio: 047,
  alcohol: 5.4,
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacé. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6Kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15l à 67°c pour le Mash In",'\
          '"rince": "15l à 82°c pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23l"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "nettoyer à l eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-pallier 1H à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles, au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
      '  "2": "Je refroidis mon moût à l’aide d’un serpentin refroidisseur",'\
      '  "3": "Je fais un whirlpool (je crée un tourbillon avec ma spatule dans ma cuve pour concentrer mes particules au centre, cela clarifie la bière)"'\
      '}'\
    '  },'\
    '"Fermentation": {'\
    '  "Etapes": {'\
      '  "1": "Je désinfecte mon fermenteur et petit matériel. Je réhydrate ma levure",'\
      '  "2": "Je transvase ma bière de ma cuve vers mon fermenteur",'\
      '  "3": "5 jours de fermentation primaire à 20°C",'\
      '  "4": "10 jours de fermentation secondaire à 5°C"'\
      '}'\
    '  },'\
    '"Embouteillage": {'\
    '  "Etapes": {'\
      '  "1": "Lavage et désinfection des bouteilles",'\
      '  "2": "Création d’un sirop de sucre avec 7g de sucre/L de moût",'\
      '  "3": "Transvasement de ma cuve de brassage vers une cuve tampon",'\
      '  "4": "Remplissage des bouteilles",'\
      '  "5": "Dégustation deux semaines après"'\
      '}'\
    '  }'\
  '}'\
})

p "Biere sauvegardee Irish" if myBeer3.save

myBeer4 = Beer.new({
  name: "Les Lagers",
  style: "Blonde",
  photo: "https://res.cloudinary.com/dqyudfjjy/image/upload/v1581156334/biere-image_rt3lu7.jpg",
  volume: 23,
  fermentation: "Mixte",
  initial_density_target: 1066,
  final_density_target: 1012,
  fermentation_temperature_target: 1800,
  color: 4,
  bitterness: 26,
  bitterness_ratio: 047,
  alcohol: 5.4,
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacé. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6Kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15l à 67°c pour le Mash In",'\
          '"rince": "15l à 82°c pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23l"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "nettoyer à l eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-pallier 1H à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles, au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
      '  "2": "Je refroidis mon moût à l’aide d’un serpentin refroidisseur",'\
      '  "3": "Je fais un whirlpool (je crée un tourbillon avec ma spatule dans ma cuve pour concentrer mes particules au centre, cela clarifie la bière)"'\
      '}'\
    '  },'\
    '"Fermentation": {'\
    '  "Etapes": {'\
      '  "1": "Je désinfecte mon fermenteur et petit matériel. Je réhydrate ma levure",'\
      '  "2": "Je transvase ma bière de ma cuve vers mon fermenteur",'\
      '  "3": "5 jours de fermentation primaire à 20°C",'\
      '  "4": "10 jours de fermentation secondaire à 5°C"'\
      '}'\
    '  },'\
    '"Embouteillage": {'\
    '  "Etapes": {'\
      '  "1": "Lavage et désinfection des bouteilles",'\
      '  "2": "Création d’un sirop de sucre avec 7g de sucre/L de moût",'\
      '  "3": "Transvasement de ma cuve de brassage vers une cuve tampon",'\
      '  "4": "Remplissage des bouteilles",'\
      '  "5": "Dégustation deux semaines après"'\
      '}'\
    '  }'\
  '}'\
})

p "Biere sauvegardee Blonde" if myBeer4.save

myBeer5 = Beer.new({
  name: "Doppelbock",
  style: "Blonde à très sombre",
  photo: "https://res.cloudinary.com/dqyudfjjy/image/upload/v1581156334/biere-image2_qqdzyx.jpg",
  volume: 23,
  fermentation: "Mixte",
  initial_density_target: 1056,
  final_density_target: 1009,
  fermentation_temperature_target: 1800,
  color: 10,
  bitterness: 26,
  bitterness_ratio: 047,
  alcohol: 5.4,
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacé. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6Kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15l à 67°c pour le Mash In",'\
          '"rince": "15l à 82°c pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23l"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "nettoyer à l eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-pallier 1H à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles, au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
      '  "2": "Je refroidis mon moût à l’aide d’un serpentin refroidisseur",'\
      '  "3": "Je fais un whirlpool (je crée un tourbillon avec ma spatule dans ma cuve pour concentrer mes particules au centre, cela clarifie la bière)"'\
      '}'\
    '  },'\
    '"Fermentation": {'\
    '  "Etapes": {'\
      '  "1": "Je désinfecte mon fermenteur et petit matériel. Je réhydrate ma levure",'\
      '  "2": "Je transvase ma bière de ma cuve vers mon fermenteur",'\
      '  "3": "5 jours de fermentation primaire à 20°C",'\
      '  "4": "10 jours de fermentation secondaire à 5°C"'\
      '}'\
    '  },'\
    '"Embouteillage": {'\
    '  "Etapes": {'\
      '  "1": "Lavage et désinfection des bouteilles",'\
      '  "2": "Création d’un sirop de sucre avec 7g de sucre/L de moût",'\
      '  "3": "Transvasement de ma cuve de brassage vers une cuve tampon",'\
      '  "4": "Remplissage des bouteilles",'\
      '  "5": "Dégustation deux semaines après"'\
      '}'\
    '  }'\
  '}'\
})

p "Biere sauvegardee Blonde sombre" if myBeer5.save

myBeer6 = Beer.new({
  name: "Wheat Beer",
  style: "Allemande",
  photo: "https://res.cloudinary.com/dqyudfjjy/image/upload/v1581156334/blanche_n0tyrw.jpg",
  volume: 23,
  fermentation: "Mixte",
  initial_density_target: 1050,
  final_density_target: 999,
  fermentation_temperature_target: 1800,
  color: 6,
  bitterness: 26,
  bitterness_ratio: 047,
  alcohol: 5.4,
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacé. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6Kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15l à 67°c pour le Mash In",'\
          '"rince": "15l à 82°c pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23l"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "nettoyer à l eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-pallier 1H à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles, au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
      '  "2": "Je refroidis mon moût à l’aide d’un serpentin refroidisseur",'\
      '  "3": "Je fais un whirlpool (je crée un tourbillon avec ma spatule dans ma cuve pour concentrer mes particules au centre, cela clarifie la bière)"'\
      '}'\
    '  },'\
    '"Fermentation": {'\
    '  "Etapes": {'\
      '  "1": "Je désinfecte mon fermenteur et petit matériel. Je réhydrate ma levure",'\
      '  "2": "Je transvase ma bière de ma cuve vers mon fermenteur",'\
      '  "3": "5 jours de fermentation primaire à 20°C",'\
      '  "4": "10 jours de fermentation secondaire à 5°C"'\
      '}'\
    '  },'\
    '"Embouteillage": {'\
    '  "Etapes": {'\
      '  "1": "Lavage et désinfection des bouteilles",'\
      '  "2": "Création d’un sirop de sucre avec 7g de sucre/L de moût",'\
      '  "3": "Transvasement de ma cuve de brassage vers une cuve tampon",'\
      '  "4": "Remplissage des bouteilles",'\
      '  "5": "Dégustation deux semaines après"'\
      '}'\
    '  }'\
  '}'\
})

p "Biere sauvegardee Allemande" if myBeer6.save
