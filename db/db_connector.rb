require 'mysql2'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "eca82013",
        :database => "social_media_db"
    )
    client
end