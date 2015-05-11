package models


case class Item( 
	//age: Int,
    //firstName: String,
    //lastName: String,
    name: String,
    description: String,
    slug: String,
    active: Boolean
)


object JsonFormats {


  import play.api.libs.json.Json

  // Generates Writes and Reads for Feed and User thanks to Json Macros
  implicit val itemFormat = Json.format[Item]


}