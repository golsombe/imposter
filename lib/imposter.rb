require 'rubygems'
require 'faker'
require 'fastercsv'
require 'pathname'
require 'date'
require 'active_support'

require 'imposter/noun'
require 'imposter/verb'
require 'imposter/animal'
require 'imposter/vegtable'
require 'imposter/mineral'
require 'imposter/csv'

module Imposter
	
	def self.gencsv(filename,cnt,fields,values)
		puts "    #{filename.sub(/.csv/,'')}..."
		vl = values	
		l = Array.new
		m = Array.new(cnt,0)
		FasterCSV.open(filename,"w") do |csv|
			csv << fields
			#begin
			(1..cnt).each do |i|
				vl.each do |v|
					begin 
						l << eval(v)
					rescue
						puts "Error evaluating " + v.to_s + " in " + filename
					end
				end
				m[i,0] = l
				csv << l
				l.clear
			end
			#rescue
			#	puts "Some format/data error in  " + filename
			#end
		end
		return m
	end

	def self.getfixtures
		fixtures_dir = Dir.glob("test/fixtures/*.csv")
		#Loading existing CSV structures
		fixtures_dir.each do |fixture_csv|
			fn = Pathname.new(fixture_csv).basename.to_s.chomp(File.extname(fixture_csv))
			eval("@" + fn + "= FasterCSV.open(fixture_csv,'r').to_a") 
		end	
	end

	def self.parseyaml(yamlfilename)
		imp_yaml = YAML.load(File.read(yamlfilename))
		#mn = Pathname.new(yamlfilename).basename.to_s.chomp(File.extname(yamlfilename))
		mn = imp_yaml.first[0]
		imp_values = imp_yaml[mn]["fields"].values
		imp_fields = imp_yaml[mn]["fields"].keys
		imp_qty = imp_yaml[mn]["quantity"]
		#load existing csv as array assigned to @[csv] variable
		#process yaml to csv
		rl = gencsv("test/fixtures/" + mn.pluralize + ".csv",imp_qty,imp_fields, imp_values) 
		eval("@" + mn.pluralize + "= rl")
	end

	def self.genimposters
		models_dir = Dir.glob("test/imposter/*.yml")
		#puts models_dir
		models_dir.each do |imposter_yaml|
			getfixtures #reloading each time to get model level data		
			parseyaml(imposter_yaml)
		end	
	end

      def announce(message)
        text = "#{@version} #{name}: #{message}"
        length = [0, 75 - text.length].max
        write "== %s %s" % [text, "=" * length]
      end

	def self.numerify(number_string)
		number_string.gsub(/#/) { rand(10).to_s }
	end

	def self.letterify(letter_string)
		letter_string.gsub(/\?/) { ('a'..'z').to_a.rand }
	end

	def self.pattern(string)
		self.letterify(self.numerify(string))
	end
end
