require 'rubygems'
require 'sqlite3'

$csz_db = SQLite3::Database.new('csz.db')
$csz_db.results_as_hash = true
@@total_rows = $csz_db.execute2("select count(*) from us").to_s.to_i


module Imposter
class CSZ
	class << self
	
		def get
			@@csz_get = $csz_db.execute2("select city,state,zip5 from us")[1+rand(@@total_rows-1)]
		end

		def zip5
			@@csz_get['zip5']
		end
		def state(zip5=nil)
			@@csz_get['state']
		end
		
		def city(zip5=nil)
			@@csz_get['city']
		end
	end
   end
end
