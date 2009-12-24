require 'rubygems'
require 'sqlite3'
require 'pathname'
require 'active_support'

db_file = Pathname.new(__FILE__).dirname  + "//"
$csz_db =SQLite3::Database.new(db_file + "csz.db")
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
class Street
	class << self
		Names = %w(1st First 2nd 3rd Third 4th Fourth 5th Fifth 6th Sixth 7th Seventh 8th Eighth 9th Nineth 10th Tenth Maple Kennedy Central Elm Washngton State Country Acres Douglas Laurel Jefferson Wall Street Main Roosevelt Walnut Tyler Hickory Market Broadway Forest Park Birch Spruce Taylor Beech Oak Sycamore Wood Grant Lincoln Taft Poplar)
		Types = %w(Highway Hwy Expressway Expy Freeway Fwy Motorway Mtrwy Avenue Ave Boulevard Blvd Road Rd Street St Alley Aly Bay Drive Dr Fairway Gardens Gdns Gate Grove Grv Heights Hts Highlands Knoll Knl Lane Ln Manor Mnr Mews Passage Psge Pathway Pthwy Place Pl Row Terrace Ter Trail Trl View Vw Way Close Court Ct Cove Cv Croft Garth Green Grn Lawn Nook Place Pl Circle Cir Crescent Cres Loop Oval Quadrant Square Sq Canyon Cyn Causeway Cswy Grade Hill Hl Mount Mt Parkway Pkwy Rise Vale)
		Directions = %w(N. S. E. W. NE. NW. SE. SW.)
		def name
			Names.shuffle[0,1]
		end

		def type
			return_type=Types.shuffle[0,1]
		end

		def direction
			Directions.shuffle[0,1]
		end

		def full
			st_num = (100+rand(99999))
			rnd_addr = st_num.to_s+(['_']+name + ['_'] + type).to_s
			if (1+rand(5))<2 then
				rnd_addr += (['_']+direction).to_s.upcase
			end
			return rnd_addr.titleize
		end
	end
end

end
