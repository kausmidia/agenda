class Agenda < ActiveRecord::Base
#  acts_as_searchable :searchable_fields => [:empresa]
  belongs_to :login
  validates_presence_of :empresa, :message => 'não pode ficar vazio'
end
