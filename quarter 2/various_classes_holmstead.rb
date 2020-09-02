############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Various Classes
#  Assignment Date:   01/21/2019
#  Class:             CIS 283
#  Description:       Create a program which implements Ruby Classes to store object information
#
############################################################


class Person

  def initialize (first_name, last_name, age, hair_color, eye_color)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @hair_color = hair_color
    @eye_color = eye_color
  end


  # start first name
  # Getter
  def first_name
    @first_name
  end

  # Setter
  def first_name=(new_first_name)
    @first_name = new_first_name
  end
  #end first name

  # start last name
  # Getter
  def last_name
    @last_name
  end

  # Setter
  def last_name=(new_last_name)
    @last_name = new_last_name
  end
  # end last name

  # start age
  # Getter
  def age
    @age
  end

  # Setter
  def age=(new_age)
    @age = new_age
  end
  # end age

  #start Hair color
  # Getter
  def hair_color
    @hair_color
  end

  # Setter
  def hair_color=(new_hair_color)
    @hair_color = new_hair_color
  end
  # end hair color

  # start eye color
  # Getter
  def eye_color
    @eye_color
  end

  # Setter
  def eye_color=(new_eye_color)
    @eye_color = new_eye_color
  end
  # end eye color

  def to_s

    "\n#{first_name} #{last_name} \n Age: #{age}\nHair: #{hair_color}\nEyes: #{eye_color}\n"

  end
end

class Address

  def initialize(line_one, line_two, city, state, zip)
    @line_one = line_one
    @line_two = line_two
    @city = city
    @state = state
    @zip = zip
  end

  # start line 1
  # getter
  def line_one
    @line_one
  end

  # setter
  def line_one=(new_line_one)
    @line_one = new_line_one
  end
  # end line 1

  # start line 2
  # getter
  def line_two
    @line_two
  end

  # setter
  def line_two=(new_line_two)
    @line_two = new_line_two
  end
  #end line 2

  # start city
  # getter
  def city
    @city
  end

  # setter
  def city=(new_city)
    @city = new_city
  end
  #end city

  # start state
  # getter
  def state
    @state
  end

  # setter
  def state=(new_state)
    @state = new_state
  end
  #end state

  # start zip
  # getter
  def zip
    @zip
  end

  # setter
  def zip=(new_zip)
    @zip = new_zip
  end
  #end zip

  #to string
  def to_s
    "\nAddress:\n#{line_one}\n#{line_two}\n#{city} #{state} #{zip}"
  end
end

class Character


  def initialize(name, race, hit_points, gold)
    @name = name
    @race = race
    @hit_points = hit_points
    @weapons = []
    @gold = gold
    @clothing = []
  end

  #start name
  # getter
  def name
    @name
  end
# setter
  def name=(new_name)
    @name = new_name
  end
  #end name

  # start race
  # getter
  def race
    @race
  end
  # setter
  def race=(new_race)
    @race = new_race
  end
  # end race

  # start hit points
  # getter
  def hit_points
    @hit_points
  end
  # setter
  def hit_points=(new_points)
    @hit_points = new_points
  end
  #end hit points

  # start weapons
  # getter
  def weapons
    @weapons.join(", ")
  end
  # setter
  def weapons=(weapons)
    @weapons = weapons
  end
  #end weapons

  # start gold
  # getter
  def gold
    @gold
  end
  # setter
  def gold=(new_amount)
    @gold = new_amount
  end
  # end gold

  # start clothing
  # getter
  def clothing
    @clothing.join(", ")
  end
  # setter
  def clothing=(clothing)
    @clothing = clothing
  end
  #end of clothing

  # to string
  def to_s
    "\nName: #{name}\nRace: #{race}\nHit Points: #{hit_points}\nWeapons: #{weapons}\nGold: #{gold}\nClothing: #{clothing}\n"
  end

  # weapon management

  def add_weapon(new_weapon)
    @weapons << new_weapon
  end

  def drop_weapon(weapon_to_drop)
    @weapons.delete(weapon_to_drop)
  end

  # clothing management
  def add_clothing(item)
    @clothing << item
  end

  def drop_clothing(item_to_drop)
    @clothing.delete(item_to_drop)
  end

end

