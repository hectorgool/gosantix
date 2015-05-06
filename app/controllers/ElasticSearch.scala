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
import com.twitter.bijection.twitter_util._
import com.twitter.bijection.Conversion.asMethod


object ElasticSearch extends Controller with UtilBijections {


	def index = Action { request =>
		val json = request.body.asJson.get
		println("Got index json: " + json)		
		Ok(json)
	}

	def term = Action.async(parse.json) { request =>
 
 		val json = request.body
	    val futureScala = FinagleClient.documentSearch( json ).as[scala.concurrent.Future[org.jboss.netty.handler.codec.http.HttpResponse]]	    
 
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