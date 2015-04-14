package controllers


import play.api._
import play.api.mvc._
import lib.FinagleClient._
import net.liftweb.json._
import play.api.libs.json.Json


object ElasticSearch extends Controller {

	/*
	def index( term:String ) = Action {
  		//documentSearch( json )
    	Ok("Your new application is ready.")
  	}
  	*/

	def index = Action { request =>
		val json = request.body.asJson.get
		//val stock = json.as[Stock]
		//documentSearch( json )
		println(json)
		Ok
	}


}