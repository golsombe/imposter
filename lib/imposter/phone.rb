require 'rubygems'
require 'imposter'

module Imposter

class Phone
    class << self
      def number(format=nil)
        if not format.nil? then
	     Imposter.numerify(format)
	else
	     Imposter.numerify(Formats.rand)
	end
      end
    end
      
    
    Formats = [
      '###-###-####',
  		'(###)###-####',
  		'1-###-###-####',
  		'###.###.####',
  		'###-###-####',
  		'(###)###-####',
  		'1-###-###-####',
  		'###.###.####',
  		'###-###-#### x###',
  		'(###)###-#### x###',
  		'1-###-###-#### x###',
  		'###.###.#### x###',
  		'###-###-#### x####',
  		'(###)###-#### x####',
  		'1-###-###-#### x####',
  		'###.###.#### x####',
  		'###-###-#### x#####',
  		'(###)###-#### x#####',
  		'1-###-###-#### x#####',
  		'###.###.#### x#####'
  	]
  end
end