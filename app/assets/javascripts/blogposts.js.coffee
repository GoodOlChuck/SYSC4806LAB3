# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->     #when the page has loaded... do all this.
	# initialize current word to an empty string.
	word = ""
	$("#blogpost_contents").keypress (e) ->

		inp = String.fromCharCode(e.which) # get the 1-character string that the user typed
		if (inp.match(/[a-zA-Z]/)) #if this was a letter (use .match method and regular expression)
			#add letter to current word
			word += inp
			console.log(word)
		else
			if (word.match(/\w+/i)) # if the current word is a sequence of letters
				$.get window.location.origin + /spellcheck/ + word, (data) -> 
					console.log(data)
					if(data.known == false)
						if(data.suggestions == null)
							str = "The word "+data.term+" is unknown!"
						else
						    str = "The word "+data.term+" is unknown! Did you mean: " +data.suggestions[0]
						console.log(str)
						$("#spellcheck").text(str)
				word = ""
