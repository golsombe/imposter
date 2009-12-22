require 'rubygems'
require 'sqlite3'

$csz_db = SQLite3::Database.new('csz.db')
$csz_db.results_as_hash = true
$total_rows = $csz_db.execute2("select count(*) from us")


module Imposter
class CSZ
	class << self
	
		def get_rand
			rand_row = (1+rand($total_rows[1][0].to_i - 1)).to_s
			@@csz_get = $csz_db.execute2("select city,state,statefull,zip5 from us limit " +  rand_row  + ",1")[1]
		end

		def get_rand_state(st=nil)
			rand_row =  (1 + rand($csz_db.execute2("select count(*) from us where upper(state)='"+ st.upcase + "'")[1][0].to_i - 1)).to_s 
			@@csz_get = $csz_db.execute2("select city,state,statefull,zip5 from us where state='" + st.upcase + "' limit " +  rand_row  + ",1")[1]
		end
		
		def get_rand_city(cty = nil)
			rand_row =  (1 + rand($csz_db.execute2("select count(*) from us where upper(city)='"+ cty.upcase + "'")[1][0].to_i - 1)).to_s 
			@@csz_get = $csz_db.execute2("select city,state,statefull,zip5 from us where upper(city)='" + cty.upcase + "' limit " +  rand_row  + ",1")[1]
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
