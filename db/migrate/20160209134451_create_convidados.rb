class CreateConvidados < ActiveRecord::Migration
  def change
    create_table :convidados do |t|
      t.string :nome
      t.string :email
      t.integer :qtd_pessoas
      t.string :eventos
      t.text :menssagem

      t.timestamps null: false
    end
  end
end
