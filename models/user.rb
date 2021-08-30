require_relative '../db/db_connector'

class User
    attr_reader :id, :username, :email, :bio

    def initialize(params)
        @id = params["id"]
        @username = params["username"]
        @email = params["email"]
        @bio = params["bio"]
    end

    def valid?
        return false if @username.nil? || email.nil?
        true
    end

    def save
        return false unless valid?
        client = create_db_client
        client.query(
            "insert into users (username, email, bio) values ('#{username}', '#{email}', '#{bio}')"
        )
        user_id = client.query(
            "select last_insert_id() as id"
        )
        user_id.any? {|data| return data["id"]}
    end
end