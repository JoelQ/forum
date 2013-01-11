class NullUser
  def username
    'Anonymous'
  end

  def has_role?(role)
    role.to_s == 'guest'
  end
end
