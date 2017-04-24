module UsersHelper

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end


  #def avatar_for(user, size: 80)
  #  image_tag("/public/system./users/avatars/000/000/#{user.id}/square/#{user.avatar_file_name}",size: '130x100')
  #end
end
