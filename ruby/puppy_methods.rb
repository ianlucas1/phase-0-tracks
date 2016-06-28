class Ninja

  def initialize 
    puts "Behold, a ninja is born ..."
  end

  def karate_chops(num_of_chops)
    puts "The ninja chops #{num_of_chops} times."
  end

  def roundhouse_kicks(num_of_kicks) 
      puts "The ninja roundhouse kicks #{num_of_kicks} times."
  end

end

ninja_ary = []

3.times { |ninja|
  ninja = Ninja.new
  ninja_ary << ninja
}

ninja_ary.each { |ninja|  ninja.karate_chops(2) }
ninja_ary.each { |ninja|  ninja.roundhouse_kicks(3) }

p ninja_ary