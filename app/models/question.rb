class Question < ActiveRecord::Base
	require 'csv' 

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
    Question.create! row.to_hash
  end
end
end
