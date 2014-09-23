require 'sinatra'

configure :test do
  db = URI.parse(ENV['DATABASE_URL'] || 'jdbcpostgres://Sinatra:supersecure@localhost:5433/sin-rest-test')

  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'jdbcpostgres' ? 'jdbcpostgresql' : db.scheme,
      :host => db.host,
      :port => db.port,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )
end

configure :development do
  db = URI.parse(ENV['DATABASE_URL'] || 'jdbcpostgres://Sinatra:supersecure@localhost:5433/sin-rest')

  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'jdbcpostgres' ? 'jdbcpostgresql' : db.scheme,
      :host => db.host,
      :port => db.port,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )
end