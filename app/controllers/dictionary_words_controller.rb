require 'json'

class DictionaryWordsController < ApplicationController
  def spellcheck
    input_word = params[:term]
   
    spellcheck = WebSpellchecker.new
    words = spellcheck.correct(input_word)
    hash = { "term"=>input_word, "known"=>spellcheck.known([input_word]).any?, "suggestions"=>words}
    render :json=>hash
  end
end
