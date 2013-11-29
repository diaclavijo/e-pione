class CreateNeurologicalExaminations < ActiveRecord::Migration
  def change
    create_table :neurological_examinations do |t|
      t.integer :f1
      t.integer :f2
      t.integer :f3
      t.integer :f4
      t.integer :f5
      t.integer :f6
      t.integer :f7
      t.integer :f8
      t.integer :f9
      t.integer :f10
      t.integer :f11
      t.integer :f12
      t.integer :f13
      t.integer :f14
      t.integer :f15
      t.integer :f16
      t.integer :f17
      t.integer :f18
      t.integer :f19
      t.integer :f20
      t.integer :f21
      t.integer :f22
      t.integer :f23
      t.integer :f24
      t.integer :f25
      t.integer :f26
      t.integer :f27
      t.integer :f28
      t.integer :f29
      t.integer :f30
      t.integer :f31
      t.integer :f32
      t.integer :f33
      t.integer :f34
      t.integer :f35
      t.integer :f36
      t.integer :f37
      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
