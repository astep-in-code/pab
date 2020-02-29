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
  final_density_target: 1010,
  fermentation_temperature_target: 2000,
  color: 8,
  bitterness: 28,
  bitterness_ratio: 047,
  alcohol: 5.4,
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des arômes boisés, épicés voire herbacés. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites-la évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6Kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "Fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15L à 67°C pour le Mash In",'\
          '"rince": "15L à 82°C pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23L"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "Nettoyer à l\'eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-palier 1h à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles. Au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
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
myBeer.update_attribute :created_at, (4).days.ago


myBrew = Brew.new({
  beer_id: myBeer.id,
  user_id: myUser.id
})

p myBrew.valid?
p myUser.id
p myBeer.id
# p myBrew.valid?
p "My Brew saved" if myBrew.save!

# 30.times do |i|
#   myIspindle = Ispindle.new({
#     name: "Ispindel001",
#     temperature: rand(16..22),
#     density: rand(1034..1086),
#     brew_id: myBrew.id
#   })
#   myIspindle.valid?
#   myIspindle.save
#   myIspindle.update_attribute :created_at, (i).days.ago
#   p "Ispindle001 value :#{i} saved"
# end

# Beer Step
myBeerStep = BeerStep.new({
   step: 0,
   description:"Préparation de la recette"
 })
 myBeerStep.valid?
 myBeerStep.save!

myBeerStep = BeerStep.new({
   step: 1,
   description:"La cuisine: L'empâtage & Ebullition"
 })
 myBeerStep.valid?
 myBeerStep.save!

myBeerStep = BeerStep.new({
   step: 2,
   description:"Fermentation primaire"
 })
 myBeerStep.valid?
 myBeerStep.save!

myBeerStep = BeerStep.new({
   step: 3,
   description:"Fermentation secondaire"
 })
 myBeerStep.valid?
 myBeerStep.save!

myBeerStep = BeerStep.new({
   step: 4,
   description:"Embouteillage"
 })
 myBeerStep.valid?
 myBeerStep.save!

p "5 BeerStep saved"


# Brew Step
myBrewStep = BrewStep.new({
   status: 0,
   brew_id: myBrew.id,
   beer_step_id: 1
 })
myBrewStep.valid?
myBrewStep.save!

p "BrewStep saved"

myBeerSubStep = BeerSubStep.new({
  beer_step_id: 1,
  beer_id: 1,
  sub_step: '{'\
    '"0": {'\
      '"title": "Matériel dont vous aurez besoin pour cette étape:",'\
      '"content": "Vous aurez besoin de vous munir de votre produit de rinçage. Dans le kit vous est fourni un flacon d\'Oxy. C\'est une solution à base d\'oxygène actif qui va permettre de désinfecter votre matériel qui sera en contact avec le moût afin d\'éviter tout risque d\'infection. Vous aurez également besoin de votre seau de fermentation, d\'un récipient de 7 litres minimum, de votre ispindle, de votre syphon et de votre barboteur.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582383761/Step_1_-_Substep_0-_xckvw7.jpg",'\
      '"time": "0"'\
    '},'\
    '"1": {'\
      '"title": "Nettoyage des éléments de brassage",'\
      '"content": "Munissez-vous d\'un seau et remplissez-le d\'eau. Lorsque celui-ci est plein, mélangez votre produit de rinçage dans l\'eau et mélangez bien. Prenez ensuite l\'ensemble des ustensiles que vous avez précédement réunis et plongez-les dans l\'eau. L\'oxygène actif que vous utilisez lors de cette étape de brassage doit agir durant une durée d\'au moins 10 minutes. Pendant que le produit agit, vous pouvez passer à l\'étape suivante.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582383845/Step_1_-_Substep_1_hhecjh.jpg",'\
      '"time": 900'\
    '},'\
    '"2": {'\
      '"title": "Préparation de l\'eau de rinçage",'\
      '"content": "Munissez-vous d\'un seau et placez-y 7L d\'eau. Cette eau devra être portée à une température de 82°C lors de votre rinçage et permettra d\'extraire un maximum de sucre du moût.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582383906/Step_1_-_Substep_2_gbi3c4.jpg",'\
      '"time": 0'\
    '},'\
    '"3": {'\
      '"title": "Préchauffe de l\'eau de brassage",'\
      '"content": "Préchauffer les 15L d\'eau de brassage dont vous aurez besoin à une température de 69°C. La température est légèrement plus chaude que la température cible d\'empâtage car le grain va refroidir votre volume d\'eau en y étant mélangé. Pendant que l\'eau chauffe, munissez-vous de votre matériel de brassage dans l\'étape suivante",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582383913/Step_1_-_Substep_3_fq7xrd.jpg",'\
      '"time": "900"'\
    '},'\
    '"4": {'\
      '"title": "Préparation du matériel de brassage",'\
      '"content": "Pendant que votre eau préchauffe, munissez-vous de : votre grain concassé, votre houblon, votre spatule de brassage et votre sac de brassage.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582383919/Step_1_-_Substep_4_p2ufju.jpg",'\
      '"time": "0"'\
    '}'\
  '}'
})
 p myBeerSubStep.valid?
 myBeerSubStep.save!

myBeerSubStep = BeerSubStep.new({
  beer_step_id: 2,
  beer_id: 1,
  sub_step: '{'\
    '"5": {'\
      '"title": "Concasser les grains:",'\
      '"content": "Pour cette étape vous aurez besoin de vous munir d\'un grinder pour pouvoir concasser les grains afin d\'obtenir un ensemble homogène. La pâte obtenue doit être lisse comme de la peau de bébé et dégage une odeur houbloneuse caractéristique.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582386890/Step_2_-_Substep_0_cvjcxa.jpg",'\
      '"time": "0"'\
    '},'\
    '"6": {'\
      '"title": "Gestion des paliers",'\
      '"content": "Saisissez la cuve et versez la préparation concassé dedans puis compléter avec un volume de 17L d\'eau puis portez l\'ensemble à une température de 50°C pendant une minute (gardez les yeux sur le thermomètre et sur le chronomètre). Cela va permettre d\'atteindre ce que les scientifiques appellent le palier protéinique. Au terme de cette minute, portez l\'ensemble à une température de 66°C pendant 40 minutes pour atteindre le 2e palier qui n\'est que le début d\'une longue étape. Cette étape est dite palier de saccharificcation. Une fois ce palier franchi, portez enfin le mélange à 76°C pendant 10 minutes pour lancer la désactivation des enzymes.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582387970/Step_2_-_Substep_1_jyhsab.jpg",'\
      '"time": "3060"'\
    '},'\
    '"7": {'\
      '"title": "Rinçage",'\
      '"content": "A l\'issue de la désactivation des enzymes, filtrer et rincer les drèches (ce qui ressemble donc à du grain mouillé) avec 17,3L d\'eau portée à une température de 75°C.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582388453/Step_2_-_Substep_2_v8hgub.jpg",'\
      '"time": "0"'\
    '},'\
    '"8": {'\
      '"title": "Ebullition",'\
      '"content": "Une fois le rinçage terminé, vous allez maintenant devoir porter le moût à ébullition. Le volume d\'ébullition est de 25.8L  et la densité avant ébullition doit être de 1.052. Une fois le moût en ébullition, ajouter 30g de Fuggle puis lancer un compte à rebours à 40 min. Une fois cette période terminée, éteignez la source de chaleur puis ajoutez 20g de Fuggle au mélange et lancez un minuteur à 15 minutes. A l\'issue de celui-ci, vous devez désormais mettre le moût à refroidir.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582659344/Step_2_-_Substep_3_ycbwra.jpg",'\
      '"time": "2700"'\
    '}'\
  '}'
})
 p myBeerSubStep.valid?
 myBeerSubStep.save!

myBeerSubStep = BeerSubStep.new({
  beer_step_id: 3,
  beer_id: 1,
  sub_step: '{'\
    '"9": {'\
      '"title": "La multiplication cellulaire:",'\
      '"content": "Le moût en sortie de salle de brassage va être refroidit et aéré. En présence d’oxygène présente dans l’air, les levures, ajoutées, vont se multiplier. Chaque levure possède des caractéristiques propres, comme la formation d’esters totaux ou la consommation de sucres résiduels,… Le choix de la levure est donc un élément important de la qualité finale de votre bière.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582660323/Step_3_-_Substep_0_ui1xux.jpg",'\
      '"time": "0"'\
    '},'\
    '"10": {'\
      '"title": "La fermentation",'\
      '"content": "Une fois l’oxygène consommée, la levure va entrer en fermentation. Lors de cette étape les sucres vont être transformés en alcool mais aussi en CO2 et en chaleur. C’est lors de cette étape également que se développe certains arômes complémentaires comme les esters. La bière « verte » à cette étape va commencer à se saturer en CO2, néanmoins selon la température de fermentation cette saturation peut être limitée. Le CO2 échappé lors de cette étape pourra être récupéré pour être réinjecté lors de l’étape de filtration de la bière. La température pour la SmaSH 66 doit être de 19°C en fermentation. La durée est de 4 jours plein.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582660656/Step_3_-_Substep_1_uzroap.jpg",'\
      '"time": 0'\
    '},'\
    '"11": {'\
      '"title": "La préparation",'\
      '"content": "Remplir modérément le barboteur avec de l\'eau et du chemipro ou bien avec un alcool fort et placer le petit capuchon rouge dessus (ce n\'est pas un bouchon hermétique).",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582661028/Step_3_-_Substep_2_lwxtjy.jpg",'\
      '"time": 0'\
    '},'\
    '"12": {'\
      '"title": "La phase d\'adaptation (ou de respiration)",'\
      '"content": "Pendant les premières heures (cela peut durer jusqu’à 24h si la dose de levure est trop faible ou bien que la levure n’est pas très en forme) qui suivent l\'inoculation du moût par la levure, la présence d\'oxygène permet la multiplication cellulaire des levures, l\'oxygénation du moût, la santé et le type de levure ainsi que la température sont des facteurs cinétiques importants. Il s\'agit de la phase de respiration et de multiplication des levures en aérobie (présence d’oxygène).",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582664226/Step_3_-_Substep_3_h9tq3i.jpg",'\
      '"time": 0'\
    '}'\
  '}'
})
 p myBeerSubStep.valid?
 myBeerSubStep.save!

myBeerSubStep = BeerSubStep.new({
  beer_step_id: 4,
  beer_id: 1,
  sub_step: '{'\
    '"13": {'\
      '"title": "Le Cold Crash",'\
      '"content": "Lors des derniers jours avant embouteillage il est intéressant de conserver la bière à très basse température (minimum 2°C), si l\'on dispose de telles conditions, afin de faire sédimenter le maximum de levures et résidus comme le houblon d’un dry hopping par exemple. Cette opération peut se faire rapidement au réfrigérateur ou en prenant un peu plus de temps dans un endroit froid (cave, garage, igloo...). La fermentation secondaire peut prendre entre deux semaines et un mois, c\'est une étape à ne pas négliger qui permet de finir tranquillement la fermentation de la bière.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582664850/Step_4_-_Substep_1_hszpbv.jpg",'\
      '"time": "0"'\
    '},'\
    '"14": {'\
      '"title": "La maturation (ou garde)",'\
      '"content": "Cette étape appelée aussi maturation, va permettre de stabiliser la bière à basse température et parfaire le développement d’arômes. Cette étape se réalisant à des températures proche de 0°C va également permettre de saturer plus facilement la bière en CO2 à partir des sucres restant à fermenter, de favoriser le dépôt de levures et la précipitation après condensation à froid des protéines. A cette étape, vous pouvez faire le choix de rajouter du houblon à froid pour rajouter une touche florale à la bière que vous obtiendrez en fin de brassage",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582665110/Step_4_-_Substep_2_mny5bk.jpg",'\
      '"time": 0'\
    '}'\
  '}'
})
 p myBeerSubStep.valid?
 myBeerSubStep.save!

myBeerSubStep = BeerSubStep.new({
  beer_step_id: 5,
  beer_id: 1,
  sub_step: '{'\
    '"15": {'\
      '"title": "Soutirez votre bière:",'\
      '"content": "Préparez le bac de désinfectant, puis plongez-y tout le matériel ci-dessus. Tout doit être désinfecté ! Sortez le fermenteur du réfrigérateur. A l’aide de l’auto-siphon, transférez la bière dans la casserole (ou un seau d’embouteillage) et une partie dans l’éprouvette pour réaliser la mesure de densité finale. Ne prélevez pas le dépôt au fond de votre fermenteur. Couvrez la casserole/seau d’embouteillage avec le couvercle désinfecté lorsque le soutirage est terminé. Munissez-vous de votre densimètre pour mesurer la densité finale de votre bière et pouvoir ainsi déterminer la teneur en alcool, qui doit tourner autour de 1.020 – 1.010",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582665913/Step_5_-_Substep_0_heu20f.jpg",'\
      '"time": "0"'\
    '},'\
    '"16": {'\
      '"title": "Le sucrage",'\
      '"content": "A ce stade votre bière ne contient pas de bulles, vous allez devoir la carbonater (saturer en CO2) grâce à un ajout de sucre, juste avant d’embouteiller votre bière. Pour cela, préparez un sirop en faisant dissoudre dans 25 à 50 cL d’eau l’équivalent de 7g de sucre par litre de bière. Attention à ne pas surdoser le sucre car au-delà de 8 g par litre, la pression dans la bouteille sera trop forte et la bière risque de surmousser, parfois violemment. Faites bouillir une petite quantité d’eau (30 cl par exemple) pendant quelques minutes. Laissez refroidir. Incorporez le sucre aux alentours de 80 à 70°C. Laissez refroidir le sirop de sucre jusqu’à 25°C. Retirez le couvercle de votre casserole, ajoutez le sirop à la bière et remuez légèrement à l’aide de la spatule, afin que la répartition se fasse de manière uniforme.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582666589/Step_5_-_Substep_1_yshpk9.jpg",'\
      '"time": 0'\
    '},'\
    '"17": {'\
      '"title": "La mise en bouteille",'\
      '"content": "Avant d’effectuer la mise en bouteille, désinfectez l’auto-siphon, le tuyau, la tige d’embouteillage, les bouteilles et les capsules. Assurez-vous que vos bouteilles sont bien propres. Si ce n’est pas le cas, vous devrez les nettoyer à l’aide du goupillon pour éliminer toutes les impuretés. Puis plongez chacune de vos bouteilles dans la solution désinfectante, remplissez-les, agitez-les, laissez agir et videz-les. Transvasez ensuite la bière à l’aide de l’auto-siphon et de la tige d’embouteillage reliés par le tuyau à l’auto-siphon.",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582666717/Step_5_-_Substep_2_ovqoja.jpg",'\
      '"time": 0'\
    '},'\
    '"18": {'\
      '"title": "La refermentation",'\
      '"content": "Scellez vos bouteilles et laissez-les reposer pendant un minimum de 2 semaines dans un endroit sombre et tempéré (20-22°C). Lors de la re-fermentation vous verrez un léger dépôt de lie (levures mortes) dans le fond de la bouteille. Après une attente interminable, placez vos bières au frais et c\'est parti pour des dégustations d\'exception, parce que oui, c\'est toujours meilleur lorsque c\'est fait-maison... Enfin, c\'est ce qu\'on dit. ",'\
      '"photo": "https://res.cloudinary.com/dqyudfjjy/image/upload/v1582666806/Step_5_-_Substep_4_javs0i.png",'\
      '"time": "0"'\
    '}'\
  '}'
})
 p myBeerSubStep.valid?
 myBeerSubStep.save!

p "5 x 5 Beer SubSteps"

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
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacés. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites-la évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "Fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15L à 67°C pour le Mash In",'\
          '"rince": "15L à 82°C pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23L"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "nettoyer à l\'eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-palier 1h à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles. Au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
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
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacés. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites-la évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "Fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15L à 67°C pour le Mash In",'\
          '"rince": "15L à 82°C pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23L"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "nettoyer à l\'eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-palier 1h à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles. Au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
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
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voire herbacés. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
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
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-palier 1h à 66°C",'\
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
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voir herbacés. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites-la évoluer en fonction de vos envies.",
  recipe: '{'\
    '"preparation": {'\
    '  "ingredients": {'\
      '  "cereals": {'\
        '  "cereals": "6kg de malt Pale Ale"'\
        '  },'\
      '  "hops": {'\
        '  "bitterness": "Fuggle 30 grammes à 60 minutes",'\
          '"flavor": "Fuggle 20 grammes à 15 minutes",'\
          '"Dryhop": "Fuggle 40 grammes à 3 jours"'\
      '  },'\
        '"water": {'\
        '  "preboil": "15L à 67°C pour le Mash In",'\
          '"rince": "15L à 82°C pour rincer le grain",'\
        '  "total": "Volume en fermentation \: 23L"'\
        '}'\
    '  },'\
      '"nettoyage": {'\
        '"1": "nettoyer à l\'eau chaude et au produit",'\
        '"2": "Rincer avec votre starSan dilué ou votre oxygène actif"'\
      '}'\
    '},'\
    '"Empâtage": {'\
    '  "Etapes": {'\
      '  "1": "Je monte 18L d’eau à 72°C dans ma cuve puis je verse mon malt",'\
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-palier 1h à 66°C",'\
      '  "3": "Je chauffe 12L d’eau à 78°C dans une autre marmite",'\
      '  "4": "Une fois l’heure écoulée, je soulève mon sac de brassage, pose une grille et égoutte mon sac sur la cuve",'\
      '  "5": "Je rince ensuite mon sac toujours sur ma cuve avec mes 12L d’eau de rinçage à 78°C",'\
      '  "6": "Je retire mon sac puis je mets à ébullition"'\
      '}'\
    '  },'\
    '"Ebullition": {'\
    '  "Etapes": {'\
      '  "1": "Dès ébullition je mets 30g de houblon Fuggles. Au bout de 40 minutes je coupe le feu et j’insère 20g de houblon dans la cuve",'\
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
  description: "Cette bière est la bière parfaite pour effectuer son premier brassin. Il s’agit d’un SmaSH : Single Malt and Single Hop. Seul un type de malt et un type de houblon sont utilisés pour faire cette recette. La simplification à l’extrême des ingrédients utilisés lors du brassage permet d’en faciliter la création mais aussi et surtout d’apprécier les arômes de chaque ingrédient utilisé. Chaque variation que vous souhaiterez apporter à cette recette aura de grandes influences sur son goût. Idéalement, brassez votre bière et faites jouer une variable de votre choix (température, levure, dry hop…) et découvrez une infinité de résultats et de saveurs. C’est une recette réputée pour être plutôt bonne, elle est assez équilibrée. On y retrouvera des aromes boisés, épicés voire herbacés. L’utilisation d’un malt Pale Ale permet d’obtenir une bière qui aura du corps et l’ajout du houblon Fuggle en début d’ébullition contribuera à donner une légère amertume agréable qui viendra contrebalancer le corps de la bière. Brassez-en une première version et faites là évoluer en fonction de vos envies.",
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
      '  "2": "Après avoir bien remué mon malt pour éviter les grumeaux, je procède à un empâtage mono-palier 1h à 66°C",'\
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
