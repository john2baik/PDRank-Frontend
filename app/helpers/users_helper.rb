module UsersHelper

  #makes gravatar for a user
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def avatar_for(user, size: 80)
    image_tag("/public/system./users/avatars/000/000/#{user.id}/square/#{user.avatar_file_name}",size: '130x100')
  end
end
