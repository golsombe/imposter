require 'rubygems'
require 'activerecord'
require 'pathname'
require 'activesupport'
require 'ftools'

class ImposterGenerator < Rails::Generator::Base
	dbc = YAML.load(File.read('config/database.yml'))
	conn = ActiveRecord::Base.establish_connection(dbc["development"])

	def manifest
	   record do |m|	
		puts "Generating"
		if not File.directory? "test/imposter"
			Dir.mkdir("test/imposter")
		end
		case ARGV.length
			when 1
				genmodel(ARGV[0])	
			else	
				genmodels
		end
           end
	end


	def genmodel(model_name)
		mn = Pathname.new(model_name).basename.to_s.chomp(File.extname(model_name))
		require model_name
		puts "                 " + mn	
		mh = Hash.new
		ma = Hash.new
		mf = Hash.new
		eval(mn.camelcase).columns.each do |mod|
			if mod.name.include? "_id" then
				vl = "@" + mod.name.sub("_id","").pluralize + "[rand(@" + mod.name.sub('_id','').pluralize + ".length)][1]"
				mh = {mod.name => vl}
				ma.merge!(mh)
			else
				case mod.type.to_s.downcase
					when 'string'
						case (1 + rand(3))
							when 1					
								vl = 'Imposter::Noun.multiple'
							when 2
								vl = 'Imposter::Animal.one'
							when 3 
								vl = 'Imposter::Vegtable.multiple'
							when 4 
								vl = 'Imposter::Mineral.one'
						end
					when 'text' then 
						vl = 'Faker::Lorem.sentence(3)'
					when 'integer' then
						vl = 'i.to_s'
					when 'datetime' || 'date'
						vl = 'Date.today.to_s'
					when 'decimal' then
						vl = 'rand(50).to_s + "." + (1000+rand(2000)).to_s'
					else
						puts "=-------=============> " + mod.type.to_s.downcase
				end
				if not mod.name.include? "_at" and :include_special	
					mh = {mod.name => vl}
					ma.merge!(mh)
				end
			end
		end
		mf.merge!(mn => {"fields" => ma})
		mf[mn].merge!({"quantity" => 10})
		File.open("test/imposter/" + "%03d" % eval(mn.camelcase).reflections.count + "-" + mn  + ".yml","w") do |out|
		#+ Time.now.strftime("%Y%m%d%H%m%s") + "_" + mn + ".yaml","w") do |out|
			YAML.dump(mf,out)  
		end
	end

	def genmodels
		create_rake_file
		models_dir = Dir.glob("app/models/*.rb")
		models_dir.each do |model_dir|
			genmodel(model_dir)
		end	
	end

	def create_rake_file
		puts "Creating lib/tasks/databases.rake"
		File.copy( Pathname.new(__FILE__).dirname + "../lib/tasks/databases.rake", "lib/tasks/")
	end

end
