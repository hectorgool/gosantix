package controllers


import play.api._
import play.api.mvc._
import lib._
import scala.concurrent.{Future}
import scala.util.{Failure, Success}
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import com.twitter.io.Charsets
import org.jboss.netty.util.CharsetUtil
import play.api.libs.json.Json
import play.api.libs.json.JsValue


object ElasticSearch extends Controller {


	def index = Action { request =>
		val json = request.body.asJson.get
		println("Got index json: " + json)		
		Ok(json)
	}

	def term = Action.async(parse.json) { request =>
 
	    val futureFinagle = FinagleClient.documentSearch( request.body )          
	    val futureScala = Santix.twitter2Scala( futureFinagle)
 
	    futureScala.map( f => 
	    	Ok( Json.parse( f.getContent.toString(CharsetUtil.UTF_8) ) ) 
	    )	    
	    
	}
	
  	def beta(json: JsValue) = Action.async {

	    val futureFinagle = FinagleClient.documentSearch( json )
	    val futureScala = Santix.twitter2Scala( futureFinagle)
 
	    futureScala.map( f => 
	    	Ok( "Got result: " + Json.parse(f.getContent.toString(CharsetUtil.UTF_8)) ) 
	    )

  	}


}