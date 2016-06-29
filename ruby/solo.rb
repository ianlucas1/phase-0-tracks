# RELEASE 0: DESIGN A CLASS

  # Program name:  Shock and Awe, A War Simulator 

  # (side comment:  I haven't played a video game since Mario Kart in the mid-1990s 
  #  and I'm not exactly a military expert)

  # Requirement 1: three attributes (using at least two data types) 
  # whose values will vary from instance to instance (example: age)

    # Initialize a military organization with the following attributes
    # A1: Branch (string like Air Force, Army, Navy, Marines, Coast Guard)
    # A2: Number of personnel (random integer between 20 and 1 million)
    # A3: Weapon system types (string like Planes, Ships, Guns)
    # A4: Annual Budget (random boolean where true = a high budget and false = a low budget)

  # Requirement 2: three methods, at least one of which takes an argument

    # M1: Wellness (string like R&R, offering-transition-assistance, upgrading-housing)
    # M2: Readiness (string like train, equip, stage supplies, spin-up)
    # M3: Combat Actions (string like deploy with a number of personnel, show-of-presence, 
    #     surgical-strike, shock-and-awe, battle-damage-assessment)

  # Randomly choose branch, randomly choose conditional weapons systems, give a score, provide BDA

# RELEASE 1:  WRITE YOUR CLASS

class Force

  attr_reader :branch_type
  attr_accessor :num_of_personnel, :weapons_systems, :annual_budget

  def initialize(branch_type, num_of_personnel, weapons_systems, annual_budget)
    @branch_type = branch_type.capitalize
    @num_of_personnel = num_of_personnel
    @weapons_systems = weapons_systems.capitalize
    @annual_budget = annual_budget
  end

end

# Arrays for initialization
    Branch_ary = %w[ Air Force, Army, Navy, Marines, Coast Guard ]
    Weapon_systems_ary = %w[ planes ships guns ]

fighting_force_ary = []

1.upto(3) { |force|
  fighting_force_ary << Force.new("#{force}", Branch_ary.sample, rand(20..1000000), Weapon_systems_ary.sample, [true, false].sample)  
}

  #santas[0].age = 2 #testing attr_accessor method
  #santas[0].gender = "Male" #testing attr_accessor method
  #p santas[0].ethnicity #testing getter/attr_reader method
