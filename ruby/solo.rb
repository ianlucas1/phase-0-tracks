# RELEASE 0: DESIGN A CLASS

  # Program name:  Shock and Awe, A War Game (note:  I haven't played a video game since Mario Kart in the mid-1990s)

  # Requirement 1: three attributes (using at least two data types) 
  # whose values will vary from instance to instance (example: age)

    # Initialize a military organization with the following attributes
    # A1: Branch (string like Air Force, Army, Navy, Marines, Coast Guard)
    # A2: Number of personnel (integer like 4,000)
    # A3: Weapon system types (string like Planes, Ships, Guns)
    # A4: Annual Budget (boolean where true = a high budget and false = a low budget)

  # Requirement 2: three methods, at least one of which takes an argument

    # M1: Wellness (string like R&R, offering-transition-assistance, upgrading-housing)
    # M2: Readiness (string like train, equip, stage supplies, spin-up)
    # M3: Combat Actions (string like deploy with a number of personnel, show-of-presence, 
    #     surgical-strike, shock-and-awe, battle-damage-assessment)

# RELEASE 1:  WRITE YOUR CLASS

class Shock_and_Awe

  def initialize(branch_type, num_of_personnel, weapons_systems, annual_budget)
    @branch_type = branch_type.capitalize
    @num_of_personnel = num_of_personnel
    @weapons_systems = weapons_systems.capitalize
    @annual_budget = annual_budget
  end

end
