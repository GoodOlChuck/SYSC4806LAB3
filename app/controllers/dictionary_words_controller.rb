require 'json'

class DictionaryWordsController < ApplicationController
  def spellcheck
    input_word = params[:term]
   
    spellcheck = WebSpellchecker.new
    words = spellcheck.correct(input_word)
    hash = { "term"=>input_word, "known"=>false, "suggestions"=>[]}
    if words.length > 0
      if words.length == 1
        hash["suggestions"]=["first"=>words.fetch(0)]
      elsif words.length == 2
        hash["suggestions"]=["first"=>words.fetch(0),"second"=>words.fetch(1)]
      else
        hash["suggestions"]=["first"=>words.fetch(0),"second"=>words.fetch(1),"third"=>words.fetch(2)]
      end
    end
    render json: hash.to_json
  end
end
