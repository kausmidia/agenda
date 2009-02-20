class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nome
      t.string :login, :limit => 10
      t.string :password, :limit => 10
    end
    User.reset_column_information
    User.create :nome => 'admin', :login => 'admin', :password => 'admin'
  end

  def self.down
    drop_table :users
  end
end
