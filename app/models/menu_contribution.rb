class MenuContribution < ActiveRecord::Base
	validates_inclusion_of :type, :in => %w( paid made )
end
