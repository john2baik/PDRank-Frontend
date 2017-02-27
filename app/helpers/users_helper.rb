module UsersHelper

  #makes gravatar for a user
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravaatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravaatar_url, alt: user.name, class: "gravatar")
  end
end
