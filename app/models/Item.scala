package models


import org.joda.time.DateTime


case class Item( 
  name: String,
  slug: String,
  sku: String,
  price: Option[BigDecimal],
  cost: Option[BigDecimal],
  description: String,
  creationDate: Option[DateTime],
  updateDate: Option[DateTime],
  active: Boolean
)


object JsonFormats {


  import play.api.libs.json.Json

  // Generates Writes and Reads for Feed and User thanks to Json Macros
  implicit val itemFormat = Json.format[Item]


}