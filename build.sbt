//********************************************************
// Play settings
//*************

name := """gosantix"""

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.11.1"

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache,
  ws,
  "com.twitter"              % "finagle-http_2.11"       % "6.25.0",
  "com.mohiva"              %% "play-silhouette"         % "2.0",
  "net.codingwell"          %% "scala-guice"             % "4.0.0-beta5",
  "com.twitter"              % "bijection-util_2.11"     % "0.7.2",
  "mysql"                    % "mysql-connector-java"    % "5.1.18",
  "com.typesafe.slick"       % "slick_2.11"              % "3.0.0",
  "org.reactivemongo"       %% "play2-reactivemongo"     % "0.10.5.0.akka23"
)
 