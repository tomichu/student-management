require 'rails_helper'

describe String do
	describe '#<<' do
		example 'Add chars' do
			s = "ABC"
			s << "D"
			expect(s.size).to eq(4)
		end
		example 'add nil' do
			pending('調査中')
			s = "ABC"
			s << "nil"
			expect(s.size).to eq(4)
		end	
	end
end

