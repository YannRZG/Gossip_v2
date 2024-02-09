class RemoveColumnFromComment < ActiveRecord::Migration[7.1]
  def change
    remove_reference :comments, :gossip, index: true
  end
end
