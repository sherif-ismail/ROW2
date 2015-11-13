class Question < ActiveRecord::Base
	require 'csv' 

  def self.import(file)
  	Question.delete_all
  	CSV.foreach(file.path, headers: true) do |row|
    Question.create! row.to_hash
  end
end
end
