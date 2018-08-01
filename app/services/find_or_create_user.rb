class FindOrCreateUser
  attr_reader :oauth_hash

  def initialize(oauth_hash)
    @oauth_hash = oauth_hash
  end

  def user
    @user = update_details(find_or_create_user)
  end

  private

  def find_or_create_user
    Teacher.find_by(uid: oauth_hash[:uid]) ||
      Teacher.find_by(email: info[:email]) ||
      Teacher.new
  end

  def info
    oauth_hash[:info]
  end

  def update_details(user)
    return nil unless user
    user.update!(
      name: info[:name],
      email: info[:email],
      uid: oauth_hash[:uid],
      avatar: info[:image]
    )
    user
  end
end
