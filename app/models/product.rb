class Product < ApplicationRecord
def time
created_at.strftime("%b %d, %Y")
end


end
