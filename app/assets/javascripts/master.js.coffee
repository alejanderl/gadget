# General javascript for small apps


# setup the name space 
jQuery ->
	

    window.Gadgets.add_fields = (link, association, content) ->
        new_id = new Date().getTime();
        regexp = new RegExp("new_" + association, "g")
        $(link).parent().before(content.replace(regexp, new_id));



window.Gadgets = window.Gadgets || {}