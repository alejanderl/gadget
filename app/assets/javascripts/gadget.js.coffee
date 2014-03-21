
#setup the name space
window.Gadgets = window.Gadgets || {}

class Gadgets.GadgetBuilder
   
    constructor:(init_form_values) ->
        @init_form_values  = init_form_values
        @button_add        = $("#add_image")
        @questions_field   = $('#images')
        @question_counter  = 1
        _this = this
        this.set_bind =>


    set_bind:=>

    	$( @button_add ).on "click", =>

    		attributes = {}
    		attributes["random"] = Math.floor(Math.random()*12213413)
    		_this.questions_field.append Mustache.to_html($('#gadget_image').html(), attributes)
    	$(".remove_old_image").on "click" , -> 
            $(".destroy",$(this).parents(".input-group")).val 1
            $(this).parent().parent().fadeOut("1000")



    	$(document).on "click", ".remove_new_image" , ->
    		$(this).parents("li.new_image").toggle "1000" , ->
    			$(this).remove()
