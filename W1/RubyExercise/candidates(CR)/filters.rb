# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |x|
    if x[:id] == id
      return x
    end
  end
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

# More methods will go below
def github_100?(candidate)
  candidate[:github_points] >= 100
end

def knowRnP?(candidate)
  candidate[:languages].include?('Ruby') && candidate[:languages].include?('Python')
end

def applied?(candidate)
  daysDiff = candidate[:date_applied]
  (Time.now.to_date - daysDiff) <= 15
end

def adult?(candidate)
  candidate[:age] > 17
end
