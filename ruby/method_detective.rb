# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

# "iNvEsTiGaTiOn".swapcase == "InVeStIgAtIoN"
# => “InVeStIgAtIoN”

# "zom".insert(2, 'o') # => “zoom”
# => “zoom”

# p "enhance".center(15)  
# => "    enhance    "

# "Stop! You’re under arrest!".upcase  
# => "STOP! YOU’RE UNDER ARREST!"

# "the usual".concat(" suspects")
# => "the usual suspects"

# "suspects".prepend("the usual ")
# "the usual".insert(-1, ' suspects')
# => "the usual suspects"

# "The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"

# "The mystery of the missing first letter".byteslice(1..39)
# "The mystery of the missing first letter".slice(1..-1)
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"

# "z".codepoints
# "z".ord
# => 122 
# (z appears to be the 122nd character in a set of characters)

# "How many times does the letter 'a' appear in this string?".count "a"
# "How many times does the letter 'a' appear in this string?".count('a')
# => 4