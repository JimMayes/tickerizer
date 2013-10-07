require "tickerizer/version"

module Tickerizer
	class Configuration
		attr_accessor :license_id

		def initialize
			self.license_id = nil
		end
	end

	def self.configuration
		@configuration ||= Configuration.new
	end

	def self.configure
		yield(configuration) if block_given?
	end

	class << self
		attr_accessor :license_id

		def license_id
	    	raise "OpenCalais License ID is required" unless @license_id
	    	@license_id
	    end
	end

	def self.extract(content)
		resp = Calais.enlighten(
			:content => content,
			:content_type => :raw,
			:output_format => :json,
			:license_id => Tickerizer.configuration.license_id
		)

		self.process( JSON.parse(resp) )
	end

	def self.process(data)
		companies = Array.new

		data.each do |node|
			if node[1]["_type"] == "Company"
				company = {:name => node[1]["name"], :relevance => node[1]["relevance"].to_f}
				company[:ticker] = node[1]["resolutions"][0]["ticker"] if node[1]["resolutions"]

				companies << company
			end
		end

		companies.sort_by{|company| company[:relevance]}.reverse!
	end
end
