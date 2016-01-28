class DictionaryWordsController < ApplicationController
  def spellcheck
    input_word = params[:term]
   
    render html: "We want to check the word "+input_word.html_safe
  end
end
