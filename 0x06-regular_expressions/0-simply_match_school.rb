#!/usr/bin/env ruby

# Check if an argument is provided
if ARGV.empty?
  puts "Please provide an argument."
  exit 1
end

# Define the regular expression to match "School" at the end of the string
pattern = /School$/

# Get the argument from the command line
input_string = ARGV[0]

# Match the regular expression against the input string
match_result = pattern.match(input_string)

# Print the result
if match_result
  puts "Match: #{match_result[0]}"
else
  puts "No match."
end
