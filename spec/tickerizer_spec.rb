require 'spec_helper'

describe Tickerizer do
	context "has a response" do
		# Test parser against expected format

		# example OpenCalais response for "Google, Inc"
		data = JSON.parse("{\"doc\":{\"info\":{\"calaisRequestID\":\"4a3565f4-4180-e419-1419-02b26a32c0b3\",\"id\":\"http://id.opencalais.com/LvyWK4U7P6xyJEGM1u9mew\",\"docId\":\"http://d.opencalais.com/dochash-1/835e8fef-a4e4-3b91-89af-6060372f215b\",\"document\":\"Google, Inc\",\"docTitle\":\"\",\"docDate\":\"2013-10-06 18:47:29.169\"},\"meta\":{\"contentType\":\"text/raw\",\"emVer\":\"7.1.1103.5\",\"langIdVer\":\"DefaultLangId\",\"processingVer\":\"CalaisJob01\",\"submissionDate\":\"2013-10-06 18:47:29.059\",\"submitterCode\":\"8ff5522d-bcb1-c039-11e2-4512df0dcbd9\",\"signature\":\"digestalg-1|6cRb/b8lNBNmGWvmnJfUzVqYEGg=|EqIXLG3DYFkjtLYC8Ga1ILuTHmN/i06L+DVAHC4mRPxXJGlzcB8ARQ==\",\"language\":\"InputTextTooShort\"}},\"http://d.opencalais.com/dochash-1/835e8fef-a4e4-3b91-89af-6060372f215b/lid/DefaultLangId\":{\"_typeGroup\":\"language\",\"language\":\"http://d.opencalais.com/lid/DefaultLangId/InputTextTooShort\"},\"http://d.opencalais.com/comphash-1/230b96d5-1757-3e7f-8e8b-e81f7861a91a\":{\"_typeGroup\":\"entities\",\"_type\":\"Company\",\"name\":\"Google Inc\",\"nationality\":\"N/A\",\"_typeReference\":\"http://s.opencalais.com/1/type/em/e/Company\",\"instances\":[{\"detection\":\"[]Google, Inc[]\",\"exact\":\"Google, Inc\",\"offset\":0,\"length\":11}],\"relevance\":0.857,\"resolutions\":[{\"id\":\"http://d.opencalais.com/er/company/ralg-tr1r/ce181d44-1915-3387-83da-0dc4ec01c6da\",\"score\":1,\"name\":\"GOOGLE INC.\",\"shortname\":\"Google\",\"ticker\":\"GOOG\",\"symbol\":\"GOOG.OQ\"}]}}")

		it "should retrieve company name" do
			name = Tickerizer.process( data ).first[:name]

			name.should eq("Google Inc")
		end

		it "should retrieve a relevance score" do
			relevance = Tickerizer.process( data ).first[:relevance]

			relevance.should eq(0.857)
		end

		it "should retrieve stock ticker" do
			ticker = Tickerizer.process( data ).first[:ticker]

			ticker.should eq("GOOG")
		end
	end
end
