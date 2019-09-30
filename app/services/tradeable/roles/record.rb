module Services
  module Tradeable
    module Roles
      module Record
        lines = %w(buyer seller item)
        lines.each do |line|
          define_method("write_#{line}") do
            self.line = JSON.stringify()
          end
        end
      end
    end
  end
end
