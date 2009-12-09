require 'rubygems'
require 'sqlite3'

@db = SQLite3::Database.new('csz.db')

def postal(code=nil)
	case code
		when nil
			cnt = @db.get_first_value("select count(*) from us").to_i # could probably hardcode this since the data is static
									          # but I didn't really see a speed difference without it
			@db.execute2("select * from us")[1+rand(cnt-1)] 
		else
		 	@db.execute2("select * from us where postal = '" + code + "'") 
	end		

end

puts postal
