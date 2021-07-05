# Base class for Rails models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
