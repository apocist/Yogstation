//OFFSETS - Used so that each general like "group" of achievements can be added to w/o fucking up the whole incremental pattern we got going on.
//DO NOT MAKE OFFSET VALUES THAT ARE GREATER THAN 2^15 OR LESS THAN 128.
//TO BE HONEST THIS OFFSET DOESN'T EVEN NEED TO BE POWER OF TWO, THOUGH.
#define GREENTEXT 256 // An offset for new greentext-related achievements, to keep the incremental pattern.
#define REDTEXT 512 // Offset for redtexts.

/datum/achievement
	var/name = "achievement"
	var/desc = "Please make an issue on github, including this achievement's name and how you got it."
	var/id = 0 //Should be incremented so every achievement has a unique ID
	var/hidden = FALSE // Whether or not this achievement's description is hidden untill you accomplish this (doesn't apply to the online viewer)

/datum/achievement/bubblegum
	name = "Kick Ass and Chew Bubblegum"
	desc = "Kill Bubblegum, the king of slaughter demons." //Should be improved(?)
	id = 1

/datum/achievement/roboborg
	name = "I Live Again"
	desc = "As a roboticist, create a cyborg"
	id = 2

/datum/achievement/defib
	name = "Lifesaver"
	desc = "Successfully defibrillate someone"
	id = 3

/datum/achievement/pa_emag
	name = "Catastrophe"
	desc = "Emag a particle accelerator"
	id = 4
	hidden = TRUE

/datum/achievement/flukeops
	name = "Reverse Card"
	desc = "As a member of the crew, deal a humiliating defeat to the nuclear team"
	id = 5

/datum/achievement/greentext/nukewin
	name = "Delta Alert"
	desc = "As a nuclear operative, score a major or minor victory"
	id = 6

/datum/achievement/honorarynukie
	name = "Honorary Nukie"
	desc = "Kill yourself using the nuclear authentication disk"
	id = 7
	hidden = TRUE
  
/datum/achievement/badass
	name = "Badass Syndie"
	desc = "As a traitor, complete your objectives without buying any items"
	id = 8

/datum/achievement/jones
	name = "Lead Lined"
	desc = "Survive an explosion while inside of a freezer"
	id = 9
	hidden = TRUE

/datum/achievement/greentext/wizwin
	name = "Scholars of the Arcane"
	desc = "As a wizard, complete your objectives"
	id = 10

/datum/achievement/cpr
	name = "Breath of Life"
	desc = "Perform CPR on someone..."
	id = 11

/datum/achievement/anticpr
	name = "Breath of Death"
	desc = "... with incompatible lungs"
	id = 12
	hidden = TRUE

/datum/achievement/greentext/changelingwin
	name = "The Thing"
	desc = "As a changeling, complete your objectives"
	id = 13

/datum/achievement/greentext/slingascend
	name = "The Dark Shadow"
	desc = "As a shadowling, ascend successfully"
	id = 14

/datum/achievement/death
	name = "Flatlined"
	desc = "You died"
	id = 15

/datum/achievement/cremated
	name = "Back to Carbon"
	desc = "Get cremated"
	id = 16

/datum/achievement/cremated_alive
	name = "Burn in Hell"
	desc = "Get cremated... alive"
	id = 17
	hidden = TRUE

/datum/achievement/Poly_silent
	name = "Silence Bird!"
	desc = "As a signal technician, create a script that mutes poly"
	id = 18
	hidden = TRUE

/datum/achievement/Poly_loud
	name = "Embrace the Bird!"
	desc = "As a signal technician, create a script that makes poly LOUD"
	id = 19
	hidden = TRUE
  
/datum/achievement/cargoking
	name = "King of Credits"
	desc = "As the QM, beat the current record of cargo credits: " //theoretically, if someone manages to get to an amount that's larger than 1992 digits, this'd break DB things
	id = 20
	var/amount = 0

/datum/achievement/cargoking/New()
	.=..()
	var/datum/DBQuery/Q = SSdbcore.NewQuery("SELECT value FROM [format_table_name("misc")] WHERE `key` = 'cargorecord'")
	Q.Execute()
	if(Q.item.len)
		amount = Q.item[1]
	qdel(Q)
	desc += "[amount]"

/datum/achievement/likearecord
	name = "You Spin Me Round"
	desc = "Use a surgical drill to spin right round like a record baby"
	id = 21
	hidden = TRUE
  
/datum/achievement/ducatduke
	name = "Duke of Ducats"
	desc = "As the QM, have a million cargo credits by the end of the round" //Cargoking-junior
	id = 22

/datum/achievement/keycard_auth
	name = "On my authority"
	desc = "Trigger a keycard authentication device event, by yourself."
	id = 23

// The achievements that are basically just "greentext as this sort of antag"

/datum/achievement/greentext
	name = "Green Text"
	desc = "As an antagonist, achieve your first green text"
	id = GREENTEXT + 1

/datum/achievement/greentext/ratvar
	name = "Clock Work"
	desc = "As a servant of Ratvar, summon Ratvar"
	id = GREENTEXT + 2

/datum/achievement/greentext/ratvar/eminence
	name = "Clock Work"
	desc = "As the Eminence, summon Ratvar"
	id = GREENTEXT + 3

/datum/achievement/greentext/narsie
	name = "Blood Rites"
	desc = "As a member of blood cult, summon Nar-Sie"
	id = GREENTEXT + 4

/datum/achievement/greentext/narsie/master
	name = "Master of Blood"
	desc = "As a cult master, summon Nar-Sie"
	id = GREENTEXT + 5

/datum/achievement/greentext/revolution
	name = "Down with Nanotrasen"
	desc = "As a revolutionary, complete your objectives"
	id = GREENTEXT + 6

/datum/achievement/greentext/revolution/head
	name = "Viva la Revolution!"
	desc = "As a head revolutionary, complete your objectives"
	id = GREENTEXT + 7

/datum/achievement/greentext/gang
	name = "Turf War"
	desc = "As a gang member, take over the station"
	id = GREENTEXT + 8

/datum/achievement/greentext/gangleader
	name = "\"I have built my organization upon fear.\""
	desc = "As a gang leader, take over the station"
	id = GREENTEXT + 9

/datum/achievement/greentext/blob
	name = "Grey Goo"
	desc = "As a blob, complete your objectives"
	id = GREENTEXT + 10

/datum/achievement/greentext/clownop
	name = "\"You wouldn't get it\""
	desc = "As a clown operative, score a major or minor victory"
	id = GREENTEXT + 11

/datum/achievement/greentext/internal
	name = "Triple Cross"
	desc = "As an internal affairs agent, complete your objectives"
	id = GREENTEXT + 12

/datum/achievement/greentext/external
	name = "Quadruple Cross"
	desc = "As an external affairs agent, complete your objectives"
	id = GREENTEXT + 13

/datum/achievement/greentext/disease
	name = "Space Aids"
	desc = "As a sentient disease, survive and complete your objectives"
	id = GREENTEXT + 14

/datum/achievement/greentext/pirate
	name = "Yaaaahr!"
	desc = "As member of the pirate crew, collect sufficient bounty from the crew"
	id = GREENTEXT + 15

/datum/achievement/greentext/vampire
	name = "Count de Ville"
	desc = "As a vampire, complete your objectives"
	id = GREENTEXT + 16

/datum/achievement/greentext/revenant
	name = "From The Shadows"
	desc = "As a revenant, complete your objectives"
	id = GREENTEXT + 17

//end-greentext

//start-redtext
/datum/achievement/redtext
	name = "Mission Failed, We'll Get'em Next Time"
	desc = "As an antagonist, fail your objectives."
	id = REDTEXT + 1

/datum/achievement/redtext/winlost
	name = "Arcane Failure"
	desc = "As a wizard, fail your objectives."
	id = REDTEXT + 2
	hidden = TRUE
//end-redtext

#undef GREENTEXT
#undef REDTEXT