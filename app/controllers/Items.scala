package controllers

import play.api._
import play.api.mvc._
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import play.api.libs.functional.syntax._
import play.api.libs.json._
import scala.concurrent.Future

// Reactive Mongo imports
import reactivemongo.api._

// Reactive Mongo plugin, including the JSON-specialized collection
import play.modules.reactivemongo.MongoController
import play.modules.reactivemongo.json.collection.JSONCollection

/*
 * Example using ReactiveMongo + Play JSON library.
 *
 * There are two approaches demonstrated in this controller:
 * - using JsObjects directly
 * - using case classes that can be turned into Json using Reads and Writes.
 *
 * This controller uses JsObjects directly.
 * See UsingJsonReadersWriters.scala for the other approach.
 *
 * Instead of using the default Collection implementation (which interacts with
 * BSON structures + BSONReader/BSONWriter), we use a specialized
 * implementation that works with JsObject + Reads/Writes.
 *
 * Of course, you can still use the default Collection implementation
 * (BSONCollection.) See ReactiveMongo examples to learn how to use it.
 */
object Items extends Controller with MongoController {
  /*
   * Get a JSONCollection (a Collection implementation that is designed to work
   * with JsObject, Reads and Writes.)
   * Note that the `collection` is not a `val`, but a `def`. We do _not_ store
   * the collection reference to avoid potential problems in development with
   * Play hot-reloading.
   */
  def collection: JSONCollection = db.collection[JSONCollection]("items")

  //def index = Action { Ok("works") }

  /*
  def create(name: String, age: Int) = Action.async {
    val json = Json.obj(
      "name" -> name,
      "age" -> age,
      "created" -> new java.util.Date().getTime())

    collection.insert(json).map(lastError =>
      Ok("Mongo LastError: %s".format(lastError)))
  }
  */

  def createFromJson = Action.async(parse.json) { request =>

    import play.api.libs.json.Reads._
    /*
     * request.body is a JsValue.
     * There is an implicit Writes that turns this JsValue as a JsObject,
     * so you can call insert() with this JsValue.
     * (insert() takes a JsObject as parameter, or anything that can be
     * turned into a JsObject using a Writes.)
     */
    val transformer: Reads[JsObject] =
      Reads.jsPickBranch[JsString](__ \ "name") and
      Reads.jsPickBranch[JsString](__ \ "slug") and
      Reads.jsPickBranch[JsString](__ \ "sku") and
      Reads.jsPickBranch[JsString](__ \ "description") and
      Reads.jsPickBranch[JsBoolean](__ \ "active") reduce

    println(transformer)

    request.body.transform(transformer).map { result =>
      collection.insert(result).map { lastError =>
        Logger.debug(s"Successfully inserted with LastError: $lastError")
        Created
      }
    }.getOrElse(Future.successful(BadRequest("invalid json")))

  }

  def findByActive( active: Boolean ) = Action.async {
    // let's do our query
    val cursor: Cursor[JsObject] = collection.
      // find all people with name `name`
      find(Json.obj("active" -> active)).
      // sort them by creation date
      //sort(Json.obj("created" -> -1)).
      // perform the query and get a cursor of JsObject
      cursor[JsObject]

    // gather all the JsObjects in a list
    val futureItemsList: Future[List[JsObject]] = cursor.collect[List]()

    // transform the list into a JsArray
    val futureItemsJsonArray: Future[JsArray] = futureItemsList.map { items =>
      Json.arr( items )
    }

    // everything's ok! Let's reply with the array
    futureItemsJsonArray.map { items =>
      Ok( items )
    }
  }

  def findAllItems = Action.async {
    // let's do our query
    val cursor: Cursor[JsObject] = collection.
      // find all people with name `name`
      find(Json.obj("active" -> true)).
      // sort them by creation date
      //sort(Json.obj("created" -> -1)).
      // perform the query and get a cursor of JsObject
      cursor[JsObject]

    // gather all the JsObjects in a list
    val futureItemsList: Future[List[JsObject]] = cursor.collect[List]()

    // transform the list into a JsArray
    val futureItemsJsonArray: Future[JsArray] = futureItemsList.map { items =>
      Json.arr( items )
    }

    // everything's ok! Let's reply with the array
    futureItemsJsonArray.map { items =>
      Ok( items )
    }
  }


}
