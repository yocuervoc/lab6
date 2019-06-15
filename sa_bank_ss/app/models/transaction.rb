class Transaction < ApplicationRecord
    belongs_to :sourceAccount, :class_name => 'Account'
    belongs_to :targetAccount, :class_name => 'Account'
  end
