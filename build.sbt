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
  "mysql"                    % "mysql-connector-java"    % "5.1.18",
  "com.twitter"              % "finagle-core_2.11"       % "6.24.0",
  "com.twitter"              % "finagle-stream_2.11"     % "6.24.0",
  "com.twitter"              % "finagle-http_2.11"       % "6.24.0",
  "org.twitter4j"            % "twitter4j-core"          % "4.0.2",
  "net.liftweb"             %% "lift-json"               % "2.6",
  "com.mohiva"              %% "play-silhouette"         % "2.0",
  "net.codingwell"          %% "scala-guice"             % "4.0.0-beta5"
)
 