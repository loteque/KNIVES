# Knives ART!


A 2D, pixel art side-scrolling, rogue-lite looter beatem up.

Like street champs


## Must Have
- loot: 
	- [x]  starter weapons: super mythic rare
		- [x] shovel - physical damage. small chance to do psychological damage back
		- [x] garden hoe - magic damage. small chance to do dark damage back
		- [x] hammer - physical damage. small chance to stun enemy. small chance to hit self
		- [x] wrench - physical damage. small chance to knock back enemy. 
	- [x] helmets x8 7 rare 1 mythic rare
		- [x] crit helm -increase crit damage (set bonus)
		- [x] circlet of wealth - attack cost increase gives bonus to attaack damage (set bonus)
		- [x] fire helm -apply more fire (set bonus)
		- [x] ice helm - apply more ice (set bonus)
		- [x] tocque - apply more bleed (set bonus)
		- [x] fedora - apply more dark (set bonus)
		- [x] clean suit helm - apply more poison (set bonus)
		- [x] self ice helm - reduce damage taken by amount of ice on self (set bonus) - mythic rare
	- [x] swords x12 1 common 2 uncommon 3 rare 6 mythic rare
	- [x] daggers x12 5 common 4 uncommon 2 rare 1 mythic rare
- scenes:
	- [ ] home is the title scene.
		- title is present until the player moves then it fades out after a few seconds, slow fade
	    - room with exit door - starts the run
	    - spot to hold one thing each: (this is the stuff you have equiped and you don't drop when you escape a run.)
	        - helm or special * (nice to have)
	        - primary weapon or special
	        - secondary weapon or special * (nice to have)
	- [ ] pause - all need: text, hover text
	    - settings - audio settings mainly
	    - inventory - can manage inventory in pause menu.
	    - drop bag and escape - lose all loot but what is equiped. equip will appear in home.
	    - continue - unpause
	    - new run - exit immediately, keep nothing, start over from scratch.
	- [ ] settings
	    - music vol - slider, slider knob
	    - soundfx vol - slider, slider knob
	    - discovered tracks player* - play button, pause pause
	- [ ] credits
	    - scrolling credits
- levels: 
	- [ ] city rooftop exterior	
	- [ ] city ground level exterior		
	- [ ] factory exterior
	- [ ] bridge exterior
	- [ ] street signs, one visually represents normal difflculty, one represents increased difficulty
- enemies:
    - [ ] skeletons
    - [ ] auto-attack
- gameplay ui:
    - count bars: bar container, bar fill
        - [ ] health bar 
        - [ ] energy bar
	- [ ] backpack wheel/item selection wheel
        - hold down key to pop up
        - use right left keys/buttons to hover over items along wheel path
        - press slot key to equip while holding down pop up key
        - equiped item goes into inventory, selected item is imediately equiped
    - [ ] character loadout
        - shows the icons for equipment that is currently equiped
    - [ ] damage display 
        color flash shader on character, color based on critical or dmg amt, white low, yellow mid, orange high, red critical hit normal, purple crit high 
    - [ ] enemy AI: state and condition
	- follow
	- attack
	- idle
# Gameplay Systems
 - level switcher
 - inventory system (backpack)
	- limited inventory 6-12
    - dictionary
	-  what is a thing?
		- string id that references a resource
		- a resource is a list of dat that objects can consume
		- there are magic weapons that care about weapon types in inventory 
			- these are small bonuses that add up
- battle system 
	- player can choose right or left to defeat enemys, right is normal left is hard
	- is rt collision shape system with damage modifiers?
	- proximity to enemy enters battle mode
	- button mash to damage, traditional beatem-up style
	- do damage based on gear
	- enemy attacks with it's own stats
	- they attack each other in real time based on their stats
	- the player can switch their equipment, any equip in any slot, can equip anything anywhere, but matching items to correct slots give best bonuses
	- the player can switch equipment at anytime through pause menu -> inventory menu
	- if the enemy or enemy group dies they drop loot from loot pool
	- some amount of things are dropped from loot pool player can add them to inventory
	- they can move to either side of the screen to leave
	- left is same difficulty right is difficulty increase
- effect system
	- items in inventory give a small bonus
	- item stats:
		- damage
		- attack speed
		- accuracy
		- in-inventory bonus
- player character movement
	- run right
	- run left
	- dodge (to move past an anemy)
	- attack
- enemy AI
	- move towards player
	- attack
	- idle
- enemy stats
	- health
	- damage
- weapon stats
	- damage
	- cooldown
### Jonny Notes
- can always punch
- no blocking 
- no armor
- reduce scope until taking away the next thing 

# Stretch (nice to have):
## Collectables (cosmetic, fun):
----
- poratraits (art) [unplanned]
- tapes (music) (+ bandcamp DL codes?) [unplanned]
## Stretch helms
----
- [ ] stuns apply bonus equiped magic damage (set bonus)
- [ ] increase accuracy by amount enemy is reduced (set bonus)
- [ ] increase critical damage by amount of fire on self (set bonus)
- [ ] AOE increase, damage increased forshort time by amount of AOE applications (set bonus)
## Specails (usable collectibles) - super mythic rare
----
- [ ] swiftfoot boots - increase attacak speed, attacks have chance to apply dark to self
- [ ] magicians cloak - increase magic damage, decrease physical dmg, chance to apply dark to self and enemies
- [ ] night vision goggles - increase physical damage, decrease magic
- [ ] bionic arm - self damage give increase to crit chance
- [ ] talisman of insight - increase loot chance
- [ ] sandals of RNJesus - when loot drops chance to upgrade loot quality
- [ ] helmet of hermes - chance for extra loot when loot drops
- [ ] theif's dagger - garuntee drop every 4th kill
- [ ] wizard's golfing gloves - when loot drops, chance to downgrade loot quality
## Character stats
----
- [ ] health bar 
- [ ] energy bar
- [ ] magic bar * (nice to have)
- [ ] poison bar * (nice to have)
- [ ] madness (psyc) bar * (nice to have)
- [ ] dark bar * (nice to have)
- [ ] bleed bar * (nice to have)
- [ ] ice bar * (nice to have)
- [ ] fire bar * (nice to have)
## Consumables
----
- potion item * (nice to have)
- orb * (nice to have)
## weapon stats
----
- [ ] magic bar * (nice to have)
- [ ] poison bar * (nice to have)
- [ ] madness (psyc) bar * (nice to have)
- [ ] dark bar * (nice to have)
- [ ] bleed bar * (nice to have)
- [ ] ice bar * (nice to have)
- [ ] fire bar * (nice to have)