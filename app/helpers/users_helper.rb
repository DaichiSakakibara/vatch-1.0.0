module UsersHelper

  def veg_choice(user)
    html = ''
     case user.veg_id 
       when 2 
        html += image_tag('vegan.png')
       when 3 
        html += image_tag('lacto.png') 
       when 4 
        html += image_tag('lacto_ovo.png') 
       when 5 
        html +=  image_tag('pesco.png') 
       when 6 
        html += image_tag('pollo.png') 
       when 7 
        html += image_tag('from_now_on.png') 
       end 
       return raw(html)
  end


end
