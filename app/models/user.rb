class User < ApplicationRecord
    has_many :runs, dependent: :destroy
    before_save { email.downcase! }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ?   BCrypt::Engine::MIN_COST :
                                                        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Defines a proto-feed.
    # def feed
    #     Run.where("user_id = ?", id)
    # end

    # Filter by dates from-to
    def feed(opt = {})
        from_date = opt[:from]
        to_date = opt[:to]
        if !from_date.to_s.empty? && to_date.to_s.empty?
            Run.where(user_id: id, :created_at => from_date.to_time..Time.zone.now.to_time)
        elsif !from_date.to_s.empty? && !to_date.to_s.empty?
            Run.where(user_id: id, :created_at => from_date.to_time..to_date.to_time)
        else
            Run.where("user_id = ?", id)
        end
    end

    def report
        weeks = (Time.current - self.created_at.to_time).seconds.in_weeks.to_i.abs + 1
        results = {}
        # results[:weeks] = weeks
        # results[:create] = self.created_at
        (0..weeks).each do |w|
            from_date = w.weeks.ago.at_beginning_of_week
            to_date = w.weeks.ago.at_end_of_week
            runs = Run.where(user_id: id,:created_at => from_date.to_time..to_date.to_time)
            distance_total = 0
            time_total = 0
            if(!runs.empty?)
                runs.each do |run|
                    distance_total += run.distance
                    time_total += run.time
                end
            end
            results[w] = { speed: get_speed(time_total, distance_total), distance: distance_total } 
        end
        results
    end

    
    def get_speed(time, distance)
        time_s = time.to_i * 60
        distance_m = distance.to_f * 1000
        speed = distance_m / time_s
        total_seconds = 1000/speed
        minutes, seconds = total_seconds.divmod(60)
        seconds = seconds.round < 10 ? "0#{seconds.round}" : "#{seconds.round}"
        "#{minutes}:#{seconds}"
      end
end
