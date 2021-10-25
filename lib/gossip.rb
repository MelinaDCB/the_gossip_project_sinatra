require 'csv'

class Gossip
    attr_accessor :author, :content, :id
	
	def initialize(author,content)

		@author = author
		@content = content

	end

    def save

		CSV.open("db/gossip.csv", "a") do |csv|
  			csv << [@author,@content]
		end

	end

    def self.all
        
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips

    end

    def self.find(id)

		self.all.each_with_index do |row,index|
			if index == id.to_i
				return row
			end
		end

	end
end