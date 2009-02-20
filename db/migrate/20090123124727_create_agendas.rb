class CreateAgendas < ActiveRecord::Migration
  def self.up
    create_table :agendas do |t|
      t.string :empresa
      t.string :tipo
      t.string :cargo
      t.string :celular
      t.string :email
      t.text :endereco
      t.date :nascimento
      t.string :contato
      t.text :observacao

      t.timestamps
    end
  end

  def self.down
    drop_table :agendas
  end
end
