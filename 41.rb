require 'open-uri'

WORD_URL = "http://learncodethehardway.org/words.txt"		#word list
WORDS = []

PHRASES = {
  "class ### < ###\nend" =>
       "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" =>
       "class ### has-a initialize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" =>
       "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" =>
       "Set *** to an instance of class ###.",
  "***.***(@@@)" =>
       "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" =>
       "From *** get the *** attribute and set it to '***'."
}

PHRASE_FIRST = ARGV[0] == "english"					#true se primo arg == english
	
open(WORD_URL) {|f|													#parse wrods list into array
  f.each_line {|word| WORDS.push(word.chomp)}
}

def craft_names(rand_words, snippet, pattern, caps=false)	#create an array with the exact number of words
  names = snippet.scan(pattern).map do							#scan for snippet, use the array size to count words to take
    word = rand_words.pop()													#act on param so no duplicates, uhm.
    caps ? word.capitalize : word
  end

  return names * 2			#why?
end

def craft_params(rand_words, snippet, pattern)
  names = (0...snippet.scan(pattern).length).map do			#stessa cosa
    param_count = rand(3) + 1														#the name that will be pushed to get changed is made out of 1-3 parameters
    params = (0...param_count).map {|x| rand_words.pop() }
    params.join(', ')
  end

  return names * 2
end

def convert(snippet, phrase)
  rand_words = WORDS.sort_by {rand}					#new order every call
  class_names = craft_names(rand_words, snippet, /###/, caps=true)
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = []

  [snippet, phrase].each do |sentence|			#actual substution taking place here
    # fake class names, also copies sentence
    result = sentence.gsub(/###/) {|x| class_names.pop }

    # fake other names
    result.gsub!(/\*\*\*/) {|x| other_names.pop }

    # fake parameter lists
    result.gsub!(/@@@/) {|x| param_names.pop }

    results.push(result)
  end

  return results
end

# keep going until they hit CTRL-D
loop do
  snippets = PHRASES.keys().sort_by {rand}		#randomize order 

  for snippet in snippets											#loop all before a new randomize
    phrase = PHRASES[snippet]
    question, answer = convert(snippet, phrase)		#take the current answer/question pair and plug it with random words

    if PHRASE_FIRST
      question, answer = answer, question
    end

    print question, "\n\n> "

    exit(0) unless $stdin.gets

    puts "\nANSWER:  %s\n\n" % answer
  end
end