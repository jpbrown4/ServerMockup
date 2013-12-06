class ApiController < ApplicationController

	def index
		getpluginnames
	end

	def show
		if params[:name]
			@name = params[:name]
			@urlname = params[:name].gsub ' ', '%20'
		else
			@name = "Cool%20Plugin"
		end
		getlatestcoolplugin
		getcompatibleplugins
		getcompatibleagents
		getcompatibleservers
	end

	def getpluginnames
		response = RestClient.get 'http://localhost:3000/plugins/getnames.json'
		if response
			if response =='null'
				@pluginnames = []
			else
				@pluginnames = JSON.parse response
			end
		end
	end

	def getlatestcoolplugin
		response = RestClient.get 'http://localhost:3000/plugins/getlatestversion/'+@urlname+'.json'
		if response
			if response =='null'
				@response = 'null'
			else
				@response = JSON.parse response
			end
		end
	end

	def getcompatibleplugins
		response = RestClient.get 'http://localhost:3000/plugins/getcompatibleplugins.json?name='+@urlname
		if response
			if response =='null'
				@response2 = 'null'
			else
				@response2 = JSON.parse response
			end
		end
	end

	def getcompatibleagents
		response = RestClient.get 'http://localhost:3000/plugins/getcompatibleagents.json?name='+@urlname
		if response
			if response =='null'
				@response3 = 'null'
			else
				@response3 = JSON.parse response
			end
		end
	end

	def getcompatibleservers
		response = RestClient.get 'http://localhost:3000/plugins/getcompatibleservers.json?name='+@urlname
		if response
			if response =='null'
				@response4 = 'null'
			else
				@response4 = JSON.parse response
			end
		end
	end
end
