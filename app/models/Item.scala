package models


case class Item( 
  name: String,
  slug: String,
  sku: String,
  description: String,    
  active: Boolean
)


object JsonFormats {


  import play.api.libs.json.Json

  // Generates Writes and Reads for Feed and User thanks to Json Macros
  implicit val itemFormat = Json.format[Item]


}