//
//  Global.swift
//  shout
//
//  Created by Zachary Fertig on 4/24/22.
//

import Foundation
import SwiftUI
import DesignSystem

class Global: ObservableObject {
	
	@AppStorage("first") var first:Bool = true
	@AppStorage("deckNames") var deckNames = "Shout! Classic.txt,Easy Pickins.txt,Tough Crowd.txt"
	
	@AppStorage("decksOn") var decksOn = "true,false,false"
	@Published var deckDict: [Deck] = []
	
	var deck1 = "Cars,Bodies of Water,Hobbies,Food/Drink That Is Green,Things You Do at Work,School Subjects,Internet Lingo,Trees,Magazines,Things You Throw Away,Things That You Wear,Things That Have Wheels,Something You're Afraid Of,Television Stars,Spicy Foods,Things That Make You Smile,Cooking Utensils,Companies,Games,Cartoon Characters,Words Associated With Exercise,Methods of Transportation,Websites,Athletes,Things That Are Cold,Sports Played Indoors,Heroes,Reptiles/Amphibians,Ice Cream Flavors,Junk Food,Ethnic Foods,Things in a Souvenir Shop,Terms of Endearment,School Supplies,Languages,Breakfast Foods,Fruits,Words Associated With Money,Things With Tails,Car Parts,Acronyms,Spices/Herbs,Things You See at the Zoo,Words With Double Letters,Pizza Toppings,Menu Items,Famous Duos and Trios,Street Names,Sandwiches,Things in the Sky,Farm Animals,Bad Habits,Computer Parts,Famous Females,Kinds of Candy,Gifts/Presents,Childrens Books,Card Games,Footware,Vehicles,Vacation Spots,Types of Drink,Animals in Books or Movies,Game Terms,Things That Have Stripes,Things You Store Items In,Things You Shout,Foods You Eat Raw,Desserts,Things Found in New York,Things to Do at a Party,Capitals,Things You Make,Sports,Nicknames,Tropical Locations,Things in a Park,Historical Figures,Authors,Things Found in a Desk,Ways to Kill Time,Household Chores,Personality Traits,Flowers,Footwear,Reasons to Call ,Excuses for Being Late,Items in a Suitcase,Honeymoon Spots,Stones/Gems,Weekend Activities,Words Associated With Winter,People in Uniform,Countries,Things That Can Get You Fired,Crimes,Holiday Activities,Items You Take on a Trip,Places in Europe,Things You Save Up to Buy,Things at a Football Game,Things That Are Found in the Ocean,Toys,Things You Shouldn't Touch,A Girl's Name,U.S. Cities,Math Terms,Terms of Measurement,Insects,Things in a Medicine Cabinet,Kinds of Dances,Things Found in a Hospital,T.V. Shows,Reasons to Take Out a Loan,Musical Instruments,Dairy Products,Notorious People,Things at a Circus,Things You Buy for Kids,Things You Get Tickets For,Items in a Vending Machine,Appliances,Furniture,Board Games,Things That Are Sticky,Things That Grow,Diseases,Olympic Events,Vegetables,Types of Weather,Product Names,Something You Keep Hidden,Pro Sports Teams,Animals,Things You Replace,Book Titles,Birds,Things That Jump/Bounce,World Leaders/Politicians,Leisure Activities,Song Titles,Parts of the Body,Things That Can Kill You,Fish,Sports Equipment,Electronic Gadgets,Kinds of Soup,Cosmetics/Toiletries,Articles of Clothing,Things That Have Buttons,Things on a Beach,Titles People Can Have,Types of Drinks,Colleges/Universities,College Majors,Colors,Things You're Allergic To,Fictional Characters,Items in a Refrigerator,Presidents,Things That Have Spots,Restaurants,Seafood,Computer Programs,Musical Groups,Diet Foods,Video Games,Awards/Ceremonies,Things at a Carnival,Villains/Monsters,Wireless Things,Historic Events,Items in a Kitchen,Halloween Costumes,Beers,Items in Your Purse/Wallet,Four-Letter Words,Names Used in Songs,Foreign Cities,A Boy's Name,Christmas Songs,Weapons,Words Ending in -N,Names Used in the Bible,Celebrities,Medicine/Drugs,Items in This Room,Things That Use a Remote,Things You Do Every Day,Things to Do on a Date,Reasons to Make a Phone Call,Tools,Occupations,Movie Titles,Things You Plug In,Things You Get in the Mail,Things in a Grocery Store,Items in a Catalog,Things Made of Metal,Reasons to Quit Your Job,Things Found at a Bar,Items You Save Up to Buy,States,Offensive Words,Store Names,Parks,Things That Are Round,Tourist Attractions,Things That Are Black,Places to Hang Out,Foreign Words Used in English,Things Found on a Map,Software,Things You Sit In/On"
	var deck2 = "Actress,Ball game,Book,Cold drink,Color,Female name,Food,Gas,Gem,Hair product,Highschool,Metal,Month,Natural disaster,Park,Phone brand,Pizza topping,River,Root vegetable,School supply item,Seafood,Street name,Water sport,Weather,Website,Writing utensil,Actor,Beach item,Berry,Boardgame,City,Creepy-crawly,Dessert,Electronic device,Hobby,Ice cream flavour,Jewellery,Lake,Language,Liquid,Male name,Monster,Mountain,Planet,School course,Singer,Something in your bedroom,Sushi,Toiletries item,Vehicle,War,Winter sport,Breakfast food,Bridge,Caffeinated drink,Cake,Canyon ,Card game,Carnival ride,Christmas Carol,Condiment,Cookie,Country,Domesticated animal,Emoji,Flower,Nut,Organ,Outdoor activity,Pizza chain/brand,Sandwich,Sea,Shape,Super Power,Things that cost a fortune,Tropical fruit,Utensil,Verb,A shiny thing,Swimwear,Bad weather,Bear,Crystal,Drink,European country,Ocean,Footwear,Frozen dessert,Sport,Kitchen appliance,Metallic object,Mode of transportation,Musician,Odd number,Pants,Positve emotion,Multiple of 3 ,Soup,Things that float,Tree,Vegan friendly food,Winter clothing,Burger,Boat,Pop song artist,Video game character,Religious holiday,Disney princess,TV series,American president,Animated film,Social media platform,Film genre,Weapon of mass destruction,Asian dish,Flying creature,Spice/herb,Carnival Ride,Phobia,Tourist destination,Boy band,Traffic sign,Dance style,Café,Striped animal,String instrument,Flightless bird,Shoe brand,Song released this year,Mythological creature,Clothing brand,Car part,Metric unit,3-letter acronym,Asian language,Sharp item,Video game console,Processed food,Allergy,African country,American state,Star Wars character,Fantasy film,Post-secondary school,Phone app,Book genre,Proper noun,Fast food restaurant,Disease,Car brand,Negative emotion,Rapper,Bank,Mammal,Multiple of 4,French word,Historical event,European dish,Religious figure,Wind instrument,Soft drink brand,Things that spin,Imperial unit,Kids TV Series,Pixar character,South American country,Book series,Composer,Fictional weapon,Celestial body,Explosive material,Arachnid,Famous Painting,Spanish word,Crime,Shampoo brand,Mythological flying creature,Birthstone ,Muscle,Candle scent,Billionaire,Spy/secret agent,X-men character,Film Director,Dog breed,Mountain range,Old-school tech,Magical item,Pronoun,Fungus,Conifer,Marsupial,Sports shoe brand,McDonald's mascot,Apple product,Internet browser,Nocturnal Creature,Queen,Aquatic mammal,Disney Song,Bladed weapon,Sidekick,Wizard,Cartoon,Santa's reindeer,Medicine,Chocolate brand,National anthem,Fabric,Tropical Island Destination ,Predatory fish,First world problem,Zodiac sign,Gas station,Driving hazard,University,Musical film,Percussion instrument,Word that begins with Z,Jedi,Asian country,Sea Creature,Library,Waterfall"
   var deck3 = "Amino acid,Romantic era musician ,Programming language,Foreign film,South American dish,Historical general,Fictional metal/mineral,Celebrity birthday,Professional wrestler ,Vine star,Poisonous mushroom ,Engine part,Brain region,Irrational number,Landlocked country,Eastern Philosopher,Chess opening,J-Pop Band,Academic journal,Enzyme,Spanish Conquistador,Van Gogh Painting,Sci-fi novelist,Adam Sandler Film,Alkaline earth metal,Bollywood film,Famous mural painting,Fictional language,Figure skater,Engineering Firm,Musical mode,Tsar,African language,Anime series,Chinese dynasaty,Conspiracy theory,Famous chef,Oxymoron,Poem,Radioactive atomic element,Screwdriver ,Steven Spielberg film ,YouTuber,Agricultural machinery,Carnivorous plant ,Disney villain,Famous movie quote,Heavy metal band,Holy city,Literary device,Onomatopoeia,Pokémon,Roman emperor,Shade of red,Alloy,Civil rights activist,Egg-laying mammal,Egyptian god,Evil corporation in fiction,Fictional planet,Films with time travel,Hymn,Insurance company,Pandemic,Poetic form,Bounty Hunter,Famous biologist,Sega character,Heist film,K-Pop Band,Limited Edition Starbucks Frappucino,Bacteria,Motorcylce brand,South American City,Pope,90's toy,2-player-only game,21st century innovation,Adverb,Ancient civilization,Asian capital city,Beatles song,Book of the Bible,Cat breed,Cloud formation,Country song,DC comic book character,Dictator,Documentary,Fictional alien,Flammable liquid,Moon,Mystery novel,Prime number,Romantic comedy film,Supervillian,Vintage car,Atomic element,Constellation,Deceased musician,Dinosaur,Doomsday scenario,Endangered species,Fictional technology,Film franchise,Horror film,Indian dish,Internet meme,K-pop song,Marvel comic book character,Middle Eastern country,Mobile network,Non-Fiction book,Nuclear weapon state,Purse brand,Soccer player,Venomous snake,Volcano,90's song,Bird of Prey,Nintendo character,First Lady,Sitcom,Filipino Cusine,Fashion designer,Alternative rock band,Image File Format,Custard dessert,Brand of sunglasses,Desert,King,Hockey Team,Cooking Show ,Greek letter,Crazy internet challenge,Skycraper,Star Trek Character,Musical symbol,Bubble gum brand,Poisonous plant,Wristwatch brand,Comedy actor,Greek god,Videogame boss,Brand of bottled water,Non-govermental organization,Breakup song,Hormone,Shakespeare play,Football Team,Yogurt brand,Wonder of the World,Archer,Projectile weapon,Asian currency,Secret society,Car sharing service,Pharoah,Michael Jackson song,Petroleum Product"
	
	init() {
		if first {
			first = false
			write(title: "Shout! Classic.txt", image: "circle1", items: deck1)
			write(title: "Easy Pickins.txt", image: "circle1", items: deck2)
			write(title: "Tough Crowd.txt", image: "circle1", items: deck3)
		}
		//deckDict.append(Deck(title: "Easy Pickins", cards: deck2, image: "circle1", isActive: false))
		//deckDict.append(Deck(title: "Tough Crowd", cards: deck3, image: "circle1", isActive: false))
		findCustomDecks()
		make()
	}
	
	func findCustomDecks() {
		readBool()
		let array = deckNames.components(separatedBy: ",")
		if array[0] != "" {
			for i in 0..<array.count {
				let period = array[i].index(array[i].firstIndex(of: ".")!, offsetBy: -1)
				let deckName = array[i][...period]
				
				let deckString = read(title: array[i])
				
				let whatsOn = decksOn.components(separatedBy: ",")
				
				if deckString != "" {
					deckDict.append(Deck(title: String(deckName), cards: splitDeck(deck: deckString), image: splitImage(deck: deckString), isActive: Bool(whatsOn[i])!))
				}
			}
		}
	}
	
	func make() {
		var catsArray = Array<String>()
		for deck in deckDict {
			if deck.isActive {
				catsArray.append(contentsOf: deck.cards)
			}
		}
		var catsString = catsArray[0]
		for i in 1..<catsArray.count {
			catsString = catsString + "," + catsArray[i]
		}
		let filename = getDocumentsDiretory().appendingPathComponent("categories.txt")
		do {
			try catsString.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
		} catch {
			print("failed")
		}
	}
	
	func writeBool(bools: String) {
		let filename = getDocumentsDiretory().appendingPathComponent("decksOn.txt")
		do {
			try bools.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
		} catch {
			print("failed")
		}
	}
	
	func readBool() {
		let filename = getDocumentsDiretory().appendingPathComponent("decksOn.txt")
		do {
			decksOn = try String(contentsOf: filename, encoding: .utf8)
		} catch {
			print("Unable to load saved profile data")
		}
	}
	
	func splitImage(deck: String) -> String {
		let comma = deck.index(deck.firstIndex(of: ",")!, offsetBy: -1)
		let deckImage = deck[...comma]
		//print(String(deckImage))
		return String(deckImage)
	}
	
	func splitDeck(deck: String) -> Array<String> {
		if deck.contains(",") {
			let comma = deck.index(deck.firstIndex(of: ",")!, offsetBy: 1)
			let deckCategories = deck.suffix(from: comma)
			//print(String(deckCategories).components(separatedBy: ","))
			return String(deckCategories).components(separatedBy: ",")
		}
		return [deck]
	}
	
	func getDocumentsDiretory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
	
	func read(title: String) -> String {
		let filename = getDocumentsDiretory().appendingPathComponent("\(title)")
		do {
			let data = try String(contentsOf: filename, encoding: .utf8)
			return data
		} catch {
			print("Unable to load saved profile data")
		}
		return ""
	}
	
	func write(title: String, image: String, items: String) {
		let listText = image + "," + items
		let filename = getDocumentsDiretory().appendingPathComponent("\(title)")
		do {
			try listText.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
		} catch {
			print("failed")
		}
	}
}
