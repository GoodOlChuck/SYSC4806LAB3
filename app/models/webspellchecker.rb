class WebSpellchecker < Spellchecker

  def initialize()
  
  end
  
  def known(words)
    
    #words.each do |x|
      #result.push(DictionaryWord.select("word","count").where("word = ?", x))
    #end
    #result.order("count DESC")
    
    result = DictionaryWord.select("word, count").where(word: words).order(count: :desc)
    resmap = result.map{|x| x[:word]}
    if resmap.empty? 
      return [] 
    else
      return resmap
    end
  end

end
