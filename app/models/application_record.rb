class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true







  #assosiation
  def generate_random_uids
    Entity.where(uid: nil).update_all("uid = format('%08d', rand(10**8))")
  end

end
