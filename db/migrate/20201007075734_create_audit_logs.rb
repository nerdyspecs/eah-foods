class CreateAuditLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :audit_logs do |t|
      t.string :user
      t.string :action
      t.string :description

      t.timestamps
    end
  end
end
