# require modules here
require "yaml"

def load_library(directory)
  # code goes here
  emoticons = YAML.load_file(directory)
  result = {}
  emoticons.each { |name, array|
    result[name] = {
      english: array[0],
      japanese: array[1]
    }    
  }
  result
end

def get_japanese_emoticon(directory, emote)
  # code goes here
  hash = load_library(directory)
  hash.each { |name, array|
    if hash[name][0] == emote
      return hash[name][1]
    elsif hash[name][1] == emote
      return hash[name][1]
    end
  }
  "Sorry, that emoticon was not found"
end

def get_english_meaning(directory, emote)
  # code goes here
  hash = load_library(directory)
  hash.each { |name, array|
    if hash[name][1] == emote
      return name
    elsif hash[name][0] == emote
      return name
    end
  }
  "Sorry, that emoticon was not found"
end