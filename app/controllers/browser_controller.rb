include Mongo

class BrowserController < ApplicationController

	def index
		mongo = MongoClient.new("localhost", 27017)
		@databases = mongo.database_names
	end

	def collections
		mongo = MongoClient.new("localhost", 27017)
		@dbname = params[:database]
		@db = mongo[@dbname]
		@collnames = mongo[@dbname].collection_names
	end

	def documents
		mongo = MongoClient.new("localhost", 27017)
		@coll = mongo[params[:database]].collection(params[:collection])
		@collname = params[:collection]
	end

	def docinspector
		mongo = MongoClient.new("localhost", 27017)
		@doc = mongo[params[:database]].collection(params[:collection]).find_one(BSON::ObjectId(params[:documentid]))
	end

end
