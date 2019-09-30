module Services
  module Tradeable
    module Roles
      module Trader
        def credentials
          return { name: self.full_name, email: self.email, user_id: self.id, room_id: self.room }
        end
      end
    end
  end
end
