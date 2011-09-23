ActiveRecord::Schema.define do
  create_table :balloons, :force => true do |t|
    t.integer "id"
    #t.column "gadgets", "set('propeller','tail gun','gps')", :default => 'propeller,gps', :null => false
    t.string "ribbons", :default => "green,gold", :null => false
    t.column "gasses", "set('helium','hydrogen')"
  end
end
