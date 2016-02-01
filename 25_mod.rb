module Ex25

  # This function will break up words for us.
  def Ex25.break_words(stuff)
    words = stuff.split(' ')
    return words
  end

  def Ex25.sort_words(words)		  #self
		return break_words(words).sort    
  end

  # Prints the first word after shifting it off.
  def Ex25.print_first_word(words)			#se implicito, non riesco a chiamarlo dal modulo stesso
		return break_words(words).shift   
  end

  # Prints the last word after popping it off.
  def Ex25.print_last_word(words)
		return break_words(words).pop
  end

  # Takes in a full sentence and returns the sorted words.
  def Ex25.sort_sentence(sentence)
    return Ex25.sort_words(sentence)
  end

  # Prints the first and last words of the sentence.
  def Ex25.print_first_and_last(sentence)
    return Ex25.print_first_word(sentence) ,	Ex25.print_last_word(sentence)
  end

  # Sorts the words then prints the first and last one.
  def Ex25.print_first_and_last_sorted(sentence)
    return sentence.split(' ').sort.first , sentence.split(' ').sort.last
  end

end