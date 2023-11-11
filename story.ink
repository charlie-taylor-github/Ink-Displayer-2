# author: Chris Hunneysett
VAR hour_count = 0
VAR HERO_groats = 0
VAR HERO_charisma = 0
VAR HERO_strength = 0
VAR HERO_wisdom = 0
VAR HERO_dexterity = 0
VAR HERO_food_total = 0
VAR HERO_drink_total = 0
VAR HERO_total_spell = 0
VAR HERO_weapon_2_ammo = 0
VAR HERO_weapon_3_ammo = 0
VAR HERO_weapon_4_ammo = 0
VAR HERO_weapon_5_ammo = 0
VAR HERO_weapon_6_ammo = 0
VAR HERO_weapon_7_ammo = 0
VAR HERO_weapon_8_ammo = 0
VAR HERO_weapon_9_ammo = 0
VAR HERO_weapon_10_ammo = 0
VAR ALLY_weapon_2_name_UC = "Dagger"
VAR ALLY_weapon_3_name_UC = "Club"
VAR ALLY_weapon_4_name_UC = "Mace"
VAR ALLY_weapon_5_name_UC = "Flail"
VAR ALLY_weapon_6_name_UC = "Axe"
VAR ALLY_weapon_7_name_UC = "Short sword"
VAR ALLY_weapon_8_name_UC = "Sword"
VAR ALLY_weapon_9_name_UC = "War hammer"
VAR ALLY_weapon_10_name_UC = "Long sword"
VAR ALLY_1_alive = "ALIVE"
VAR ALLY_1_name = "Chris"
VAR ALLY_1_charisma = 0
VAR ALLY_1_strength = 0
VAR ALLY_1_wisdom = 0
VAR ALLY_1_dexterity = 0
VAR ALLY_2_alive = "ALIVE"
VAR ALLY_2_name = "Jon"
VAR ALLY_2_charisma = 0
VAR ALLY_2_strength = 0
VAR ALLY_2_wisdom = 0
VAR ALLY_2_dexterity = 0
VAR ALLY_3_alive = "ALIVE"
VAR ALLY_3_name = "Steve"
VAR ALLY_3_charisma = 0
VAR ALLY_3_strength = 0
VAR ALLY_3_wisdom = 0
VAR ALLY_3_dexterity = 0
VAR ALLY_4_alive = "NO"
VAR ALLY_4_name = "Pete"
VAR ALLY_4_charisma = 0
VAR ALLY_4_strength = 0
VAR ALLY_4_wisdom = 0
VAR ALLY_4_dexterity = 0
VAR ALLY_5_alive = "NO"
VAR ALLY_5_name = "Pete"
VAR ALLY_5_charisma = 0
VAR ALLY_5_strength = 0
VAR ALLY_5_wisdom = 0
VAR ALLY_5_dexterity = 0
VAR ALLY_6_alive = "NO"
VAR ALLY_6_name = "Pete"
VAR ALLY_6_charisma = 0
VAR ALLY_6_strength = 0
VAR ALLY_6_wisdom = 0
VAR ALLY_6_dexterity = 0
VAR ALLY_7_alive = "NO"
VAR ALLY_7_name = "Pete"
VAR ALLY_7_charisma = 0
VAR ALLY_7_strength = 0
VAR ALLY_7_wisdom = 0
VAR ALLY_7_dexterity = 0
VAR ALLY_8_alive = "NO"
VAR ALLY_8_name = "Pete"
VAR ALLY_8_charisma = 0
VAR ALLY_8_strength = 0
VAR ALLY_8_wisdom = 0
VAR ALLY_8_dexterity = 0
VAR ALLY_9_alive = "NO"
VAR ALLY_9_name = "Pete"
VAR ALLY_9_charisma = 0
VAR ALLY_9_strength = 0
VAR ALLY_9_wisdom = 0
VAR ALLY_9_dexterity = 0
VAR ALLY_10_alive = "NO"
VAR ALLY_10_name = "Pete"
VAR ALLY_10_charisma = 0
VAR ALLY_10_strength = 0
VAR ALLY_10_wisdom = 0
VAR ALLY_10_dexterity = 0
VAR ALLY_11_alive = "NO"
VAR ALLY_11_name = "Pete"
VAR ALLY_11_charisma = 0
VAR ALLY_11_strength = 0
VAR ALLY_11_wisdom = 0
VAR ALLY_11_dexterity = 0
VAR ALLY_12_alive = "NO"
VAR ALLY_12_name = "Pete"
VAR ALLY_12_charisma = 0
VAR ALLY_12_strength = 0
VAR ALLY_12_wisdom = 0
VAR ALLY_12_dexterity = 0

LIST MISC = YES, NO, ALIVE, DEAD

- (Begin)
~ HERO_strength = RANDOM(5, 10)
~ HERO_groats = RANDOM(5, 10)
~ hour_count = RANDOM(5, 10)
Once upon a time...
+ [Go to station 1] -> station_1
+ [Go to station 2] -> station_2
+ [Go to to station 3] -> station_3
- (station_1)
# CLEAR
You're at station 1
~ do_this()
{hour_count > 0 && hour_count < 3:
~ ALLY_1_speaks()
}
{hour_count == 0: -> time_out}
{HERO_groats == 0: -> cash_out}
{HERO_strength == 0: -> strength_out}
{hour_count == 0: -> time_out}
+ [Go to to station 1] -> station_1
+ [Go to to station 2] -> station_2
+ [Go to to station 4] -> station_4
- (station_2)
# CLEAR
~ do_this()
You're at station 2
// example of how to play a sound
# SOUND Sound_1.wav
{hour_count > 0 && hour_count < 3:
~ ALLY_1_speaks()
}
{hour_count == 0: -> time_out}
{HERO_groats == 0: -> cash_out}
{HERO_strength == 0: -> strength_out}
+ [Go to to station 5] -> station_5
+ [Go to to station 1] -> station_1
+ [Go to to station 4] -> station_4
- (station_3)
# CLEAR
~ do_this()
You're at station 3
{hour_count > 0 && hour_count < 3:
~ ALLY_1_speaks()
}
{hour_count == 0: -> time_out}
{HERO_groats == 0: -> cash_out}
{HERO_strength == 0: -> strength_out}
+ [Go to to station 1] -> station_1
+ [Go to to station 5] -> station_5
+ [Go to to station 6] -> station_6
- (station_4)
# CLEAR
~ do_this()
You're at station 4
{hour_count > 0 && hour_count < 3:
~ ALLY_1_speaks()
}
{hour_count == 0: -> time_out}
{HERO_groats == 0: -> cash_out}
{HERO_strength == 0: -> strength_out}
+ [Go to to station 1] -> station_1
+ [Go to to station 2] -> station_2
+ [Go to to station 3] -> station_3
- (station_5)
# CLEAR
~ do_this()
You're at station 5
// example of how to change the image
# IMAGE IMAGE_LOSE.jpg
{hour_count > 0 && hour_count < 3:
~ ALLY_1_speaks()
}
{hour_count == 0: -> time_out}
{HERO_groats == 0: -> cash_out}
{HERO_strength == 0: -> strength_out}
+ [Go to to station 1] -> station_1
+ [Go to the junction] -> junction
+ [Go to to station 4] -> station_4
- (station_6)
# CLEAR
~ do_this()
You're at station 6
{hour_count > 0 && hour_count < 3:
~ ALLY_1_speaks()
}
{hour_count == 0: -> time_out}
{HERO_groats == 0: -> cash_out}
{HERO_strength == 0: -> strength_out}
+ [Go to to station 1] -> station_1
+ [Go to to station 2] -> station_2
+ [Go to to station 3] -> station_3
- (junction)
# CLEAR
~ do_this()
You're at the junction
{hour_count > 0 && hour_count < 3:
~ ALLY_1_speaks()
}
{hour_count == 0: -> time_out}
{HERO_groats == 0: -> cash_out}
{HERO_strength == 0: -> strength_out}
+ {HERO_groats < 4} [Go straight ahead] -> station_1
+ {HERO_groats > 3} [Go left] -> the_loser
+ {HERO_groats > 3} [Go right ]-> the_end
- (strength_out)
# CLEAR
You're out of strength!
- -> the_loser
- (cash_out)
# CLEAR
You're out of cash!
- -> the_loser
- (time_out)
# CLEAR
You're out of time!
- -> the_loser
- (the_loser)
- You lost!
~ ALLY_1_lose()
- (the_loser_2)
+ [Play again?]
# CLEAR
# RESTART
-> Begin
- (the_end)
# CLEAR
You win!
+ [Another journey?] 
# RESTART
-> Begin
- (the_end_2)
# CLEAR
# RESTART
-> END
=== function do_this() ===
~ HERO_strength = MAX(HERO_strength - 1, 0)
~ hour_count = MAX(hour_count - 1, 0)
~ HERO_groats = MAX(HERO_groats - 1, 0)
=== function ALLY_1_speaks() ===
{ALLY_1_name} {~cries|shouts}, 'You're {&nearly|almost} out of time!'
=== function ALLY_1_lose() ===
{ALLY_1_name} {~moans|groans|sighs|laughs|chuckles}, 'You {~fool|idiot|banana|raspberry}!'